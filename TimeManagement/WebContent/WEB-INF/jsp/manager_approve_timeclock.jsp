<!DOCTYPE html>	
<html>
<header lang="en">
	<meta charset="utf-8" />
    <title>Manager Approve TimeClock</title>
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
<br>
<br>
	</div>
  </center>		
		 	<form action="manage/select_timeclock.html" id="form1"></form>
		 	<form action="manage/select_timeclock.html" id="form1"></form>
	        <form action="welcome.html" id="form2"></form>
	        <form action="perform_logout" id="form3"></form>
	
	   <div id="calendar_opt_buttons">
		<div class="zoomed2"> 
	     <center>
		   <input type="image" form="form1" src="img\MixCheck.png">
		   <input type="image" form="form1" src="img\MixX.png">
		   <input type="image" form="form2" src="img\MixBackArrow.png">
		   <input type="image" form="form3" src="img\MixHomeIcon.png">
        </center>
        </div>
      </div>

</h3>
  
  </body>
</html>