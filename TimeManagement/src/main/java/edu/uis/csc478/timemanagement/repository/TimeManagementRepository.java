package edu.uis.csc478.timemanagement.repository;

import org.apache.ibatis.annotations.Param;

import edu.uis.csc478.timemanagement.model.Employee;

public interface TimeManagementRepository {
	
	Employee findEmployeeById(@Param("id") long id);

}
