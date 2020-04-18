package edu.uis.csc478.timemanagement.controller;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
		
		UsernamePasswordAuthenticationToken user = (UsernamePasswordAuthenticationToken)SecurityContextHolder.getContext().getAuthentication();
		Collection<GrantedAuthority> authorities = user.getAuthorities();
		for (GrantedAuthority a : authorities) {
			if ("MANAGER".equals(a.getAuthority()))
				return new ModelAndView("employee_login_screen_ClockIn");
		}
		
		long id = Long.parseLong(user.getName());
		List<TimeClock> entries = timeManagementRepository.findTodayTimeClockEntries(id);
		for (TimeClock tc : entries) {
			if (tc.getTimeout() == null)
				return new ModelAndView("employee_login_screen_ClockOut");
		}		

		return new ModelAndView("employee_login_screen_ClockIn");
	}
}
