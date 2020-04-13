package edu.uis.csc478.timemanagement.model;

import java.time.LocalDate;

public class TimeOff {
	
	enum Status{
		REQUESTED, REJECTED, APPROVED
	}
	
	private long id;
	private LocalDate startDate;
	private LocalDate endDate;
	private long PTOrequested;
	private long SickRequested;
	private long UnpaidRequested;
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
	public long getPTOrequested() {
		return PTOrequested;
	}
	public void setPTOrequested(long pTOrequested) {
		PTOrequested = pTOrequested;
	}
	public long getSickRequested() {
		return SickRequested;
	}
	public void setSickRequested(long sickRequested) {
		SickRequested = sickRequested;
	}
	public long getUnpaidRequested() {
		return UnpaidRequested;
	}
	public void setUnpaidRequested(long unpaidRequested) {
		UnpaidRequested = unpaidRequested;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}	

}
