package edu.uis.csc478.timemanagement.repository;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.uis.csc478.timemanagement.model.Employee;

public interface TimeManagementRepository {
	
	@Select("select * from employee where id = #{id}")
	Employee findEmployeeById(@Param("id") long id);

}
