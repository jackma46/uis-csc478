/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
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
 * The EmployeeController class contains all the business logic needed to satisfy 3.2 of the requirements. 
 */

@Controller
public class EmployeeController {
	
	@Autowired
	private TimeManagementRepository timeManagementRepository;	
	// When the user initiates the /clocked_in action. Generate a new TimeClock entry into the database. Then the user is directed to the clocked_in page.
	// Requirement 2.1.1 and 2.1.2
	@RequestMapping("/clocked_in_screen")
	public ModelAndView clockIn() {
		long id = TimeManagementUtil.getCurrentUserId();
		TimeClock timeClock = new TimeClock();
		timeClock.setId(id);
		timeClock.setName(TimeManagementUtil.getCurrentUserName());
		timeClock.setDate(TimeManagementUtil.getCurrentDate());
		timeClock.setTimeIn(TimeManagementUtil.getCurrentTime());
		timeClock.setStatus(TimeClock.Status.UNFINISHED);
		timeManagementRepository.insertTimeClockIn(timeClock);
		
		return TimeManagementUtil.buildModelAndView("clocked_in_screen");
	}
	// When the user initiates the /clocked_out action. Update the corresponding TimeClock entry in the database. Then the user is directed to the clocked_out page.
	// Requirement 2.1.1 and 2.1.2	
	@RequestMapping("/clocked_out_screen")
	public ModelAndView clockOut() {
		long id = TimeManagementUtil.getCurrentUserId();
		TimeClock timeClock = new TimeClock();
		timeClock.setId(id);
		timeClock.setDate(TimeManagementUtil.getCurrentDate());
		timeClock.setTimeOut(TimeManagementUtil.getCurrentTime());
		timeClock.setStatus(TimeClock.Status.SUBMITTED);
		timeManagementRepository.insertTimeClockOut(timeClock);
		
		return TimeManagementUtil.buildModelAndView("clocked_out_screen");		
	}
	// Direct the user to the employee_select_timeclock page.
	// Requirement 2.2.1
	@RequestMapping("/calendar_screen")
	public ModelAndView viewLog() {
		
		return TimeManagementUtil.buildModelAndView("calendar_screen");
	}
	// Get the date from employee_select_timeclock page. Then find all time clock events for that date with the user's id. 
	// Pass the list of TimeClock to employee_display_timeclocks to show in a table.
	// Requirement 2.2.2
	@RequestMapping("/employee_hours_log_view")
	public ModelAndView displayLog(
			@RequestParam(name="date") String dateInString) {
		long id = TimeManagementUtil.getCurrentUserId();
		Date date = TimeManagementUtil.sqlDate(dateInString);
		long managerId = TimeManagementUtil.getCurrentManagerId();
		List<TimeClock> timeClocks = timeManagementRepository.findTimeClockEntries(id, date, managerId, null);		
		
		return TimeManagementUtil.buildModelAndView("employee_hours_log_view", "timeClocks", timeClocks);
	}	
	// When employee_display_timeoff is called, pass in all the time off requests with the user's id this year. 
	// Requirement 2.3.1
	@RequestMapping("/employee_timeoff_result")
	public ModelAndView timeOffResult() {
		long id = TimeManagementUtil.getCurrentUserId();
		long managerId = TimeManagementUtil.getCurrentManagerId();
		List<TimeOff> timeOffRequests = timeManagementRepository.findTimeOffEntries(id, managerId, null);
		
		return TimeManagementUtil.buildModelAndView("employee_timeoff_result", "timeOffRequests", timeOffRequests);		
	}
	// When employee_request_timeoff is called, pass in the user's information as an Employee object. 
	// This way, the user's time off hours can be used in a table
	// Requirement 2.3.2
	@GetMapping("/employee_timeoff_request")
	public ModelAndView showTimeOffRequests(){		
		long id = TimeManagementUtil.getCurrentUserId();
		Employee employeeInfo = timeManagementRepository.findEmployeeById(id);	
		
		return TimeManagementUtil.buildModelAndView("employee_timeoff_request", "employeeInfo", employeeInfo);
	}
	// When the user submits a new time off requests, enter the request in the TimeOff table.
	// Also calculate all the hours used, deduct from user's Employee table entry.
	// Requirement 2.3.4 & 2.3.5
	@PostMapping("/employee_timeoff_request")
	@Transactional 
	public ModelAndView handleIimeOffRequest(
			@RequestParam(name="startDate") String startDateInString,
			@RequestParam(name="endDate") String endDateInString,
			@RequestParam(name="pto", defaultValue = "0") float PTO,
			@RequestParam(name="sick", defaultValue = "0") float sick,
			@RequestParam(name="floater", defaultValue = "0") float floater) {
			
			// Convert the start date and end date to SQL date from String.
			Date startDate = TimeManagementUtil.sqlDate(startDateInString);
			Date endDate = TimeManagementUtil.sqlDate(endDateInString);
			Date today = TimeManagementUtil.getCurrentDate();
			// If the information entered was incorrect, just refresh the page and do nothing.
			if (startDate == null || endDate == null || startDate.compareTo(endDate) > 0 || startDate.compareTo(today) < 0) {
				return showTimeOffRequests();
			}
						
			LocalDate start = startDate.toLocalDate();
			LocalDate end = endDate.toLocalDate();
			// Calculate how many days are in this time off request, exclude Saturdays and Sundays.
			int days = 0;
			while (!start.isAfter(end)) {
				if (!(start.getDayOfWeek() == DayOfWeek.SATURDAY || start.getDayOfWeek() == DayOfWeek.SUNDAY)) {
					days++;
				}
				start = start.plusDays(1);
			}
			// If the requested hours is zero or the requested hours is less than the entered hours of time off type, refresh the page and do nothing.
			if (days == 0 || (days * 8) < (PTO + sick + floater)) {
				return showTimeOffRequests();
			}
			// At this point, get the user's Employee information from the database.
			long id = TimeManagementUtil.getCurrentUserId();
			Employee employeeInfo = timeManagementRepository.findEmployeeById(id);
			float availablePTO = employeeInfo.getAccruedPTO();
			float availableSick = employeeInfo.getAvailableSick();
			float availableFloater = employeeInfo.getAvailableFloater();
			// If the requested time off of each type is less than the available amount, refresh the page and do nothing.
			if (availablePTO < PTO || availableSick < sick || availableFloater < floater) {
				return showTimeOffRequests();
			}
			
			float unpaid = (days * 8) - PTO - sick - floater;
			String employeeName = employeeInfo.getName();
			// Make a new TimeOff object based on the request and user's employee information with REQUESTED status.
			TimeOff timeOff = new TimeOff();
			timeOff.setId(id);
			timeOff.setName(employeeName);
			timeOff.setStartDate(startDate);
			timeOff.setEndDate(endDate);
			timeOff.setPtoRequested(PTO);
			timeOff.setSickRequested(sick);
			timeOff.setFloaterRequested(floater);
			timeOff.setUnpaidRequested(unpaid);
			timeOff.setStatus(TimeOff.Status.REQUESTED);
			// Update the user's hours based on the requested hours.
			timeManagementRepository.updateEmployeeTimeOff(id, PTO, sick, floater, unpaid);
			timeManagementRepository.insertTimeOffRequest(timeOff);
			// Return the user to see the results on /employee_display_timeoff page.
			return timeOffResult();		
	}

}
