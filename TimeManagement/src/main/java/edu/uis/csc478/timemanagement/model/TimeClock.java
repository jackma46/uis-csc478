package edu.uis.csc478.timemanagement.model;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

public class TimeClock {
	
	public enum Status{
		SUBMITTED, APPROVED, REJECTED, UNFINISHED
	}
	
	private long id;
	private Date clockDate;
	private Time timeIn;
	private Time timeOut;
	private Status status;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public Date getDate() {
		return clockDate;
	}
	public void setDate(Date date) {
		this.clockDate = date;
	}
	public Time getTimeIn() {
		return timeIn;
	}
	public void setTimeIn(Time timeIn) {
		this.timeIn = timeIn;
	}
	public Time getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(Time timeOut) {
		this.timeOut = timeOut;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}	
	
	public String getFormattedDate() {
	    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    String formattedDate = df.format(clockDate);
		return formattedDate;
	}
}
