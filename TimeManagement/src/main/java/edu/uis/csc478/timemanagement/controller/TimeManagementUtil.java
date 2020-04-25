package edu.uis.csc478.timemanagement.controller;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

public class TimeManagementUtil {
	
	private static final ZoneId TM_ZONE = ZoneId.of("America/Chicago");
			
	public static UsernamePasswordAuthenticationToken getCurrentUser() {
		return (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
	}
	
	public static String getCurrentUserName() {
		UsernamePasswordAuthenticationToken auth = 
				(UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
		return (String) auth.getDetails();
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
	
}
