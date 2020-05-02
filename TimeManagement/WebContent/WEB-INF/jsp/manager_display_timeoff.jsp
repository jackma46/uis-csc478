<!DOCTYPE html>	
<html>
<header lang="en">
	<meta charset="utf-8" />
    <title>Manager Display Timeoff</title>
    <link href="css\style.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script language="javascript" src="scripts\currenttime.js"></script>
    
    <style>

			body {
            background-image: url('black-grey.png');
			background-repeat: no-repeat;
			background-size: 100%;	
	        }
	</style>
	        <div class="zoomed2">
             <img src="img\TeamGrammers.png" alt="Italian Trulli">
            </div>
	
</header>


  <body>
  
 <h2>
     <div class="zoomed">
        <script language="javascript">
           var date = new Date();
           document.write(formatAMPM(date) + "<br>");
        </script>
    </div>
</h2>

<h3>


<style>
table {
border-collapse: collapse;
width: 50%;
color: #000000;
font-family: monospace;
font-size: 20px;
}
caption {
font-family: monospace;
font-size: 20px;
color: white;
}
th {
background-color: #000000;
color: white;
}
tr:nth-child(even) {background-color: #f2f2f2}
</style>
   <center>
     <div>
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
	</div>
  </center>		
		 	<form action="manage/select_timeoff.html" id="form1"></form>
	        <form action="welcome.html" id="form2"></form>
	        <form action="perform_logout" id="form3"></form>
	
	   <div id="calendar_opt_buttons">
		<div class="zoomed2"> 
	     <center>
		   <input type="image" form="form1" src="img\MixViewTimeOff.png" >
		   <input type="image" form="form2" src="img\MixBackArrow.png">
		   <input type="image" form="form3" src="img\MixHomeIcon.png">
        </center>
        </div>
      </div>

</h3>
  
  </body>
</html>