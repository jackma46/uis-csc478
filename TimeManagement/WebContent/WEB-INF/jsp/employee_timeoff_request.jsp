<!DOCTYPE html>	
<html>
<header lang="en">
	<meta charset="utf-8" />
    <title>PTO Request</title>
    <link href="css\style.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    
    <style>

			body {
            background-image: url('../black-grey.png');
			background-repeat: no-repeat;
			background-size: 100%;
			
	        }
	</style>
	        <div class="zoomed2">
             <img src="img\TeamGrammers.png" alt="Italian Trulli">
            </div>
	
	
</header>


  <body>
  
      <div class="zoomed">
	     <h1 id="headline">${context.employeeName}</h1>
      </div>
  
  <script type="text/javascript">

$( function() {
	  var from = $( "#fromDate" )
	      .datepicker({
	        dateFormat: "yy-mm-dd",
	        changeMonth: true
	      })
	      .on( "change", function() {
	        to.datepicker( "option", "minDate", getDate( this ) );
	      }),
	    to = $( "#toDate" ).datepicker({
	      dateFormat: "yy-mm-dd",
	      changeMonth: true
	    })
	    .on( "change", function() {
	      from.datepicker( "option", "maxDate", getDate( this ) );
	    });

	  function getDate( element ) {
	    var date;
	    var dateFormat = "yy-mm-dd";
	    try {
	      date = $.datepicker.parseDate( dateFormat, element.value );
	    } catch( error ) {
	      date = null;
	    }

	    return date;
	  }
	});
	
function goBack() {
   window.history.back();
   }

 </script>

<h3>

<form action="employee_request_timeoff" method="post" id="form1">
<div class="zoomed3">
<label for="get_pto">PTO Type:</label>
  <select id="pto" name="pto">
    <option value="vacation">Vacation</option>
    <option value="sick">Sick</option>
    <option value="floater">Floater</option>
  </select>
 </div>
 
<p>Start Date <input type="text" id="fromDate" name="startDate"></p>
<p>End Date <input type="text" id="toDate" name="endDate"> </p>
<p>PTO Hours <input type="number" id="ptoNumber" name="ptoNumber"> </p>
</form>


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
  </center>
  
  
     
    
        	<form action="employee_timeoff_result.html" id="form2"></form>
	        <form action="welcome.html" id="form3"></form>
	        <form action="perform_logout" id="form3"></form>
	
	   <div id="employee_opt_buttons">
		<div class="zoomed2"> 
	     <center>
		   <input type="image" form="form1" src="img\MixCheck.png">
		   <input type="image" form="form2" src="img\MixViewTimeOff.png" >
		   <input type="image" form="form3" src="img\MixBackArrow.png">
		   <input type="image" form="form4" src="img\MixHomeIcon.png">
        </center>
        </div>
      </div>
         
</h3>
  
  </body>
</html>