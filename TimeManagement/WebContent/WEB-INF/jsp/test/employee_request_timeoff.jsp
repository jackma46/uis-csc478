<!--This is the employee view time off request page. The user should see their available and used hours in a table and enter the dates and hours for their new request.
	Requirement 2.3.2 & 2.3.3-->
	
<table border="1" cellpadding="5">
   	<caption><b>Your available and used hours:</b></caption>
    	<tr>
      		<th>PTO Available</th>
      		<th>PTO Used</th>
      		<th>Sick Available</th>
      		<th>Sick Used</th>
      		<th>Floater Available</th>
      		<th>Floater Used</th>
      		<th>Unpaid Used</th>
    	</tr>
    <c:set var="tm" value="${employeeInfo}" />
       	<tr>
         	<td>${tm.accruedPTO}</td>
         	<td>${tm.usedPTO}</td>
         	<td>${tm.availableSick}</td>
         	<td>${tm.usedSick}</td>
         	<td>${tm.availableFloater}</td>
         	<td>${tm.usedFloater}</td>
         	<td>${tm.usedUnpaid}</td>
        </tr>
	</c>
</table>
<br>
<br>
<form action="employee_request_timeoff" method="post" id=form1>
	<label for="from">Start Date</label>
	<input type="text" id="from" name="startDate">
	<label for="to">End Date</label>
	<input type="text" id="to" name="endDate"><br>
	<label for="pto">PTO Hours:</label>
	<input type="number" id="pto" name="pto"><br>
	<label for="sick">Sick Hours:</label>
	<input type="number" id="pto" name="pto"><br>
	<label for="floater">Floater Hours:</label>
	<input type="number" id="pto" name="pto"><br>		
</form>
<br>
<br>
<table class="layout-table">
	<tr>
		<td>
			<form action="employee_display_timeoff.html" id="form1">
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