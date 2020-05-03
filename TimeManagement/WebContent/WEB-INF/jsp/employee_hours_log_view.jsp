<!DOCTYPE html>
<html lang="en">
   </article>
   <header>
      <meta charset="utf-8" />
      <title>Employee Hours Log View</title>
      <link rel="stylesheet" href="css\style.css" />
      <script language="javascript" src="scripts\currenttime.js"></script>
      <div class="zoomed2">
         <img src="img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   </header>
   <body>
      <div class="zoomed">
         <h1 id="headline">Company Name</h1>
      </div>
      <h2>
         <div class="zoomed">
            <script language="javascript">
               var date = new Date();
               document.write(formatAMPM(date) + "<br>");
               
            </script>
         </div>
      </h2>
      <div class="zoomed">
         <h3 id="headline">${context.employeeName}</h3>
      </div>
      <center>
         <div>
            <table border="1" cellpadding="5">
               <caption><b>List of Time Clock Events</b></caption>
               <tr>
                  <th>Date</th>
                  <th>Time In</th>
                  <th>Time Out</th>
                  <th>Status</th>
               </tr>
               <c:forEach var="tm" items="${timeClocks}">
                  <tr>
                     <td>${tm.formattedDate}</td>
                     <td>${tm.timeIn}</td>
                     <td>${tm.timeOut}</td>
                     <td>${tm.status}</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </center>
   </body>
   <h3>
      <form action="calendar_screen.html" id="form1"></form>
      <form action="welcome.html" id="form2"></form>
      <form action="perform_logout" id="form3"></form>
      <br>
      <br>
      <div id="employee_opt_buttons">
         <div class="zoomed">
            <center>
               <input type="image" form="form1" src="img\MixCalender.png">
               <input type="image" form="form2" src="img\MixBackArrow.png" >
               <input type="image" form="form3" src="img\MixHomeIcon.png">
            </center>
         </div>
      </div>
   </h3>
   </article>
</html>