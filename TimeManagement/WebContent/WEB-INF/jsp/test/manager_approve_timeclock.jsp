<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Approve Time Clock Events</title>
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
<script>
$('#allcb').change(function(){
    if($(this).prop('checked')){
        $('tbody tr td input[type="checkbox"]').each(function(){
            $(this).prop('checked', true);
        });
    }else{
        $('tbody tr td input[type="checkbox"]').each(function(){
            $(this).prop('checked', false);
        });
    }
});
</script>
</head>
<header>
	<h1 id="headline"><b>Team Grammers</b></h1>
</header>
<body>
<br>
<br>
	<div>
	  	<form action="manage/approve_timeclock.html" method="post" id="form1">
		<table border="1" cellpadding="5">
   		<caption><b>List of Time Clock Events</b></caption>
    	<tr>
    		<th><input type="checkbox" id="allcb" name="allcb"></th>
    		<th>Name</th>
      		<th>Date</th>
      		<th>Time In</th>
      		<th>Time Out</th>
      		<th>Status</th>
    		</tr>
    	<c:forEach var="tm" items="${timeClocks}">
       	<tr>
       		<td><input type="checkbox" id="${tm.timeClockId}" value="${tm.timeClockId}" name="timeClockIds[]">
       		<td>${tm.name}</td>
         	<td>${tm.formattedDate}</td>
         	<td>${tm.timeIn}</td>
         	<td>${tm.timeOut}</td>
         	<td>${tm.status}</td>
        </tr>
    	</c:forEach>
		</table>
		</form>
	</div>
	<br>
	<br>
	<div>
	<form action="manage/select_timeclock" method=get id="form2"></form>
	<form action="welcome.html" id="form3"></form>
	<form action="perform_logoff" id="form4"></form>	
	<table class=buttons>
	<tr>
		<td><Button type="submit" form="form1">Approve Events</Button>
		<td><Button type="submit" form="form2">View Other Events</Button>
		<td><Button type="submit" form="form3">Back To Home</Button>
		<td><Button type="submit" form="form3">Log Off</Button>
	</table>
	</div>


</body>
</html>