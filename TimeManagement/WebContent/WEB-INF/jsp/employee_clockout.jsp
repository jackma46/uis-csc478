<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<header>
	<h1 id="headline"><b>Team Grammers</b></h1>
</header>
<head>
	<meta charset="ISO-8859-1">
	<title>Employee Clock Out</title>
	<style>
		.buttons { 
  			width: 25%;
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
        <form action="clocked_in.html" id="form1"></form>
		<form action="employee_select_timeclock.html" id="form2"></form>
		<form action="employee_display_timeoff.html" id="form3"></form>
		<form action="perform_logout" id="form4"></form>
		<table class=buttons>
		<tr>
		<td><Button type="submit" form="form1">Clock Out</Button>
		<td><Button type="submit" form="form2">View Time Clocks</Button>
		<td><Button type="submit" form="form3">Time Off Requests</Button>
		<td><Button type="submit" form="form4">Log Out</Button>
		</table>

		</div>
		


</body>

<footer>

         

</footer>


</html>