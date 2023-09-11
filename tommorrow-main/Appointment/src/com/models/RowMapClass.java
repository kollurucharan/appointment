package com.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.models.Specialization;

public class RowMapClass implements RowMapper<Specialization> {

	@Override
	public Specialization mapRow(ResultSet rs, int rowNum) throws SQLException {
		Specialization spec = new Specialization();
		spec.setSpecialization_id(rs.getInt(1));
		spec.setSpecialization_name(rs.getString(2));
		return spec;
	}

}
