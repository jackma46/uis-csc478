package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
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
				return TimeManagementUtil.buildModelAndView("redirect:manage/welcome.html");
		}
		
		long id = TimeManagementUtil.getCurrentUserId();
		Date today = TimeManagementUtil.getCurrentDate();
		List<TimeClock> entries = timeManagementRepository.findTimeClockEntries(id, today);
		for (TimeClock tc : entries) {
			if (tc.getTimeOut() == null)
				return TimeManagementUtil.buildModelAndView("employee_login_screen_ClockOut");
		}		

		return TimeManagementUtil.buildModelAndView("employee_login_screen_ClockIn");
	}
	
}
