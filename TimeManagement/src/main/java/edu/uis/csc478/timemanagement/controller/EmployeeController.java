package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.uis.csc478.timemanagement.model.TimeClock;
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
		
		return new ModelAndView("Clocked_in_Screen");
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
		
		return new ModelAndView("Clocked_out_Screen");		
	}

	@RequestMapping("/Calendar_Screen")
	public ModelAndView viewCalendar() {
		
		return new ModelAndView("Calendar_Screen");
	}
	
	@RequestMapping("/employee_hours_log_view")
	public ModelAndView displayLog() {
		long id = TimeManagementUtil.getCurrentUserId();
		Date date = TimeManagementUtil.getCurrentDate();
		List<TimeClock> timeClocks = timeManagementRepository.findTimeClockEntries(id, date);
		
		
		return new ModelAndView("employee_hours_log_view", "timeClocks", timeClocks);
	}
}
