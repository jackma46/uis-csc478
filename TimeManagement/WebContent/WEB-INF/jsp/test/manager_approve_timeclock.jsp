<!--This is the manager time clock approval page. The user should see all the submitted time clock events in a table with check boxes. 
	Requirement 3.2.1 & 3.2.2-->
	
<form action="manage/approve_timeclock.html" method="post" id="form1">
	<table border="1" cellpadding="5">
   		<caption><b>List of Time Clock Events</b></caption>
    	<tr>
    		<th><input type="checkbox" id="allcb" name="allcb"></th>
    		<th>Name</th>
      		<th>Date</th>
      		<th>Time In</th>
      		<th>Time Out</th>
      		<th>Status</th>
    		</tr>
    	<c:forEach var="tm" items="${timeClocks}">
       	<tr>
       		<td><input type="checkbox" id="${tm.timeClockId}" value="${tm.timeClockId}" name="timeClockIds[]">
       		<td>${tm.name}</td>
         	<td>${tm.formattedDate}</td>
         	<td>${tm.timeIn}</td>
         	<td>${tm.timeOut}</td>
         	<td>${tm.status}</td>
        </tr>
    	</c:forEach>
	</table>
</form>
	<br>
	<br>
	<div>
<table class="layout-table">
	<tr>
		<td>
			<form action="" id="form1">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixCheck.png">
			</form>
		<td>
			<form action="manage/select_timeclock.html" id="form3">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixManCalendar.png">
			</form>
		</td>
		<td>
			<form action="welcome.html" id="form3">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixBackArrow.png">
			</form>
		</td>
		<td>
			<form action="perform_logout" id="form4">
				<input type="image"
					src="${pageContext.request.contextPath}/img/HomeIcon.png">
			</form>
		</td>
	</tr>
</table>