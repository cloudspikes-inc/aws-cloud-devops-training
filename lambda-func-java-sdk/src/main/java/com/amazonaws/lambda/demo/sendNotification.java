package com.amazonaws.lambda.demo;

public class sendNotification {
	String notificationMsg;
	String notificationSubscribers;
	
	public String getNotificationMsg() {
		return notificationMsg;
	}
	
	public void setNotificationMsg(String notificationMsg) {
		this.notificationMsg = notificationMsg;
	}
	
	public String getNotificationSubscribers() {
		return notificationSubscribers;
	}
	
	public void setNotificationSubscribers(String notificationSubscribers) {
		this.notificationSubscribers = notificationSubscribers;
	}
}
