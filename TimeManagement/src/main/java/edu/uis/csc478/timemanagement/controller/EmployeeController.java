package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.model.TimeClock;
import edu.uis.csc478.timemanagement.model.TimeOff;
import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

@Controller
public class EmployeeController {
	
	@Autowired
	private TimeManagementRepository timeManagementRepository;
	
	@RequestMapping("/Clocked_in_Screen")
	public ModelAndView clockIn() {
		long id = TimeManagementUtil.getCurrentUserId();
		TimeClock timeClock = new TimeClock();
		timeClock.setId(id);
		timeClock.setDate(TimeManagementUtil.getCurrentDate());
		timeClock.setTimeIn(TimeManagementUtil.getCurrentTime());
		timeClock.setStatus(TimeClock.Status.UNFINISHED);
		timeManagementRepository.insertTimeClockIn(timeClock);
		
		return TimeManagementUtil.buildModelAndView("Clocked_in_Screen");
	}
	
	@RequestMapping("/Clocked_out_Screen")
	public ModelAndView clockOut() {
		long id = TimeManagementUtil.getCurrentUserId();
		TimeClock timeClock = new TimeClock();
		timeClock.setId(id);
		timeClock.setDate(TimeManagementUtil.getCurrentDate());
		timeClock.setTimeOut(TimeManagementUtil.getCurrentTime());
		timeClock.setStatus(TimeClock.Status.SUBMITTED);
		timeManagementRepository.insertTimeClockOut(timeClock);
		
		return TimeManagementUtil.buildModelAndView("Clocked_out_Screen");		
	}

	@RequestMapping("/Calendar_Screen")
	public ModelAndView viewCalendar() {
		
		return TimeManagementUtil.buildModelAndView("Calendar_Screen");
	}
	
	@RequestMapping("/employee_hours_log_view")
	public ModelAndView displayLog() {
		long id = TimeManagementUtil.getCurrentUserId();
		Date date = TimeManagementUtil.getCurrentDate();
		List<TimeClock> timeClocks = timeManagementRepository.findTimeClockEntries(id, date);		
		
		return TimeManagementUtil.buildModelAndView("employee_hours_log_view", "timeClocks", timeClocks);
	}
	
	@RequestMapping("/employee_timeoff_request")
	public ModelAndView requestTimeOff() {
			long id = TimeManagementUtil.getCurrentUserId();
			Employee employeeInfo = timeManagementRepository.findEmployeeById(id);	
			
			return new ModelAndView("employee_timeoff_request", "employeeInfo", employeeInfo);		
	}
	
	@RequestMapping("/employee_timeoff_result")
	public ModelAndView timeOffResult() {
		long id = TimeManagementUtil.getCurrentUserId();
		String year = TimeManagementUtil.getCurrentDate().toString();
		int index = year.indexOf('-');
		year = year.substring(0, index-1);
		List<TimeOff> timeOffRequest = timeManagementRepository.getTimeOffRequests(id, year);
		
		return new ModelAndView("employee_timeoff_result", "timeOffRequest", timeOffRequest);	
		
	}
}
