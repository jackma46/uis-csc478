/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import edu.uis.csc478.timemanagement.model.Employee;

/*
 * This is an utility interface designed to support the controllers. The methods in here are used in all three controller classes.
 * This interface utilize the Spring Framework.
 */

public class TimeManagementUtil {
	// The default SQL time zone is central time, the SQL code for it is "America/Chicago"
	private static final ZoneId TM_ZONE = ZoneId.of("America/Chicago");
			
	public static UsernamePasswordAuthenticationToken getCurrentUser() {
		return (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
	}
	
	public static String getCurrentUserName() {
		return getCurrentEmployee().getName();
	}
	
	public static long getCurrentManagerId() {
		return getCurrentEmployee().getManagerID();
	}
	
	public static Employee getCurrentEmployee() {
		return (Employee) getCurrentUser().getDetails();
	}
	
	public static long getCurrentUserId() {
		return Long.parseLong(getCurrentUser().getName());
	}

	public static Date getCurrentDate() {
		return Date.valueOf(LocalDate.now(TM_ZONE));
	}
	
	public static Time getCurrentTime() {
		return Time.valueOf(LocalTime.now(TM_ZONE));
	}
	
	public static boolean isBlank(String s) {
		return s == null || s.trim().length() == 0;
	}
	// The Spring provided buildModelAndView to call a JSP
	public static ModelAndView buildModelAndView(String jsp) {
		return buildModelAndView(jsp, null, null);
	}
	// Call the JSP but also pass in an object.
	public static ModelAndView buildModelAndView(String jsp, String modelName, Object model) {
		if (jsp.contains(":")) {
			return new ModelAndView(jsp);
		}
		
		// When calling the correct JSP, pass the current date, time, employee name within the context TimeManagementContext
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		TimeManagementContext context = new TimeManagementContext();
		context.setCurrentDate(df.format(getCurrentDate()));
		context.setCurrentTime(getCurrentTime().toString());
		context.setEmployeeName(getCurrentUserName());
		context.setContentJsp(jsp + ".jsp");
		
		Map<String, Object> data = new HashMap<>();
		data.put("tmContext", context);
		if ((! isBlank(modelName)) && model != null) {
			data.put(modelName, model);
		}
		return new ModelAndView(jsp, data);
	}
	
	public static Date sqlDate (String s) {
		try {
			return Date.valueOf(s);
		}
		catch (Exception e) {
			return null;
		}
	}	
}
