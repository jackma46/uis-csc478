<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Request Time Off</title>
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
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
</head>
<body>
	<br>
	<div>
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
		</table>
	</div>
<br>
<br>
	<form action="employee_request_timeoff" method="post" id=form1>
		<label for="from">Start Date</label>
		<input type="text" id="from" name="startDate">
		<label for="to">End Date</label>
		<input type="text" id="to" name="endDate"><br>
		<label for="pto">PTO Hours:</label>
		<input type="number" id="pto" name="pto"><br>
		<label for="sick">Sick Hours:</label>
		<input type="number" id="pto" name="pto"><br>
		<label for="floater">Floater Hours:</label>
		<input type="number" id="pto" name="pto"><br>		
	</form>
<br>
<br>
<div>
	<form action="employee_display_timeoff.html" id="form2"></form>
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