package com.amazonaws.lambda.demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBScanExpression;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Table;
import com.amazonaws.services.dynamodbv2.model.CreateTableRequest;
import com.amazonaws.services.dynamodbv2.model.ListTablesResult;
import com.amazonaws.services.dynamodbv2.model.ProvisionedThroughput;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestStreamHandler;
import com.google.gson.Gson;

public class LambdaFunctionHandler implements RequestStreamHandler {

	@Override
	public void handleRequest(InputStream input, OutputStream output, Context context) throws IOException {
		
		System.out.println("Reading started...");
		Gson inputJson = new Gson();
		String responseMsg = "Test from CloudSpikes!!";
		String ak_value = System.getenv("AWS_AK");
		String sk_value = System.getenv("AWS_SK");
		BasicAWSCredentials awsCredentials = new BasicAWSCredentials(ak_value, sk_value);
		String inputString = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8)).lines()
				.collect(Collectors.joining("\n"));
		String table_name = "customers";

		System.out.println("Input received: " + inputString);
		
//		Transforming input received from API Gw to a Java JSON Object.
		Customer customerDataObj = null;
		try {
			customerDataObj = inputJson.fromJson(inputString, Customer.class);
		} catch (Exception e) {
			System.out.println("Error occured while processing input JSON: " + e.getMessage());
			e.printStackTrace();
		}

//		Printing the Object properties to debug if needed
		if (customerDataObj != null) {
			customerDataObj.toString();
		} else {
			String errorMsg = "Unable to process HTTP Request JSON.";
			System.out.println(errorMsg);
			output.write(errorMsg.getBytes());
			return;
		}
		
		AmazonDynamoDBClient dynamoDbClient = new AmazonDynamoDBClient(awsCredentials)
        		.withRegion(Regions.US_EAST_1);
		DynamoDBMapper mapper = new DynamoDBMapper(dynamoDbClient);
		DynamoDB client = new DynamoDB(dynamoDbClient);
		
		CreateTableRequest tableRequest = mapper.generateCreateTableRequest(Customer.class);
		tableRequest.setProvisionedThroughput(new ProvisionedThroughput(1L, 1L));
		
//      Check if DynamoDB table exists, if not then create a new table.
        ListTablesResult tableList = dynamoDbClient.listTables();
        if(tableList.getTableNames().contains(table_name)) {
        	System.out.println("DynamoDB Table with name: "+table_name+" already exists.");
        } else {
        	System.out.println("Creating a new DynamoDB Table with table name: "+table_name);
        	
        	Table table = client.createTable(tableRequest);
    		
    		System.out.println("Waiting till DynamoDB Table gets created...");
    		try {
    			table.waitForActive();
    			System.out.println("DynamoDB Table got created successfully!!");
    		} catch (InterruptedException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			System.out.println("Unable to create DynamoDB Table: "+e.getMessage());
    		}
        }
		
//      Replacing customer ID with a unique value.
		String customerId = new RandomString(5).nextString();
		customerDataObj.setId(customerId);
		
		mapper.save(customerDataObj);
		System.out.println("Persisted "+customerDataObj.toString()+ " to Customer DynamoDB Table.");
		
//		Preparing to fetch all the data from the DynamoDB Table.
		DynamoDBScanExpression scanExpression = new DynamoDBScanExpression();
  
		List < Customer > scanResult = mapper.scan(Customer.class, scanExpression);

		System.out.println("Size of table: "+scanResult.size());
		
		for(int i=0; i<scanResult.size(); i++) {
			System.out.println("Table item index: "+i+" ");
			System.out.println("Table data: "+scanResult.get(i).toString());
			responseMsg = responseMsg + "CloudSpikes --> Table data for index: "+i+" "+scanResult.get(i).toString()+" \n";
		}

		
		System.out.println("CloudSpikes --> Lambda execution completed with responseData: " + responseMsg);
		
		output.write(responseMsg.getBytes());
	}
}
