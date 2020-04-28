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

/**
 * @author Jack Ma
 * Part of UIS CSC 478 Team Grammers Project
 * 
 */

@Controller
public class HomeController {
	
	@Autowired
	private TimeManagementRepository timeManagementRepository;
	
	/**
	 * 
	 * This connects any call to welcome.html, which is called once the user has logged in.
	 * Depending on user's authority, user will be redirected to manager, or employee screen.
	 * (user story 1.5 and 2.1)	 
	 *  
	 */		
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
		long managerID = TimeManagementUtil.getCurrentManagerId();
		List<TimeClock> entries = timeManagementRepository.findTimeClockEntries(id, today, managerID, null);
		for (TimeClock tc : entries) {
			if (tc.getTimeOut() == null)
				return TimeManagementUtil.buildModelAndView("employee_login_screen_clockout");
		}		

		return TimeManagementUtil.buildModelAndView("employee_login_screen_clockin");
	}
	
}
