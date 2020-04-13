package edu.uis.csc478.timemanagement.model;

import java.time.LocalDate;

public class Employee {

	private long id;
	private String name;
	private String password;
	private long managerID;
	private LocalDate startDate;
	private long accruedPTO;
	private long usedPTO;
	private long availableSick;
	private long usedSick;
	private long usedUnpaid;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getManagerID() {
		return managerID;
	}
	public void setManagerID(long managerID) {
		this.managerID = managerID;
	}
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public long getAccruedPTO() {
		return accruedPTO;
	}
	public void setAccruedPTO(long accruedPTO) {
		this.accruedPTO = accruedPTO;
	}
	public long getUsedPTO() {
		return usedPTO;
	}
	public void setUsedPTO(long usedPTO) {
		this.usedPTO = usedPTO;
	}
	public long getAvailableSick() {
		return availableSick;
	}
	public void setAvailableSick(long availableSick) {
		this.availableSick = availableSick;
	}
	public long getUsedSick() {
		return usedSick;
	}
	public void setUsedSick(long usedSick) {
		this.usedSick = usedSick;
	}
	public long getUsedUnpaid() {
		return usedUnpaid;
	}
	public void setUsedUnpaid(long usedUnpaid) {
		this.usedUnpaid = usedUnpaid;
	}	
}
