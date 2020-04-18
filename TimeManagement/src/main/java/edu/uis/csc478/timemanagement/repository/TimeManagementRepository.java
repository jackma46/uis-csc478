package edu.uis.csc478.timemanagement.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.model.TimeClock;

public interface TimeManagementRepository {
	
	Employee findEmployeeById(@Param("id") long id);
	
	List<TimeClock> findTodayTimeClockEntries(@Param("id") long id);

}
