package com.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.models.AvailRowMapper;
import com.models.DocSchedule;
import com.models.DocShedMapper;
import com.models.DocSlotMapper;
import com.models.DocrowMapper;
import com.models.Doctor;
import com.models.Patient;
import com.models.RowMapClass;
import com.models.SlotClass;
import com.models.SlotDate;
import com.models.Specialization;

@Component
public class SpecImpClass implements Dao {
	JdbcTemplate jdbc;

	@Autowired
	public SpecImpClass(DataSource dataSource) {
		jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Specialization> getAllSpecialization() {
		return jdbc.query("select * from lrc_specialization", new RowMapClass());
	}

	public void callStoredProcedure(int param1) {
		String storedProcedureName = "InsertAppointmentsFromDoctorsAndPatients";
		jdbc.update("call " + storedProcedureName + "(?)", param1);
	}

	@Override
	public List<Doctor> getAllDoctors() {
		// TODO Auto-generated method stub

		return jdbc.query("select * from lrc_doctor", new DocrowMapper());
	}

	@Override
	public List<Doctor> getSpecifiedDoctors(int comp) {
		Object[] params = { comp };
		return jdbc.query("select * from lrc_doctor where specializationid=?", params, new DocrowMapper());
	}

	@Override
	public List<DocSchedule> getDoctorSchedule(int id) {
		Object[] params = { id };
		System.out.println(id);
		return jdbc.query("select * from lrc_sch where doctorid=?", new Object[] { id }, new DocShedMapper());
	}

	@Override
	public List<SlotClass> getSlots(int id) {

		Object[] params = { id };
		return jdbc.query("select * from lrc_slot where slotdoctorid =?", params, new DocSlotMapper());
	}

	@Override
	public List<SlotDate> getDateSlots(int id) {
		callStoredProcedure(id);
		System.out.println("method");
		Object[] params = { "Available", id };

		return jdbc.query(
				"SELECT slotdate, COUNT(*) AS available_slots_count FROM lrc_slot WHERE slotstatus = ? and slotdoctorid=? GROUP BY slotdate",
				params, new AvailRowMapper());
	}

	@Override
	public void insertPatient(Patient patient) {
		String sql = "INSERT INTO lrc_patients (name, age, gender, phone, docid, from_time, to_time, dates) "
				+ "VALUES (?, CAST(? AS INT), ?, ?, CAST(? AS INT), CAST(? AS TIME), CAST(? AS TIME), CAST(? AS DATE))";

		jdbc.update(sql, patient.getName(), patient.getAge(), patient.getGender(), patient.getPhone(),
				patient.getDocid(), patient.getFrom(), patient.getTo(), patient.getDates());

	}

}
