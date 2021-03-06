/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.model;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

/*
 * This is a template class that lays out all the attributes of a a time clock event.
 * The attributes in this template matches the table columns of the TimeClock table in the database.
 */

public class TimeClock {
	
	public enum Status{
		SUBMITTED, APPROVED, UNFINISHED
	}
	
	private long timeClockId;
	private long id;
	private String name;
	private Date clockDate;
	private Time timeIn;
	private Time timeOut;
	private Status status;
	
	
	public long getTimeClockId() {
		return timeClockId;
	}
	public void setTimeClockId(long timeClockId) {
		this.timeClockId = timeClockId;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public static Status passStatus(String s) {
		for (Status status : Status.values()) {
			if (status.name().equalsIgnoreCase(s)) {
				return status;
			}
		}
		
		return null;
	}
	
	public String getFormattedDate() {
	    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    String formattedDate = df.format(clockDate);
		return formattedDate;
	}
}
