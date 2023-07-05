package com.amazonaws.lambda.demo;

import java.sql.*;

class MysqlCon {
	public static void main(String args[]) {
		new MysqlCon().insertData("test-pet", "test-owner", "test-dog-species");
		new MysqlCon().getData();
	}
	
	public String getData() {
		String apiResponse = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.crkmmabfcopx.ca-central-1.rds.amazonaws.com:3306/test_db?"
					+ "useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false"
					+ "&serverTimezone=UTC", "root", "Bittu2910");  
			
			Statement stmt = con.createStatement();
			String sqlQuery = "select * from pet_data";
			System.out.println("Executing SELECT SQL Query: "+sqlQuery);
			ResultSet rs = stmt.executeQuery(sqlQuery);
			
			int dataCount = 0;
			while (rs.next()) {
				String resultSetData=" Pet Data Set number "+dataCount+" from the AWS RDS MySQL DB Instance: Pet Name = "+rs.getString(1) + "  Owner Name = " + rs.getString(2) + "  Dog Species = " + rs.getString(3)+" \n";
				apiResponse = apiResponse+resultSetData;
				dataCount++;
			}
			
			System.out.println("Final apiResponse: \n"+apiResponse);
			con.close();
			return apiResponse;
			
		} catch (Exception e) {
			String errorMsg = "Error while fetching data from AWS RDS MySQL DB: "+e.getMessage();
			System.out.println(errorMsg);
			e.printStackTrace();
			return errorMsg;
		}
	}
	
	public String insertData(String petName, String ownerName, String dogSpecies) {
		String apiResponse = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.crkmmabfcopx.ca-central-1.rds.amazonaws.com:3306/test_db?"
					+ "useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false"
					+ "&serverTimezone=UTC", "root", "Bittu2910");  
			
			Statement stmt = con.createStatement();
			
			String sqlQuery = "INSERT INTO pet_data (petName, ownerName, dogSpecies) VALUES ('"+petName+"', '"+ownerName+"', '"+dogSpecies+"')";
			System.out.println("Executing INSERT SQL Query: "+sqlQuery);
			int resultCount = stmt.executeUpdate(sqlQuery);
			
			apiResponse = "resultCount: "+resultCount;
			System.out.println(apiResponse);
			con.close();
			return apiResponse;
			
		} catch (Exception e) {
			String errorMsg = "Error while fetching data from AWS RDS MySQL DB: "+e.getMessage();
			System.out.println(errorMsg);
			e.printStackTrace();
			return errorMsg;
		}
	}
}
