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
          .authorizeRequests()
	          .antMatchers("/manage/**").hasAuthority("MANAGER")
	          .antMatchers("/login*").permitAll()
	          .anyRequest().authenticated()
          .and()
	          .formLogin()
	          .loginPage("/login.jsp")
	          .loginProcessingUrl("/perform_login")
	          .defaultSuccessUrl("/welcome.html", true)
	          .failureUrl("/login.jsp?error=true")
          .and()
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
