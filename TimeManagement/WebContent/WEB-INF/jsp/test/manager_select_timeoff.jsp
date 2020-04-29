<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Time Off Requests</title>
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
<header>
	<h1 id="headline"><b>Team Grammers</b></h1>
</header>
<body>
<br>
<br>
	<form action="manage/select_timeclock.html" method=post id="form1">
		
		<label for="employees">Please select employee:</label>		
		<select id="employees" name="employeeId">
			<option value=0>All</option>
			<c:forEach var="tm" items="managed">
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
	<form action="welcome.html" id="form2"></form>
	<form action="perform_logout" id="form3"></form>
	<br>
	<br>
    <div>
	<table class=buttons>
	<tr>
		<td><Button type="submit" form="form1">Display Requests</Button>
		<td><Button type="submit" form="form2">Back To Home</Button>
		<td><Button type="submit" form="form3">Log Out</Button>
	</table>
	</div>

</body>
</html>