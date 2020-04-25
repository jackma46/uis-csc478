package edu.uis.csc478.timemanagement.controller;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.uis.csc478.timemanagement.model.TimeClock;
import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

@Controller
public class HomeController {
	
	@Autowired
	private TimeManagementRepository timeManagementRepository;

	@RequestMapping("/welcome")
	public ModelAndView home() {
		
		UsernamePasswordAuthenticationToken user = TimeManagementUtil.getCurrentUser();
		Collection<GrantedAuthority> authorities = user.getAuthorities();
		for (GrantedAuthority a : authorities) {
			if ("MANAGER".equals(a.getAuthority()))
				return new ModelAndView("employee_login_screen_ClockOut");
		}
		
		long id = TimeManagementUtil.getCurrentUserId();
		List<TimeClock> entries = timeManagementRepository.findTodayTimeClockEntries(id);
		for (TimeClock tc : entries) {
			if (tc.getTimeOut() == null)
				return new ModelAndView("employee_login_screen_ClockOut");
		}		

		return new ModelAndView("employee_login_screen_ClockIn");
	}
//	
//	@RequestMapping("/employee_login_screen_ClockOut")
//	public ModelAndView clockOut() {
//		
//	}
//	
//	@RequestMapping("/employee_")
//	
//	@RequestMapping("/manager/home")
//	public ModelAndView managerHome() {
//		
//	}
//	
//	@RequestMapping("manager/select_timeclock")
//	public ModelAndView selectTimeClock() {
//		
//	}
//	
//	@RequestMapping("manager/approve_timeclock")
//	public ModelAndView approveTimeClock() {
//		
//	}
//	
//	@RequestMapping("manager/select_timeoff")
//	public ModelAndView selectTimeOff() {
//		
//	}
//	
//	@RequestMapping("manager/approve_timeoff")
//	public ModelAndView approveTimeOff() {
//		
//	}
	
}
