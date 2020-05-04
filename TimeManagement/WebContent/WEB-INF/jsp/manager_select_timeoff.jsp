<!DOCTYPE html>	
<html>
   <header lang="en">
      <meta charset="utf-8" />
      <title>Manager Select Timeclock</title>
      <link href="..\css\style.css" rel="stylesheet">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script language="javascript" src="..\scripts\currenttime.js"></script>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <div class="zoomed2">
         <img src="..\img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   </header>
   <body>
    <div class="zoomed">
         <h1 id="headline">Team Grammers</h1>
      </div>
   
   <div class="zoomed">
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
      
      <div class="zoomed">
         <h5 id="headline">${tmContext.employeeName}</h5>
       </div>
      
      <center>
         <form action="manager_select_timeoff.html" method=post id="form1">
            <p>
               <label for="employees">Please select employee:</label>		
               <select id="employees" name="employeeId">
                  <option value=0>ALL</option>
                  <c:forEach var="tm" items="${managed}">
                     <option value="${tm.id}">${tm.name}</option>
                  </c:forEach>
               </select>
               <br><br>
            </p>
            <p>
               <label for="status">Please select status:</label>	
               <select id="status" name="status">
                  <option value="ALL">ALL</option>
                  <option value="APPROVED">APPROVED</option>
                  <option value="REJECTED">REJECTED</option>
                  <option value="REQUESTED">REQUESTED</option>
               </select>
            </p>
         </form>
      </center>
      <form action="welcome.html" id="form2"></form>
      <form action="../perform_logout" id="form3"></form>
      <div id="employee_opt_buttons">
         <div class="zoomed"> 
            <input type="image" form="form1" src="..\img\MixCheck.png">
            <input type="image" form="form2" src="..\img\MixBackArrow.png">
            <input type="image" form="form3" src="..\img\MixHomeIcon.png">
         </div>
      </div>
   </body>
</html>