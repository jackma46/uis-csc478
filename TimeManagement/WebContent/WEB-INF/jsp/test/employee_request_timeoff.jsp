<!--This is the employee view time off request page. The user should see their available and used hours in a table and enter the dates and hours for their new request.
	Requirement 2.3.2 & 2.3.3-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
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

<form action="employee_request_timeoff.html" method="post" id=form1>
	<table class="layout-table">
		<tr>
			<td><label for="from">Start Date:</label></td>
			<td><input type="text" id="from" name="startDate"></td>
			<td></td>
		</tr>
		<tr>
			<td><label for="to">End Date:</label></td>
			<td><input type="text" id="to" name="endDate"></td>
			<td></td>
		</tr>
		<tr>
			<td><label for="pto">PTO Hours:</label></td>
			<td><input type="number" id="pto" name="pto"></td>
			<td></td>
		</tr>
		<tr>
			<td><label for="sick">Sick Hours:</label></td>
			<td><input type="number" id="sick" name="sick"></td>
			<td></td>
		</tr>
		<tr>
			<td><label for="floater">Floater Hours:</label></td>
			<td><input type="number" id="floater" name="floater"></td>
			<td></td>
		</tr>
	</table>		
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