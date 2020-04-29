package edu.uis.csc478.timemanagement.repository;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import edu.uis.csc478.timemanagement.model.Employee;
import edu.uis.csc478.timemanagement.model.TimeClock;
import edu.uis.csc478.timemanagement.model.TimeOff;

public interface TimeManagementRepository {
	
	Employee findEmployeeById(@Param("id") long od);
	
	int insertTimeClockIn(TimeClock timeClock);
	
	int insertTimeClockOut(TimeClock timeClock);
	
	List<TimeClock> findTimeClockEntries(@Param("id") long id, @Param("date") Date date, 
			@Param("managerId") long managerId, @Param("status") TimeClock.Status status);
	
	TimeClock findTimeClockEntry(@Param("tcId") long tcId);

	int updateEmployeeTimeOff(@Param("id") long id, @Param("PTO") float PTO, @Param("sick") float sick, @Param("floater") float floater, @Param("unpaid") float unpaid);

	int insertTimeOffRequest(TimeOff timeOff);
	
	List<Employee> findSubordinates (@Param("id") long id);
	
	int approveEmployeeTimeClock(@Param("tcId") long tcId, @Param("status") TimeClock.Status Status);
	
	int approveEmployeeTimeOff(@Param("toId") long toId, @Param("status") TimeOff.Status Status);
	
	List<TimeOff> findTimeOffEntries(@Param("employeeId") long employeeId, @Param("managerId") long managerId, @Param("status") TimeOff.Status status);
	
	TimeOff findTimeOffEntry(@Param("toId") long toId);
	
	int refundTimeOff(@Param("to") TimeOff to);

}
 