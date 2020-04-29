<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve Time Off Requests</title>
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
	  	<form action="manage/approve_timeoff.html" method="post" id="form1">
		<table border="1" cellpadding="5">
   		<caption><b>List of Time Off Requests</b></caption>
    	<tr>
    		<th><input type="checkbox" id="allcb" name="allcb"></th>
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
       		<td><input type="checkbox" id="${tm.timeOffId}" value="${tm.timeOffId}" name="timeOffIds[]">
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
		</form>
	</div>
	<br>
	<br>
	<div>
	<form action="manage/select_timeoff" method=get id="form2"></form>
	<forma ction="manage/select_timeoff" method=get id="form3"></form>
	<form action="perform_logoff" id="form4"></form>	
	<table class=buttons>
	<tr>
		<td><Button type="submit" name="status" value="APPROVED" form="form1">Approve Requests</Button>
		<td><Button type="submit" name="status" value="REJECTED" form="form1">Reject Requests</Button>
		<td><Button type="submit" form="form2">View Other Requests</Button>
		<td><Button type="submit" form="form3">Log Off</Button>
	</table>
	</div>
</body>
</html>