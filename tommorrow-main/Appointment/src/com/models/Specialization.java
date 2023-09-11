package com.models;

public class Specialization {
	int specialization_id;
	String specialization_name;

	public Specialization() {

	}

	public Specialization(int specialization_id, String specialization_name) {
		this.specialization_id = specialization_id;
		this.specialization_name = specialization_name;
	}

	public int getSpecialization_id() {
		return specialization_id;
	}

	public void setSpecialization_id(int specialization_id) {
		this.specialization_id = specialization_id;
	}

	public String getSpecialization_name() {
		return specialization_name;
	}

	public void setSpecialization_name(String specialization_name) {
		this.specialization_name = specialization_name;
	}

}
