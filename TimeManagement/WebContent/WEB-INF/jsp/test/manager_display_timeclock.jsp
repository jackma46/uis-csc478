<!--This is the manager display time clock page. The user should all the selected time clock events in a table.
	Requirement 3.1.5-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		
<table border="1" cellpadding="5">
   	<caption><b>List of Time Clock Events</b></caption>
    	<tr>
    		<th>Name</th>
      		<th>Date</th>
      		<th>Time In</th>
      		<th>Time Out</th>
      		<th>Status</th>
    		</tr>
    <c:forEach var="tm" items="${timeClocks}">
       	<tr>
       		<td>${tm.name}</td>
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
			<form action="manager_select_timeclock.html" id="form1">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixManCalendar.png">
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