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
	
	@GetMapping("/employee_timeoff_request")
	public ModelAndView showRequestTimeOff(){		
		long id = TimeManagementUtil.getCurrentUserId();
		Employee employeeInfo = timeManagementRepository.findEmployeeById(id);	
		
		return TimeManagementUtil.buildModelAndView("employee_timeoff_request", "employeeInfo", employeeInfo);
	}
	
	@PostMapping("/employee_timeoff_request")
	public ModelAndView handleRequestTimeOff(
			@RequestParam(name="startDate") String startDate,
			@RequestParam(name="endDate") String endDate,
			@RequestParam(name="PTO", defaultValue = "0") float PTO,
			@RequestParam(name="Sick", defaultValue = "0") float sick) {
		
			Date sDate = TimeManagementUtil.sqlDate(startDate);
			Date eDate = TimeManagementUtil.sqlDate(endDate);
			
			if (sDate == null || eDate == null || sDate.compareTo(eDate) > 0) {
				return showRequestTimeOff();
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
				return showRequestTimeOff();
			}
			
			long id = TimeManagementUtil.getCurrentUserId();
			Employee employeeInfo = timeManagementRepository.findEmployeeById(id);	
			float availablePTO = employeeInfo.getAccruedPTO();
			float availableSick = employeeInfo.getAvailableSick();
			
			if (availablePTO < PTO || availableSick < sick) {
				return showRequestTimeOff();
			}
			
			float unpaid = days * 8 - PTO - sick;
			
			TimeOff timeOff = new TimeOff();
			timeOff.setId(id);
			timeOff.setPtoRequested(PTO);
			timeOff.setSickRequested(sick);
			timeOff.setStartDate(sDate);
			timeOff.setEndDate(eDate);
			timeOff.setStatus(TimeOff.Status.REQUESTED);
			
			timeManagementRepository.updateEmployeeTimeOff(id, PTO, sick, unpaid);
			timeManagementRepository.insertTimeOffRequest(timeOff);
			
			return timeOffResult();		
	}	
	
	@RequestMapping("/employee_timeoff_result")
	public ModelAndView timeOffResult() {
		long id = TimeManagementUtil.getCurrentUserId();
		String year = TimeManagementUtil.getCurrentDate().toString();
		int index = year.indexOf('-');
		year = year.substring(0, index-1);
		List<TimeOff> timeOffRequest = timeManagementRepository.getTimeOffRequests(id, year);
		
		return TimeManagementUtil.buildModelAndView("employee_timeoff_result", "timeOffRequest", timeOffRequest);	
		
	}
}
