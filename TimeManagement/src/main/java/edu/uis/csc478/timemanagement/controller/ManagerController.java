package edu.uis.csc478.timemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.uis.csc478.timemanagement.repository.TimeManagementRepository;

@Controller
public class ManagerController {

	@Autowired
	private TimeManagementRepository timeManagementRepository;
	
	
}
