package com.amazonaws.lambda.demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.stream.Collectors;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestStreamHandler;
import com.google.gson.Gson;

public class LambdaFunctionHandler implements RequestStreamHandler {

    @Override
    public void handleRequest(InputStream input, OutputStream output, Context context) throws IOException {

    	Gson inputJson = new Gson();
    	String inputString = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8)).lines()
				.collect(Collectors.joining("\n"));
    	
    	System.out.println("Starting Lambda func");
    	System.out.println("Input received: " + inputString);
    	
//		Transforming input received from API Gw to a Java JSON Object.
		PetData petDataObj = null;
		try {
			petDataObj = inputJson.fromJson(inputString, PetData.class);
		} catch (Exception e) {
			System.out.println("Error occured while processing input JSON: " + e.getMessage());
			e.printStackTrace();
		}

//		Printing the Object properties to debug if needed
		if (petDataObj != null) {
			System.out.println("Pet Name: " + petDataObj.getPetName());
			System.out.println("Owner Name: " + petDataObj.getOwnerName());
			System.out.println("Dog Species: " + petDataObj.getDogSpecies());
			
			String insertResponse = new MysqlCon().insertData(petDataObj.getPetName(), 
					petDataObj.getOwnerName(), petDataObj.getDogSpecies());
			
			System.out.println("Insertion operation: "+insertResponse);
		}
    	
    	String responseMsg = new MysqlCon().getData();
        
        System.out.println("Ending Lambda func, responseMsg: \n "+responseMsg);
        
        output.write(responseMsg.getBytes());
    }

}
