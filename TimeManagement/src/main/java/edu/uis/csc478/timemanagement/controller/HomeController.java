package edu.uis.csc478.timemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

@Controller
public class HomeController {
	
	@Autowired
	private TimeManagementRepository timeManagementRepository;

	@RequestMapping("/welcome")
	public ModelAndView home() {
		System.out.println(timeManagementRepository);
//		Employee employee = timeManagementRepository.findEmployeeById(100L);
//		System.out.println(employee);
		String message = "Welcome to TimeClock";
		return new ModelAndView("welcome", "message", message);
	}
}
