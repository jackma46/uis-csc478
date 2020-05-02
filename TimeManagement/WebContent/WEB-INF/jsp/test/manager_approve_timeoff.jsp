<!--This is the manager time off approval page. The user should see all the submitted time off request in a table with check boxes. 
	Requirement 3.2.1 & 3.2.2-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="manager_approve_timeoff.html" method="post" id="form1">
	<input type="hidden" id="status" name="newStatus" value="APPROVE">
	<table border="1" cellpadding="5">
   		<caption><b>List of Time Off Requests</b></caption>
    	<tr>
    		<th><input type="checkbox" id="allcb" name="allcb"></th>
    		<th>Name</th>
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
       		<td><input type="checkbox" id="${tm.timeOffId}" value="${tm.timeOffId}" name="timeOffIds">
       		<td>${tm.name}</td>
         	<td>${tm.startDate}</td>
         	<td>${tm.endDate}</td>
         	<td>${tm.ptoRequested}</td>
         	<td>${tm.sickRequested}</td>
         	<td>${tm.floaterRequested}</td>
         	<td>${tm.unpaidRequested}</td>
         	<td>${tm.status}</td>
        </tr>
    	</c:forEach>
	</table>
</form>
<br>
<br>
<table class="layout-table">
	<tr>
		<td>
			<form action="" id="submit_form_info">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixCheck.png">
			</form>
		</td>
		<td>
			<form action="" id="submit_form_info2">
				<input type="hidden" >
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixX.png">
			</form>
		</td>
		<td>
			<form action="manager_select_timeoff.html" id="form3">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixCalendar.png">
			</form>
		</td>
		<td>
			<form action="welcome.html" id="form4">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixBackArrow.png">
			</form>
		</td>
	</tr>
</table>

