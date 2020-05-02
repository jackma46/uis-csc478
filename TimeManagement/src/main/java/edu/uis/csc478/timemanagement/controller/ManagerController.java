/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.model.TimeClock;
import edu.uis.csc478.timemanagement.model.TimeOff;
import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

/*
 * The ManagerController class contains all the business logic needed to satisfy 3.3 of the requirements. 
 */

@Controller
public class ManagerController {

	@Autowired
	private TimeManagementRepository timeManagementRepository;
	// Display the manager_welcom page.	
	// Requirement 3.0.0
	@RequestMapping("/manage/welcome")
	public ModelAndView managerWelcome() {
		
		return TimeManagementUtil.buildModelAndView("manager_welcome");
	}
	// When the user chooses to approve time clock events, pass in a list of TimeClock objects,
	// with the "SUBMITTED" status and were submitted by employees under the user.
	// Requirement 3.1.1
	@GetMapping("/manage/manager_approve_timeclock")
	public ModelAndView displayTimeClock() {
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<TimeClock> timeClocks = timeManagementRepository.findTimeClockEntries(0, null, id, TimeClock.Status.SUBMITTED);		
		return TimeManagementUtil.buildModelAndView("manager_approve_timeclock", "timeClocks", timeClocks);
	}
	// When the user approves the time clock events, pass in the timeClockId of each approve TimeClock object.
	// Update the status of each TimeClock object to "APPROVED" in the database, and then display these TimeClock objects.
	// Requirement 3.1.2 & 3.1.6
	@PostMapping("/manage/manager_approve_timeclock")
	@Transactional 
	public ModelAndView approveTimeClock(
			@RequestParam(name="timeClockIds") List<Long> timeClockIds) {

		List<TimeClock> timeClocks = new ArrayList<TimeClock>();
		for (long tcID : timeClockIds) {
			timeManagementRepository.approveEmployeeTimeClock(tcID, TimeClock.Status.APPROVED);
			timeClocks.add((TimeClock) timeManagementRepository.findTimeClockEntry(tcID));
		}
		
		return TimeManagementUtil.buildModelAndView("manager_display_timeclock", "timeClocks", timeClocks);
	}
	// When select_timeclock is called, return a list of employees under this user.
	// Requirement 3.1.3
	@GetMapping("/manage/manager_select_timeclock")
	public ModelAndView inputTimeClockParameters() {
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<Employee> managed = timeManagementRepository.findSubordinates(id);
		
		return TimeManagementUtil.buildModelAndView("manager_select_timeclock", "managed", managed);
	}
	// After the user has selected the employee, date and the desired status, return a list of TimeClock objects that satisfy the selection.
	// Pass this list TimeClock objects to manager_display_timeclock page.
	// Requirement 3.1.5
	@PostMapping("/manage/manager_select_timeclock")
	public ModelAndView selectTimeClock(
			@RequestParam(name="employeeId") long employeeId,
			@RequestParam(name="date") String dateInString,
			@RequestParam(name="status") String statusInString) {
		
		Date date = TimeManagementUtil.sqlDate(dateInString);
		
		if (date == null) {
			date = TimeManagementUtil.getCurrentDate();
		}
		
		TimeClock.Status status = TimeClock.passStatus(statusInString);
		long id = TimeManagementUtil.getCurrentUserId();
		List<TimeClock> timeClocks = timeManagementRepository.findTimeClockEntries(employeeId, date, id, status);
		
		return TimeManagementUtil.buildModelAndView("manager_display_timeclock", "timeClocks", timeClocks);
	}
	// When the user chooses to approve time off requests, pass in a list of TimeOff objects,
	// with the "REQUESTED" status and were submitted by employees under the user.
	// Requirement 3.2.1
	@GetMapping("manage/manager_approve_timeoff")
	public ModelAndView displayTimeOff() {
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<TimeOff> timeOffs = timeManagementRepository.findTimeOffEntries(0, id, TimeOff.Status.REQUESTED);
		return TimeManagementUtil.buildModelAndView("manager_approve_timeoff", "timeOffs", timeOffs);
	}	
	// When the user approves or rejects the time off requests, pass in the timeOffId of each approve TimeOff object.
	// Update the status of each TimeOff object to "APPROVED" or "REJECTED" in the database, and then display these TimeClock objects.
	// Requirement 3.2.2 & 3.2.6
	@PostMapping("/manage/manager_approve_timeoff")
	@Transactional 
	public ModelAndView approveTimeOff(
			@RequestParam(name="timeOffIds") List<Long> timeOffIds,
			@RequestParam(name="newStatus") String newStatus) {

		List<TimeOff> timeOffs = new ArrayList<TimeOff>();
		for (long toID : timeOffIds) {
			timeManagementRepository.approveEmployeeTimeOff(toID, TimeOff.passStatus(newStatus));
			TimeOff to = timeManagementRepository.findTimeOffEntry(toID);
			if (TimeOff.passStatus(newStatus) == TimeOff.Status.REJECTED) {
				timeManagementRepository.refundTimeOff(to);
			}			
			timeOffs.add(to);			
		}
		
		return TimeManagementUtil.buildModelAndView("manager_display_timeoff", "timeOffs", timeOffs);
	}
	// When select_timeoff is called, return a list of employees under the user.
	// Requirement 3.2.3
	@GetMapping("/manage/manager_select_timeoff")
	public ModelAndView inputTimeOffParameters() {
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<Employee> managed = timeManagementRepository.findSubordinates(id);
		
		return TimeManagementUtil.buildModelAndView("manager_select_timeoff", "managed", managed);
	}
	// After the user has selected the employee and the desire status, return a list of TimeOff objects that satisfy the selection.
	// Pass this list of TimeOff objects to manager_display_timeoff page.
	// Requirement 3.2.5
	@PostMapping("/manage/manager_select_timeoff")
	public ModelAndView selectTimeOff(
			@RequestParam(name="employeeId") long employeeId,
			@RequestParam(name="status") String statusInString) {
		
		TimeOff.Status status = TimeOff.passStatus(statusInString);
		long id = TimeManagementUtil.getCurrentUserId();
		
		List<TimeOff> timeOffs = timeManagementRepository.findTimeOffEntries(employeeId, id, status);
		
		return TimeManagementUtil.buildModelAndView("manager_display_timeoff", "timeOffs", timeOffs);
	}
	
}