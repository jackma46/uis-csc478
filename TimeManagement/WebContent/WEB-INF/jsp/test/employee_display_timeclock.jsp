<!--This is the employee view time clock page, the user should be to view time clock events in a table. 
	Requirement 2.2.2-->
	
<table border="1" cellpadding="5">
   	<caption><b>List of Time Clock Events</b></caption>
    	<tr>
      		<th>Date</th>
      		<th>Time In</th>
      		<th>Time Out</th>
      		<th>Status</th>
    		</tr>
    	<c:forEach var="tm" items="${timeClocks}">
       	<tr>
         	<td>${tm.formattedDate}</td>
         	<td>${tm.timeIn}</td>
         	<td>${tm.timeOut}</td>
         	<td>${tm.status}</td>
        </tr>
    	</c:forEach>
</table>

<br>
<br>

<table class="layout-table">
	<tr>
		<td>
			<form action="employee_select_timeclock.html" id="form1">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixManCalender.png">
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