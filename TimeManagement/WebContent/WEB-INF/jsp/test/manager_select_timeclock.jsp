<!--This is the manager select time clock page. The user can specify the employee, the date, and the status of time clock events to display.
	Requirement 3.1.3 & 3.1.4-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<table class="layout-table">
	<tr><td colspan="3" align="center">
		<form action="manager_select_timeclock.html" method=post id="form1">
			<label for="datepicker" >Please select a date:</label>	
			<input type="text" id="datepicker" name="date">
				
			<label for="employees">Please select employee:</label>		
			<select id="employees" name="employeeId">
				<option value="0">All</option>
				<c:forEach var="tm" items="${managed}">
				<option value="${tm.id}">${tm.name}</option>
				</c:forEach>
			</select>
				
			<label for="status">Please select status:</label>	
			<select id="status" name="status">
				<option value="ALL">ALL</option>
				<option value="APPROVED">APPROVED</option>
				<option value="SUBMITTED">SUBMITTED</option>
				<option value="UNFINISHED">UNFINISHED</option>
			</select>				
		</form>
	</td></tr>
	<tr></tr>
	<tr></tr>
	<tr>
		<td>
			<form id="submit_form_info">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixCheck.png">
			</form>
		</td>
		<td>
			<form action="welcome.html" id="form2">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixBackArrow.png">
			</form>
		</td>
		<td>
			<form action="perform_logout" id="form3">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixHomeIcon.png">
			</form>
		</td>
	</tr>
</table>