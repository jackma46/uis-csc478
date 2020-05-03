/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

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

/*
 * This controller is built on Spring Framework.
 * This controller should check the user authentication and redirect the user based on authority.
 * Requirement 1.4.0 & 2.1.0
 */

@Controller
public class HomeController {
	
	@Autowired
	private TimeManagementRepository timeManagementRepository;
		
	@RequestMapping("/welcome")
	public ModelAndView home() {
		
		// Get user's authentication and their authorities.
		UsernamePasswordAuthenticationToken user = TimeManagementUtil.getCurrentUser();
		Collection<GrantedAuthority> authorities = user.getAuthorities();
		// If the authority is manager, then redirect the user to the manager welcome page.
		// Requirement 1.4.0
		for (GrantedAuthority a : authorities) {
			if ("MANAGER".equals(a.getAuthority()))
				return TimeManagementUtil.buildModelAndView("redirect:manage/welcome.html");
		}
		// Otherwise, get the needed information to check the TimeClock database table if the user has already clocked in.
		// Requirement 2.0.0 & 2.1.0
		long id = TimeManagementUtil.getCurrentUserId();
		Date today = TimeManagementUtil.getCurrentDate();
		long managerID = TimeManagementUtil.getCurrentManagerId();
		List<TimeClock> entries = timeManagementRepository.findTimeClockEntries(id, today, managerID, TimeClock.Status.UNFINISHED);
		// If the user does have an unfinished TimeClock entry, direct the user to the employee_clockout page.
		if (!entries.isEmpty()) {
				return TimeManagementUtil.buildModelAndView("employee_clockout_screen");
		}		
		// Otherwise, direct the user to the employee_clockin page
		return TimeManagementUtil.buildModelAndView("employee_clockin_screen");
	}
	
}
