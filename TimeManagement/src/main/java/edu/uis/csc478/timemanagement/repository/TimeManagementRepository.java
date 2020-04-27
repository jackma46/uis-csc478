package edu.uis.csc478.timemanagement.repository;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.model.TimeClock;
import edu.uis.csc478.timemanagement.model.TimeOff;

public interface TimeManagementRepository {
	
	Employee findEmployeeById(@Param("id") long id);
	
	int insertTimeClockIn(TimeClock timeClock);
	
	int insertTimeClockOut(TimeClock timeClock);
	
	List<TimeClock> findTimeClockEntries(@Param("id") long id, @Param("date") Date date, 
			@Param("managerId") long managerId, @Param("status") TimeClock.Status status);
	
	TimeClock findTimeClockEntry(@Param("tcID") long tcID);

	int updateEmployeeTimeOff(@Param("id") long id, @Param("PTO") float PTO, @Param("sick") float sick, @Param("unpaid") float unpaid);

	int insertTimeOffRequest(TimeOff timeOff);
	
	List<Employee> findSubordinates (@Param("id") long id);
	
	int approveEmployeeTimeClock(@Param("tcID") long tcID, @Param("status") TimeClock.Status Status);
	
	int approveEmployeeTimeOff(@Param("toID") long toID, @Param("status") TimeOff.Status Status);
	
	List<TimeOff> findTimeOffEntries(@Param("employeeID") long employeeId, @Param("managerID") long managerId, @Param("status") TimeOff.Status status);
	
	TimeOff findTimeOffEntry(@Param("toID") long toID);

}
 