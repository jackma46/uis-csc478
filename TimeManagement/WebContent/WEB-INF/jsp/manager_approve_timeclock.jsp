<!--This is the manager time clock approval page. The user should see all the submitted time clock events in a table with check boxes. 
   Requirement 3.2.1 & 3.2.2-->
<!DOCTYPE html>	
<html>
   <header lang="en">
      <meta charset="utf-8" />
      <title>Manager Approve TimeClock</title>
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
      <h2>
         <div class="zoomed">
            <script language="javascript">
               var date = new Date();
               document.write(formatAMPM(date) + "<br>");        
               
               $( function() {
                $("#submit_form_info").submit(function() {
                 $("#form1").submit();
                 return false;
                });
               });
               
            </script>
            <script type='text/javascript'>
               $(document).ready(function() {
                $('#allcb').click(function() {
                   var checked = this.checked;
                   $('input[type="checkbox"]').each(function() {
                     this.checked = checked;
                   });
                 })
                });
            </script>
         </div>
      </h2>
      <div class="zoomed">
         <h5 id="headline">${tmContext.employeeName}</h5>
      </div>
      <h3>
         <form action="manager_approve_timeclock.html" method="post" id="form1">
            <div>
               <div class="wrap">
                  <table class="head" border="1" cellpadding="5">
                     <caption><b>List of Time Clock Events</b></caption>
                     <tr>
                        <th><input type="checkbox" id="allcb" name="allcb"></th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Time In</th>
                        <th>Time Out</th>
                        <th>Status</th>
                     </tr>
                  </table>
                  <div class="inner_table">
                     <table>
                        <c:forEach var="tm" items="${timeClocks}">
                           <tr>
                              <td><input type="checkbox" id="${tm.timeClockId}" value="${tm.timeClockId}" name="timeClockIds">
                              <td>${tm.name}</td>
                              <td>${tm.formattedDate}</td>
                              <td>${tm.timeIn}</td>
                              <td>${tm.timeOut}</td>
                              <td>${tm.status}</td>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>
               </div>
            </div>
         </form>
         <br>
         <br>
         <form action="" id="submit_form_info"></form>
         <form action="manager_select_timeclock.html" id="form2"></form>
         <form action="welcome.html" id="form3"></form>
         <div id="employee_opt_buttons">
            <div class="zoomed2">
               <center>
                  <input type="image" form="submit_form_info" src="..\img\MixCheck.png">
                  <input type="image" form="form2" src="..\img\MixClockView.png">
                  <input type="image" form="form3" src="..\img\MixBackArrow.png">
               </center>
            </div>
         </div>
      </h3>
   </body>
</html>