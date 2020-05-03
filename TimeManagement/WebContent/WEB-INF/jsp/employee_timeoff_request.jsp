<!DOCTYPE html>	
<html>
   <header lang="en">
      <meta charset="utf-8" />
      <title>Employee Timeoff Request</title>
      <link href="css\style.css" rel="stylesheet">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <div class="zoomed2">
         <img src="img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   </header>
   <body>
      <div class="zoomed">
         <h1 id="headline">${context.employeeName}</h1>
      </div>
        
            <table border="1" cellpadding="5" align="right">
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
      </script>        
         
      <form action="employee_request_timeoff" method="post" id="form1" autocomplete="off">
       <div class="align">
        <p> <label for="fromDate">Start Date: </label><input type="text" id="fromDate" name="startDate"><br><br></p>
         <p> <label for="toDate">End Date: </label><input type="text" id="toDate" name="endDate"><br><br></p>
         <p> <label for="get_pto">PTO Hours:</label><input type="number" id="pto" name="pto"><br><br></p>
	    <p>  <label for="sick">Sick Hours:</label><input type="number" id="pto" name="pto"><br><br></p>
	    <p>  <label for="floater">Floater Hours:</label><input type="number" id="pto" name="pto"></p>
	    </div>
      </form>
    
      <form action="employee_timeoff_result.html" id="form2"></form>
      <form action="welcome.html" id="form3"></form>
      <form action="perform_logout" id="form3"></form>
      <div id="employee_opt_buttons">
         <div class="zoomed">        
               <input type="image" form="form1" src="img\MixCheck.png">
               <input type="image" form="form2" src="img\MixViewTimeOff.png" >
               <input type="image" form="form3" src="img\MixBackArrow.png">
               <input type="image" form="form4" src="img\MixHomeIcon.png">           
         </div>
      </div>
   </body>
</html>