package edu.uis.csc478.timemanagement.model;

import java.time.LocalDate;

public class TimeOff {
	
	enum Status{
		REQUESTED, REJECTED, APPROVED
	}
	
	private long id;
	private LocalDate startDate;
	private LocalDate endDate;
	private float PTOrequested;
	private float SickRequested;
	private float UnpaidRequested;
	private Status status;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	public float getPTOrequested() {
		return PTOrequested;
	}
	public void setPTOrequested(float pTOrequested) {
		PTOrequested = pTOrequested;
	}
	public float getSickRequested() {
		return SickRequested;
	}
	public void setSickRequested(float sickRequested) {
		SickRequested = sickRequested;
	}
	public float getUnpaidRequested() {
		return UnpaidRequested;
	}
	public void setUnpaidRequested(float unpaidRequested) {
		UnpaidRequested = unpaidRequested;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	
}
