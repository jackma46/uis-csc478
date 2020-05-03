<!DOCTYPE html>
<html lang="en">
   </article>
   <header>
      <meta charset="utf-8" />
      <title>Manager Welcome</title>
      <link rel="stylesheet" href="..\css\style.css" />
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
      <h5>
         <form action="manage/select_timeclock.html " id="form1"></form>
         <form action="manage/select_timeoff.html " id="form2"></form>
         <form action="perform_logout" id="form3"></form>
         <br>
         <br>
         <div id="calendar_opt_buttons">
            <div class="zoomed">
               <center>
                  <input type="image" form="form1" src="img\MixCalender.png">
                  <input type="image" form="form2" src="img\MixTimeOff.png" >
                  <input type="image" form="form3" src="img\MixHomeIcon.png">
               </center>
            </div>
         </div>
      </h5>
   </body>
   </article>
</html>