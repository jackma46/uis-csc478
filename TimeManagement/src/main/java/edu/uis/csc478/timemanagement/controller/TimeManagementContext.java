/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.controller;

/*
 * This template class help to pass some valuable information into the called JSP. 
 * This way, the HTML returned to the user could dynamically display the user's name, current date, and current time.
 */

public class TimeManagementContext {

	private String employeeName;
	private String currentDate;
	private String currentTime;
	private String contentJsp;

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}

	public String getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}

	public String getContentJsp() {
		return contentJsp;
	}

	public void setContentJsp(String contentJsp) {
		this.contentJsp = contentJsp;
	}

}
