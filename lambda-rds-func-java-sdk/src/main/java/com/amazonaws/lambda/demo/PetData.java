package com.amazonaws.lambda.demo;

public class PetData {
	String petName;
	String ownerName;
	String dogSpecies;
	
	public String getPetName() {
		return petName;
	}
	
	public void setPetName(String petName) {
		this.petName = petName;
	}
	
	public String getOwnerName() {
		return ownerName;
	}
	
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	
	public String getDogSpecies() {
		return dogSpecies;
	}
	
	public void setDogSpecies(String dogSpecies) {
		this.dogSpecies = dogSpecies;
	}
}
