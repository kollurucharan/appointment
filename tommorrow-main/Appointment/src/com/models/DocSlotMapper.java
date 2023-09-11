package com.models;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DocSlotMapper implements RowMapper<SlotClass>  {

	@Override
	public SlotClass mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		SlotClass sc=new SlotClass();
		sc.setSlotid(rs.getInt(1));
		sc.setSlotdoctorid(rs.getInt(2));
		sc.setSlotdate(rs.getDate(3));
		sc.setSlotfrom(rs.getString(4));
		sc.setSlotto(rs.getString(5));
		sc.setSlotstatus(rs.getString(6));
		return sc;
	}

}
