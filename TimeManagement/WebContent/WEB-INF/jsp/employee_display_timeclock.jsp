<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Time Clock</title>
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
	<div>
		<table border="1" cellpadding="5">
   		<caption><b>List of Time Clocks</b></caption>
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
	</div>
	<br>
	<br>

  	<div>
  	<form action="employee_select_timeclock.html" id="form1"></form>
	<form action="welcome.html" id="form2"></form>
	<form action="perform_logout" id="form3"></form>
	<table class=buttons>
	<tr>
		<td><Button type="submit" form="form1">View Another Day</Button>
		<td><Button type="submit" form="form2">Go Back</Button>
		<td><Button type="submit" form="form3">Log Out</Button>
	</table>
	</div>
</body>
</html>