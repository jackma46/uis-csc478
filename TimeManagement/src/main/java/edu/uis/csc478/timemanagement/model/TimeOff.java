package edu.uis.csc478.timemanagement.model;

import java.sql.Date;
import java.time.LocalDate;

public class TimeOff {
	
	public enum Status{
		REQUESTED, REJECTED, APPROVED
	}
	
	private long id;
	private Date startDate;
	private Date endDate;
	private float ptoRequested;
	private float sickRequested;
	private float unpaidRequested;
	private Status status;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public float getPtoRequested() {
		return ptoRequested;
	}
	public void setPtoRequested(float ptoRequested) {
		this.ptoRequested = ptoRequested;
	}
	public float getSickRequested() {
		return sickRequested;
	}
	public void setSickRequested(float sickRequested) {
		this.sickRequested = sickRequested;
	}
	public float getUnpaidRequested() {
		return unpaidRequested;
	}
	public void setUnpaidRequested(float unpaidRequested) {
		this.unpaidRequested = unpaidRequested;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}			

}
