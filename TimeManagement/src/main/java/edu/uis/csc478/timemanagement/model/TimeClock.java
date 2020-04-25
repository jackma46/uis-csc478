package edu.uis.csc478.timemanagement.model;

import java.sql.Date;
import java.sql.Time;

public class TimeClock {
	
	public enum Status{
		SUBMITTED, APPROVED, UNFINISHED
	}
	
	private long id;
	private Date date;
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
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	
}
