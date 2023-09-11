package com.models;

public class Doctor {
	int doctorid;
	String fullname;
	int specializationid;
	String qualification;
	int experience;
	String designation;
	String photo;

	public Doctor() {

	}

	public Doctor(int doctorid, String fullname, int specializationid, String qualification, int experience,
			String designation, String photo) {
		this.doctorid = doctorid;
		this.fullname = fullname;
		this.specializationid = specializationid;
		this.qualification = qualification;
		this.experience = experience;
		this.designation = designation;
		this.photo = photo;
	}

	public int getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(int doctorid) {
		this.doctorid = doctorid;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public int getSpecializationid() {
		return specializationid;
	}

	public void setSpecializationid(int specializationid) {
		this.specializationid = specializationid;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
