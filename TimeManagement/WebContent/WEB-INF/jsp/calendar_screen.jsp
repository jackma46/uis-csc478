  <!--This is the calendar_screen page, the user should be able to pick a date from a drop down.
	Requirement 2.2.1-->

<!DOCTYPE html>	
<html>
   <header lang="en">
      <meta charset="utf-8" />
      <title>Calendar Screen</title>
      <link href="css\style.css" rel="stylesheet">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script language="javascript" src="scripts\currenttime.js"></script>
      <div class="zoomed2">
         <img src="img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   </header>
   <body>
      <div class="zoomed">
         <h1 id="headline">${tmContext.employeeName}</h1>
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
               
            </script>
         </h2>
      </div>
      <center>
         <form action="employee_hours_log_view.html" method=post id="form1" autocomplete="off">
            <label for="fromDate">Please Select A Date: <input type="text" id="fromDate" name="date"></label>
         </form>
      </center>
      <form action="welcome.html" id="form2"></form>
      <form action="perform_logout" id="form3"></form>
      <br>
      <br>
      <div id="calendar_opt_buttons">
         <div class="zoomed2">
            <input type="image" form="form1" src="img\MixCheck.png">
            <input type="image" form="form2" src="img\MixBackArrow.png" >
            <input type="image" form="form3" src="img\MixHomeIcon.png">    
         </div>
      </div>
   </body>
</html>