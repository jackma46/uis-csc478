<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Time Off Requests</title>
<style>
		.buttons { 
  			width: 40%;
 			table-layout: fixed;
 			border-collapse: collapse;
		}
		.buttons button { 
  			width: 100%;
		}
	</style>
</head>
<header>
	<h1 id="headline"><b>Team Grammers</b></h1>
</header>
<body>
	<br>
	<br>
	<table border="1" cellpadding="5">
   		<caption><b>List of Time Off Requests</b></caption>
    	<tr>
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
	<br>
	<br>
	<div>
		<form action="manage/select_timeoff" method=get id="form1"></form>
		<form action="welcome.html" id="form2"></form>
		<form action="perform_logoff" id="form3"></form>	
		<table class=buttons>
		<tr>
			<td><Button type="submit" form="form1">View Other Requests</Button>
			<td><Button type="submit" form="form2">Back To Home</Button>
			<td><Button type="submit" form="form3">Log Off</Button>
		</table>
	</div>

</body>
</html>