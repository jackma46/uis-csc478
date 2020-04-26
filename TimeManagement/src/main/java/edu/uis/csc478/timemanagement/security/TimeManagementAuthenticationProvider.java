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

public class TimeManagementAuthenticationProvider implements AuthenticationProvider {

	private final TimeManagementRepository timeManagementRepository;

	public TimeManagementAuthenticationProvider(TimeManagementRepository timeManagementRepository) {
		this.timeManagementRepository = timeManagementRepository;
	}

	@Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
  
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
        if (TimeManagementUtil.isBlank(name) || TimeManagementUtil.isBlank(password)) {
        	return null;
        }
        long id;
        try {
        	id = Long.parseLong(name.trim());
        } catch (Exception ex) {
        	return null;
        }
        
        Employee employee = timeManagementRepository.findEmployeeById(id);
        if (employee == null || (! password.equals(employee.getPassword()))) {
        	return null;
        }
        
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        grantedAuthorities.add(() -> "EMPLOYEE");
        if (employee.getManagerID() <= 0) {
        	grantedAuthorities.add(() -> "MANAGER");
        }
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
