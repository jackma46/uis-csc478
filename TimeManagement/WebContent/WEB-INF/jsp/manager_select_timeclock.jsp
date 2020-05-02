<!DOCTYPE html>	
<html>
<header lang="en">
	<meta charset="utf-8" />
    <title>Manager Select Timeclock</title>
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
   <script type="text/javascript">// set default dates

     var date = new Date();
     document.write(formatAMPM(date) + "<br>");

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
</h2>      
  
  
        
        
        
         <form action="manage/display_timeclock.html" method=post id="form1">
	    	<label for="fromDate">Please Select A Date:  <input type="text" id="fromDate" name="date"></label><br><br>
	        	
                <label for="employees">Please Select Employee:</label>
	            <select id="employees" name="employeeId">
		          <option value="0">ALL</option>
	                <c:forEach var="tm" items="managed">
		               <option value="${tm.id}">${tm.name}</option>
		            </c:forEach>
	              </select><br><br>
	         
		
	                <label for="status">Please Select Status:</label>	
	                   <select id="status" name="status">
		                  <option value="ALL">ALL</option>
	             	      <option value="APPROVED">APPROVED</option>
		                  <option value="SUBMITTED">SUBMITTED</option>
		                  <option value="UNFINISHED">UNFINISHED</option>
	               </select>
	          
       </form>
    
	        <form action="welcome.html" id="form2"></form>
	        <form action="perform_logout" id="form3"></form>
	
	   <div id="employee_opt_buttons">
		<div class="zoomed"> 
	     <center>
		   <input type="image" form="form1" src="img\MixCheck.png">
		   <input type="image" form="form2" src="img\MixBackArrow.png">
		   <input type="image" form="form3" src="img\MixHomeIcon.png">
        </center>
        </div>
       </div>
     

  
  </body>
</html>