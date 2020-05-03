<!DOCTYPE html>
<html lang="en">
   </article>
   <header>
      <meta charset="utf-8" />
      <title>Employee Login Screen/Clockout</title>
      <link rel="stylesheet" href="css\style.css" />
      <script language="javascript" src="scripts\currenttime.js"></script>
      <div class="zoomed2">
         <img src="img\TeamGrammers.png" alt="Italian Trulli">
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
            </script>
         </div>
      </h2>
      <div class="zoomed">
         <h5 id="headline">Hello ${tmContext.employeeName}</h5>
      </div>
      <h5>
         <form action="clocked_out_screen.html" id="form1"></form>
         <form action="calendar_screen.html" id="form2"></form>
         <form action="employee_timeoff_result.html " id="form3"></form>
         <form action="perform_logout" id="form4"></form>
         <br>
         <br>
         <div id="employee_opt_buttons">
            <div class="zoomed">
               <center>
                  <input type="image" form="form1" src="img\MixClockOut.png">
                  <input type="image" form="form2" src="img\MixCalendar.png">
                  <input type="image" form="form3" src="img\MixTimeOff.png" >
                  <input type="image" form="form4" src="img\MixHomeIcon.png">
               </center>
            </div>
         </div>
      </h5>
   </body>
   </article>
</html>