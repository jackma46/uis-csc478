/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.model;

/*
 * This is a template class that lays out all the attributes of an employee.
 * The attributes in this template matches the table columns of the Employee table in the database.
 */

public class Employee {

	private long id;
	private String name;
	private String password;
	private long managerID;
	private float accruedPTO;
	private float usedPTO;
	private float availableSick;
	private float usedSick;
	private float availableFloater;
	private float usedFloater;
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
	public float getAvailableFloater() {
		return availableFloater;
	}
	public void setAvailableFloater(float availableFloater) {
		this.availableFloater = availableFloater;
	}
	public float getUsedFloater() {
		return usedFloater;
	}
	public void setUsedFloater(float usedFloater) {
		this.usedFloater = usedFloater;
	}
	public float getUsedUnpaid() {
		return usedUnpaid;
	}
	public void setUsedUnpaid(float usedUnpaid) {
		this.usedUnpaid = usedUnpaid;
	}
}
