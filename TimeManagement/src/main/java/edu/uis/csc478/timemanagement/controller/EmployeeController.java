package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
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
public class EmployeeController {
	
	@Autowired
	private TimeManagementRepository timeManagementRepository;
	
	@RequestMapping("/clocked_in")
	public ModelAndView clockIn() {
		long id = TimeManagementUtil.getCurrentUserId();
		TimeClock timeClock = new TimeClock();
		timeClock.setId(id);
		timeClock.setName(TimeManagementUtil.getCurrentUserName());
		timeClock.setDate(TimeManagementUtil.getCurrentDate());
		timeClock.setTimeIn(TimeManagementUtil.getCurrentTime());
		timeClock.setStatus(TimeClock.Status.UNFINISHED);
		timeManagementRepository.insertTimeClockIn(timeClock);
		
		return TimeManagementUtil.buildModelAndView("clocked_in");
	}
	
	@RequestMapping("/clocked_out")
	public ModelAndView clockOut() {
		long id = TimeManagementUtil.getCurrentUserId();
		TimeClock timeClock = new TimeClock();
		timeClock.setId(id);
		timeClock.setDate(TimeManagementUtil.getCurrentDate());
		timeClock.setTimeOut(TimeManagementUtil.getCurrentTime());
		timeClock.setStatus(TimeClock.Status.SUBMITTED);
		timeManagementRepository.insertTimeClockOut(timeClock);
		
		return TimeManagementUtil.buildModelAndView("clocked_out");		
	}

	@RequestMapping("/employee_select_timeclock")
	public ModelAndView viewLog() {
		
		return TimeManagementUtil.buildModelAndView("test/employee_select_timeclock");
	}
	
	@RequestMapping("/employee_display_timeclock")
	public ModelAndView displayLog() {
		long id = TimeManagementUtil.getCurrentUserId();
		Date date = TimeManagementUtil.getCurrentDate();
		long managerId = TimeManagementUtil.getCurrentManagerId();
		List<TimeClock> timeClocks = timeManagementRepository.findTimeClockEntries(id, date, managerId, null);		
		
		return TimeManagementUtil.buildModelAndView("test/employee_display_timeclock", "timeClocks", timeClocks);
	}
	
	@GetMapping("/employee_request_timeoff")
	public ModelAndView showTimeOffRequests(){		
		long id = TimeManagementUtil.getCurrentUserId();
		Employee employeeInfo = timeManagementRepository.findEmployeeById(id);	
		
		return TimeManagementUtil.buildModelAndView("test/employee_request_timeoff", "employeeInfo", employeeInfo);
	}
	
	@PostMapping("/employee_timeoff_request")
	public ModelAndView handleIimeOffRequest(
			@RequestParam(name="startDate") String startDate,
			@RequestParam(name="endDate") String endDate,
			@RequestParam(name="pto", defaultValue = "0") float PTO,
			@RequestParam(name="sick", defaultValue = "0") float sick,
			@RequestParam(name="floater", defaultValue = "0") float floater) {
		
			Date sDate = TimeManagementUtil.sqlDate(startDate);
			Date eDate = TimeManagementUtil.sqlDate(endDate);
			Date today = TimeManagementUtil.getCurrentDate();
			
			if (sDate == null || etimmamDate == null || sDate.compareTo(eDate) > 0 || sDate.compareTo(today) < 0) {
				return showTimeOffRequests();
			}
						
			LocalDate start = sDate.toLocalDate();
			LocalDate end = eDate.toLocalDate();
			
			int days = 0;
			while (!start.isAfter(end)) {
				if (!(start.getDayOfWeek() == DayOfWeek.SATURDAY || start.getDayOfWeek() == DayOfWeek.SUNDAY)) {
					days++;
				}
				start.plusDays(1);
			}
			
			if (days == 0 || days < (PTO + sick)) {
				return showTimeOffRequests();
			}
			
			long id = TimeManagementUtil.getCurrentUserId();
			Employee employeeInfo = timeManagementRepository.findEmployeeById(id);
			String employeeName = employeeInfo.getName();
			float availablePTO = employeeInfo.getAccruedPTO();
			float availableSick = employeeInfo.getAvailableSick();
			
			if (availablePTO < PTO || availableSick < sick) {
				return showTimeOffRequests();
			}
			
			float unpaid = days * 8 - PTO - sick;
			
			TimeOff timeOff = new TimeOff();
			timeOff.setId(id);
			timeOff.setName(employeeName);
			timeOff.setStartDate(sDate);
			timeOff.setEndDate(eDate);
			timeOff.setPtoRequested(PTO);
			timeOff.setSickRequested(sick);
			timeOff.setFloaterRequested(floater);
			timeOff.setStatus(TimeOff.Status.REQUESTED);
			
			timeManagementRepository.updateEmployeeTimeOff(id, PTO, sick, floater, unpaid);
			timeManagementRepository.insertTimeOffRequest(timeOff);
			
			return timeOffResult();		
	}	
	
	@RequestMapping("/employee_display_timeoff")
	public ModelAndView timeOffResult() {
		long id = TimeManagementUtil.getCurrentUserId();
		long managerId = TimeManagementUtil.getCurrentManagerId();
		List<TimeOff> timeOffRequests = timeManagementRepository.findTimeOffEntries(id, managerId, null);
		
		return TimeManagementUtil.buildModelAndView("test/employee_display_timeoff", "timeOffRequests", timeOffRequests);	
		
	}
}
