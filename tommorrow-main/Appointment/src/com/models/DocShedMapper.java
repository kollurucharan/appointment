package com.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DocShedMapper implements RowMapper<DocSchedule> {

	@Override
	public DocSchedule mapRow(ResultSet rs, int rowNum) throws SQLException {
		DocSchedule doc = new DocSchedule();
		doc.setDoctor_id(rs.getInt(1));
		doc.setDoctor_sindex(rs.getInt(2));
		doc.setDoctor_schedule(rs.getString(3));
		doc.setD_from(rs.getTime(4));
		doc.setD_to(rs.getTime(5));
		doc.setDoctortreattime(rs.getInt(6));
		doc.setNo_of_slots(rs.getInt(7));
		return doc;
	}

}
