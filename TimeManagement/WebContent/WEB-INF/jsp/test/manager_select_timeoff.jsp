<!--This is the manager select time off page. The user can specify the employee and the status of requests to display.
	Requirement 3.2.3 & 3.2.4-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="manager_select_timeoff.html" method=post id="form1">		
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
		<option value="REJECTED">REJECTED</option>
		<option value="REQUESTED">REQUESTED</option>
	</select>
</form>				
<br>
<br>
<table class="layout-table">
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