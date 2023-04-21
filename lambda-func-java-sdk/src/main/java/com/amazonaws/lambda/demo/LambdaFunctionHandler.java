package com.amazonaws.lambda.demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestStreamHandler;
import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.SubscribeRequest;
import com.amazonaws.services.sns.model.Subscription;
import com.amazonaws.services.sns.model.Topic;
import com.google.gson.Gson;

public class LambdaFunctionHandler implements RequestStreamHandler {

	@Override
	public void handleRequest(InputStream input, OutputStream output, Context context) throws IOException {
		
		System.out.println("Reading started...");
		Gson inputJson = new Gson();
		String responseMsg = "Test from CloudSpikes!!";
		String ak_value = System.getenv("AWS_AK");
		String sk_value = System.getenv("AWS_SK");
		String region_value = System.getenv("AWS_DEFAULT_REGION_VALUE");
		String aws_account_id = System.getenv("AWS_ACCOUNT_ID"); 
		BasicAWSCredentials awsCredentials = new BasicAWSCredentials(ak_value, sk_value);
		String inputString = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8)).lines()
				.collect(Collectors.joining("\n"));
		String topicName = "testJavaTopic_Demo";
		String topicArn = "arn:aws:sns:"+region_value+":"+aws_account_id+":"+topicName;

		System.out.println("Input received: " + inputString);

//		Transforming input received from API Gw to a Java JSON Object.
		sendNotification notificationObj = null;
		
		try {
			notificationObj = inputJson.fromJson(inputString, sendNotification.class);
		} catch (Exception e) {
			System.out.println("Error occured while processing input JSON: " + e.getMessage());
			e.printStackTrace();
		}

//		Printing the Object properties to debug if needed
		if (notificationObj != null) {
			System.out.println("Notification Msg: " + notificationObj.getNotificationMsg());
			System.out.println("Notification Subscribers: " + notificationObj.getNotificationSubscribers());
		}

//		Segregate subscriber list received in the API Gw input.
		String subscriberList = notificationObj.getNotificationSubscribers();
		String[] subscribers = subscriberList.split(",");

//		Check if the SNS Topic exists and if not, creating a new SNS Topic.
		AmazonSNSClient sns = new AmazonSNSClient(awsCredentials);
		List<Topic> topics = sns.listTopics().getTopics();
		boolean topicExists = false;
		for (int i = 0; i < topics.size(); i++) {
			System.out.println("SNS Topic ARN under scan: "+topics.get(i).getTopicArn());
			if (topics.get(i).getTopicArn().contains(topicName)) {
				topicExists = true;
			}
		}

		if (!topicExists) {
			sns.createTopic(topicName);
		} else {
			System.out.println("SNS Topic: " + topicName + " already exists.");
		}
		
//		Collecting existing SNS Subscribers list.
		List<Subscription> existingSubsList = sns.listSubscriptions().getSubscriptions();
		ArrayList<String> subsList = new ArrayList<String>(existingSubsList.size());
		for(int i=0; i<existingSubsList.size(); i++) {
			System.out.println("Endpoint at: "+i+" value is: "+existingSubsList.get(i).getEndpoint());
			subsList.add(existingSubsList.get(i).getEndpoint());
		}
		
//		Adding new Subscriber to the SNS Topic only if not already subscribed using Email protocol.
		for (int i = 0; i < subscribers.length; i++) {
			if(subsList.contains(subscribers[i])) {
				System.out.println("Subscriber: " + subscribers[i]+" already exists.");
			} else {
				System.out.println("Adding subscriber: " + subscribers[i]);
				SubscribeRequest subReq = new SubscribeRequest(topicArn, "email", subscribers[i]);
				sns.subscribe(subReq);
			}
		}
		
//		Publishing a new message to the SNS Topic to send a notification to the subscribed users.
		sns.publish(topicArn, notificationObj.getNotificationMsg());
		
		System.out.println("Lambda execution completed with responseData: " + responseMsg);
		
		output.write(responseMsg.getBytes());
	}
}