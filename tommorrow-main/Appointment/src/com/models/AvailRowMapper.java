package com.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AvailRowMapper implements RowMapper<SlotDate>{

	@Override
	public SlotDate mapRow(ResultSet rs, int rowNum) throws SQLException {
		SlotDate sd=new SlotDate();
		sd.setSlotdate(rs.getDate(1));
		sd.setAvailable_slots_count(rs.getInt(2));
		System.out.println(sd.getSlotdate());
		return sd;
	}

}
