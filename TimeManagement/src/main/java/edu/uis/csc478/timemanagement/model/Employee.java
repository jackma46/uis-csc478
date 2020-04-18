package edu.uis.csc478.timemanagement.model;

import java.util.Date;

public class Employee {

	private long id;
	private String name;
	private String password;
	private long managerID;
	private Date startDate;
	private float accruedPTO;
	private float usedPTO;
	private float availableSick;
	private float usedSick;
	private float usedUnpaid;
	
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public float getAccruedPTO() {
		return accruedPTO;
	}
	public void setAccruedPTO(float accruedPTO) {
		this.accruedPTO = accruedPTO;
	}
	public float getUsedPTO() {
		return usedPTO;
	}
	public void setUsedPTO(float usedPTO) {
		this.usedPTO = usedPTO;
	}
	public float getAvailableSick() {
		return availableSick;
	}
	public void setAvailableSick(float availableSick) {
		this.availableSick = availableSick;
	}
	public float getUsedSick() {
		return usedSick;
	}
	public void setUsedSick(float usedSick) {
		this.usedSick = usedSick;
	}
	public float getUsedUnpaid() {
		return usedUnpaid;
	}
	public void setUsedUnpaid(float usedUnpaid) {
		this.usedUnpaid = usedUnpaid;
	}
	

}
