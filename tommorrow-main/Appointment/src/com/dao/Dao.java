package com.dao;

import java.util.List;

import com.models.DocSchedule;
import com.models.Doctor;
import com.models.Patient;
import com.models.SlotClass;
import com.models.SlotDate;
import com.models.Specialization;

public interface Dao {
	public List<Specialization> getAllSpecialization();

	public List<Doctor> getAllDoctors();

	public List<Doctor> getSpecifiedDoctors(int comp);

	public List<DocSchedule> getDoctorSchedule(int id);

	public List<SlotClass> getSlots(int id);

	public List<SlotDate> getDateSlots(int id);

	public void insertPatient(Patient patient);

}
