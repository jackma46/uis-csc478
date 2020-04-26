package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
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
import edu.uis.csc478.timemanagement.model.TimeOff.Status;
import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

@Controller
public class ManagerController {

	@Autowired
	private TimeManagementRepository timeManagementRepository;
	
	@RequestMapping("/manage/welcome")
	public ModelAndView managerWelcome() {
		
		return TimeManagementUtil.buildModelAndView("manage_welcome");
	}
	
	@GetMapping("/manage/selecttimeclock")
	public ModelAndView inputTimeClockParameters() {
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<Employee> managed = timeManagementRepository.findSubordinates(id);
		
		return TimeManagementUtil.buildModelAndView("manage_selecttimeclock", "managed", managed);
	}
	
	@PostMapping("/manage/selecttimeclock")
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
		
		return TimeManagementUtil.buildModelAndView("manage_displaytimeclock", "timeClocks", timeClocks);
	}
	
	@PostMapping("/manage/approvetimeclock")
	public ModelAndView approveTimeClock() {
		
		
	}
	
}
;