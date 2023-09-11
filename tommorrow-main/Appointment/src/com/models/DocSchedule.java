package com.models;

import java.sql.Time;

public class DocSchedule {
	int doctor_id, doctor_sindex, no_of_slots, doctortreattime;
	String doctor_schedule;
	Time d_from, d_to;

	public int getDoctortreattime() {
		return doctortreattime;
	}

	public void setDoctortreattime(int doctortreattime) {
		this.doctortreattime = doctortreattime;
	}

	public int getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}

	public int getDoctor_sindex() {
		return doctor_sindex;
	}

	public void setDoctor_sindex(int doctor_sindex) {
		this.doctor_sindex = doctor_sindex;
	}

	public String getDoctor_schedule() {
		return doctor_schedule;
	}

	public void setDoctor_schedule(String doctor_schedule) {
		this.doctor_schedule = doctor_schedule;
	}

	public int getNo_of_slots() {
		return no_of_slots;
	}

	public void setNo_of_slots(int no_of_slots) {
		this.no_of_slots = no_of_slots;
	}

	public Time getD_from() {
		return d_from;
	}

	public void setD_from(Time d_from) {
		this.d_from = d_from;
	}

	public Time getD_to() {
		return d_to;
	}

	public void setD_to(Time d_to) {
		this.d_to = d_to;
	}

}
