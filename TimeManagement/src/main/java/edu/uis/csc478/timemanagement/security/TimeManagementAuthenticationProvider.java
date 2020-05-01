/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;

import edu.uis.csc478.timemanagement.controller.TimeManagementUtil;
import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

/*
 * This class utilize the security framework provided by Spring to authenticate the user using the provide ID and password.
 * Requirements 1.1.0 & 1.3.0
 */

public class TimeManagementAuthenticationProvider implements AuthenticationProvider {

	private final TimeManagementRepository timeManagementRepository;

	public TimeManagementAuthenticationProvider(TimeManagementRepository timeManagementRepository) {
		this.timeManagementRepository = timeManagementRepository;
	}

	@Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
  
		// Bring in the provided ID and password as strings name and password
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
        // If name or password is blank, authentication failed, return null.
        if (TimeManagementUtil.isBlank(name) || TimeManagementUtil.isBlank(password)) {
        	return null;
        }
        // If name cannot be parsed to a number, authentication failed, return null.
        long id;
        try {
        	id = Long.parseLong(name.trim());
        } catch (Exception ex) {
        	return null;
        }
        // If the provided ID cannot be found in the database, authentication failed, return null.
        // Requirement 1.1.0
        Employee employee = timeManagementRepository.findEmployeeById(id);
        if (employee == null || (! password.equals(employee.getPassword()))) {
        	return null;
        }
        // Otherwise, the employee ID matches the stored password, then grant the user authority based on if they are a manager.
        // Requirement 1.3.0
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        grantedAuthorities.add(() -> "EMPLOYEE");
        if (employee.getManagerID() <= 0) {
        	grantedAuthorities.add(() -> "MANAGER");
        }
        // Create and return the authentication token.
        UsernamePasswordAuthenticationToken auth = 
        		new UsernamePasswordAuthenticationToken(name, password, grantedAuthorities);
        auth.setDetails(employee);
        return auth;
    }
	
	@Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
	
}
