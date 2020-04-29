<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Manager Welcome Page</title>
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
    <div>
	<form action="manage/display_timeclock.html" id="form1"></form>
	<form action="manage/display_timeoff.html" id="form2"></form>
	<form action="perform_logout" id="form3"></form>
	<table class=buttons>
	<tr>
		<td><Button type="submit" form="form1">View Time Clocks</Button>
		<td><Button type="submit" form="form2">Approve Time Offs</Button>
		<td><Button type="submit" form="form3">Log Out</Button>
	</table>
	</div>


</body>
</html>