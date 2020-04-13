package edu.uis.csc478.timemanagement.model;

import java.time.*;

public class TimeClock {
	
	enum Status{
		SUBMITTED, APPROVED, UNFINISHED, ERROR
	}
	
	private long id;
	private LocalDate date;
	private LocalTime timeIn;
	private LocalTime timeout;
	private Status status;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public LocalTime getTimeIn() {
		return timeIn;
	}
	public void setTimeIn(LocalTime timeIn) {
		this.timeIn = timeIn;
	}
	public LocalTime getTimeout() {
		return timeout;
	}
	public void setTimeout(LocalTime timeout) {
		this.timeout = timeout;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}	
	
}
