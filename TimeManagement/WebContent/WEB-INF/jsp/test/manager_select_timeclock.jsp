<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Time Clock Events</title>
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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	    $( "#datepicker" ).datepicker();
	    $( "#format" ).on( "change", function() {
	      $( "#datepicker" ).datepicker( "option", "dateFormat", $( this ).val() );
	    });
	} );
  </script>
</head>
<header>
	<h1 id="headline"><b>Team Grammers</b></h1>
</header>
<body>
<br>
<br>
	<form action="manage/select_timeclock.html" method=post id="form1">
		<label for="datepicker" >Please select a date:</label>	
		<input type="text" id="datepicker" name="date">
		
		<label for="employees">Please select employee:</label>		
		<select id="employees" name="employeeId">
			<option value="0">All</option>
			<c:forEach var="tm" items="managed">
			<option value="${tm.id}">${tm.name}</option>
			</c:forEach>
		</select>
		
		<label for="status">Please select status:</label>	
		<select id="status" name="status">
			<option value="ALL">ALL</option>
			<option value="APPROVED">APPROVED</option>
			<option value="SUBMITTED">SUBMITTED</option>
			<option value="UNFINISHED">UNFINISHED</option>
		</select>
				
	</form>
	<form action="welcome.html" id="form2"></form>
	<form action="perform_logout" id="form3"></form>
	<br>
	<br>
    <div>
	<table class=buttons>
	<tr>
		<td><Button type="submit" form="form1">Display Events</Button>
		<td><Button type="submit" form="form2">Back To Home</Button>
		<td><Button type="submit" form="form3">Log Out</Button>
	</table>
	</div>

</body>
</html>