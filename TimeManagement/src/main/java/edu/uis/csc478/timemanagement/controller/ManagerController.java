package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.model.TimeClock;
import edu.uis.csc478.timemanagement.model.TimeOff;
import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

/**
 * @author Jack Ma
 * Part of UIS CSC 478 Team Grammers Project
 * 
 */

@Controller
public class ManagerController {

	@Autowired
	private TimeManagementRepository timeManagementRepository;
		
	@RequestMapping("/manage/welcome")
	public ModelAndView managerWelcome() {
		
		return TimeManagementUtil.buildModelAndView("manage_welcome");
	}
	
	@GetMapping("/manage/select_timeclock")
	public ModelAndView inputTimeClockParameters() {
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<Employee> managed = timeManagementRepository.findSubordinates(id);
		
		return TimeManagementUtil.buildModelAndView("manager_select_timeclock", "managed", managed);
	}
	
	@PostMapping("/manage/select_timeclock")
	public ModelAndView selectTimeClock(
			@RequestParam(name="employeeID") long employeeId,
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
	
	@PostMapping("/manage/approve_timeclock")
	public ModelAndView approveTimeClock(
			@RequestParam(name="timeClockID") List<Long> timeClockIds,
			@RequestParam(name="newStatus") String newStatus) {

		List<TimeClock> timeClocks = new ArrayList<TimeClock>();
		for (long tcID : timeClockIds) {
			timeManagementRepository.approveEmployeeTimeClock(tcID, TimeClock.passStatus(newStatus));
			timeClocks.add((TimeClock) timeManagementRepository.findTimeClockEntry(tcID));
		}
		
		return TimeManagementUtil.buildModelAndView("manager_display_timeclock", "timeClocks", timeClocks);
	}
	
	@GetMapping("/manage/select_timeoff")
	public ModelAndView inputTimeOffParameters() {
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<Employee> managed = timeManagementRepository.findSubordinates(id);
		
		return TimeManagementUtil.buildModelAndView("manager_select_timeoff", "managed", managed);
	}
	
	@PostMapping("/manage/select_timeoff")
	public ModelAndView selectTimeOff(
			@RequestParam(name="employeeID") long employeeId,
			@RequestParam(name="status") String statusInString) {
		
		TimeOff.Status status = TimeOff.passStatus(statusInString);
		long id = TimeManagementUtil.getCurrentUserId();
		//Date today = TimeManagementUtil.getCurrentDate();
		
		List<TimeOff> timeOffs = timeManagementRepository.findTimeOffEntries(employeeId, id, status);
		
		return TimeManagementUtil.buildModelAndView("manager_display_timeoff", "timeOffs", timeOffs);
	}
	
	@PostMapping("/manage/approve_timeoff")
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
	
}