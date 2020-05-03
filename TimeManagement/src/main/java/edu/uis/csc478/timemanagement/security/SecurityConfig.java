/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

/*
 * This class utilize the security framework provided by Spring to provide critical security functions for the web application.
 * Requirements 1.10, 1.2.0, 1.3.0, 2.4.1, & 3.3.1
 */

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
    private TimeManagementRepository timeManagementRepository;
 
	@Bean
    public TimeManagementAuthenticationProvider authProvider() throws Exception {
    	return new TimeManagementAuthenticationProvider(timeManagementRepository);
    }
	
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider());
    }
    
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http
          .csrf().disable()
          // Only permit access to user who has authenticated. Also only permit access to /manage/ links with manager level authority.
          // Requirement 1.2.0 & 1.3.0
          .authorizeRequests()
	          .antMatchers("/manage/**").hasAuthority("MANAGER")
	          .antMatchers("/**/*.html").authenticated()
	          .anyRequest().permitAll()
          .and()
          // Redirect users who have successfully authenticated to the welcome screen, controlled by the HomeController.
          // Requirement 1.1.0
	          .formLogin()
	          .loginPage("/login.jsp")
	          .loginProcessingUrl("/perform_login")
	          .defaultSuccessUrl("/welcome.html", true)
	          .failureUrl("/login.jsp?error=true")
          .and()
          // When the user logs out, delete the session cookie and end the session. Then redirect user to the log in page.
          // Requirement 2.4.1 & 3.31
	          .logout()
	          .logoutUrl("/perform_logout")
	          .deleteCookies("JSESSIONID")
	          .logoutSuccessUrl("/login.jsp");
    }
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
