<!DOCTYPE html>	
<html>
   <header lang="en">
      <meta charset="utf-8" />
      <title>Manager Display Timeoff</title>
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
      <h2>
         <div class="zoomed">
            <script language="javascript">
               var date = new Date();
               document.write(formatAMPM(date) + "<br>");
            </script>
         </div>
      </h2>
      <div class="zoomed">
         <h5 id="headline">${tmContext.employeeName}</h5>
       </div>
      
      <h3>
         <center>
            
                <div class="wrap">
               <table class="head" border="1" cellpadding="5">
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
                  </table>
                  <div class="inner_table">
                  <table>
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
               </div>
         </center>
         <form action="manager_select_timeoff.html" id="form1"></form>
         <form action="welcome.html" id="form2"></form>
         <form action="..\perform_logout" id="form3"></form>
         <div id="employee_opt_buttons">
            <div class="zoomed">
               <center>
                  <input type="image" form="form1" src="..\img\MixViewTimeOff.png" >
                  <input type="image" form="form2" src="..\img\MixBackArrow.png">
                  <input type="image" form="form3" src="..\img\MixHomeIcon.png">
               </center>
            </div>
         </div>
      </h3>
   </body>
</html>