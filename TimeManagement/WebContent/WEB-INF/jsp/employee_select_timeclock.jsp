<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Time clock</title>
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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker(
    		dateFormat: "yy-mm-dd");
  } );
  </script>
	
</head>
<body>
	<br>
	<br>
	<b>Please select a date:</b><br>	
	<input type="text" id="datepicker">
	<br>
	<br>
    <div>
    <form action="employee_display_timeclock.html" id="form1"></form>
	<form action="welcome.html" id="form2"></form>
	<form action="perform_logout" id="form3"></form>
	<table class=buttons>
	<tr>
		<td><Button type="submit" form="form1">Confirm Date</Button>
		<td><Button type="submit" form="form2">Go Back</Button>
		<td><Button type="submit" form="form3">Log Out</Button>
	</table>
	</div>

</body>
</html>