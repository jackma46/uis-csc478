<!--This is the employee view time off request page, the user should be able to view time off requests in a table.
	Requirement 2.3.1 & 2.3.5-->
	
<table border="1" cellpadding="5">
   	<caption><b>List of Time Off Requests</b></caption>
    	<tr>
      		<th>Start Date</th>
      		<th>End Date</th>
      		<th>PTO Requested</th>
      		<th>Sick Requested</th>
      		<th>Floater Requested</th>
      		<th>Unpaid Requested</th>
      		<th>Status</th>
    		</tr>
    <c:forEach var="tm" items="${timeOffs}">
       	<tr>
         	<td>${tm.startDate}</td>
         	<td>${tm.endDate}</td>
         	<td>${tm.PTORequested}</td>
         	<td>${tm.sickRequested}</td>
         	<td>${tm.floaterRequested}</td>
         	<td>${tm.unpaidRequested}</td>
         	<td>${tm.status}</td>
        </tr>
    </c:forEach>
</table>

	<br>
	<br>
	
<table class="layout-table">
	<tr>
		<td>
			<form action="employee_select_timeoff.html" id="form1">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixCalender.png">
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