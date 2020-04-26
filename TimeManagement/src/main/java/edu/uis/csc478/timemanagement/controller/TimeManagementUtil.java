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

public class TimeManagementUtil {
	
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
	
	public static ModelAndView buildModelAndView(String jsp) {
		return buildModelAndView(jsp, null, null);
	}
	
	public static ModelAndView buildModelAndView(String jsp, String modelName, Object model) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		TimeManagementContext context = new TimeManagementContext();
		context.setCurrentDate(df.format(getCurrentDate()));
		context.setCurrentTime(getCurrentTime().toString());
		context.setEmployeeName(getCurrentUserName());
		
		Map<String, Object> data = new HashMap<>();
		data.put("context", context);
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
