package com.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DocrowMapper implements RowMapper<Doctor> {

	@Override
	public Doctor mapRow(ResultSet rs, int rowNum) throws SQLException {
		Doctor doc = new Doctor();
		doc.setDoctorid(rs.getInt(1));
		doc.setFullname(rs.getString(2));
		doc.setSpecializationid(rs.getInt(3));
		doc.setQualification(rs.getString(4));
		doc.setExperience(rs.getInt(5));
		doc.setDesignation(rs.getString(6));
		doc.setPhoto(rs.getString(7));
		return doc;
	}

}
