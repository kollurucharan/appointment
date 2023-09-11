package com.models;

import java.util.Date;

public class SlotClass {
	int slotid;
	int slotdoctorid;
	Date slotdate;
	String slotfrom;
	String slotto;
	String slotstatus;

	public int getSlotid() {
		return slotid;
	}

	public void setSlotid(int slotid) {
		this.slotid = slotid;
	}

	public int getSlotdoctorid() {
		return slotdoctorid;
	}

	public void setSlotdoctorid(int slotdoctorid) {
		this.slotdoctorid = slotdoctorid;
	}

	public Date getSlotdate() {
		return slotdate;
	}

	public void setSlotdate(Date slotdate) {
		this.slotdate = slotdate;
	}

	public String getSlotfrom() {
		return slotfrom;
	}

	public void setSlotfrom(String slotfrom) {
		this.slotfrom = slotfrom;
	}

	public String getSlotto() {
		return slotto;
	}

	public void setSlotto(String slotto) {
		this.slotto = slotto;
	}

	public String getSlotstatus() {
		return slotstatus;
	}

	public void setSlotstatus(String slotstatus) {
		this.slotstatus = slotstatus;
	}

}
