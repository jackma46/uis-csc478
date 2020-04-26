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
	
	List<TimeClock> findTimeClockEntries(@Param("id") long id, @Param("date") Date date);
	
	List<TimeOff> getTimeOffRequests(@Param("id") long id, @Param("year") String year);

	int updateEmployeeTimeOff(@Param("id") long id, @Param("PTO") float PTO, @Param("sick") float sick, @Param("unpaid") float unpaid);

	int insertTimeOffRequest(TimeOff timeOff);

}
