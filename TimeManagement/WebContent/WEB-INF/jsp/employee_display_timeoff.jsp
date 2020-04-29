<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Time Off Requests</title>
	<style>
		.buttons { 
  			width: 30%;
 			table-layout: fixed;
 			border-collapse: collapse;
		}
		.buttons button { 
  			width: 100%;
		}
	</style>

</head>
<body>
	<br>
	<br>
	<b>Here are all your time off requests this year:</b><br>
	<div>
		<table border="1" cellpadding="5">
   		<caption><b>List of Time Off Events</b></caption>
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
	</div>
	<br>
	<br>
	<div>
  	<form action="employee_request_timeoff.html" id="form1"></form>
	<form action="welcome.html" id="form2"></form>
	<form action="perform_logout" id="form3"></form>
	<table class=buttons>
	<tr>
		<td><Button type="submit" form="form1">New Request</Button>
		<td><Button type="submit" form="form2">Go Back</Button>
		<td><Button type="submit" form="form3">Log Out</Button>
	</table>
	</div>

</body>
</html>