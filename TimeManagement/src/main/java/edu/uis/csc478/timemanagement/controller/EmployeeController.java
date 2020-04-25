package edu.uis.csc478.timemanagement.controller;

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
		timeManagementRepository.insertTimeClock(timeClock);
		
		return new ModelAndView("Clocked_in_Screen");
	}

}
