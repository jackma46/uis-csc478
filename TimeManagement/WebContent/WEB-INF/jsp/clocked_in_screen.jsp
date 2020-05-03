<!DOCTYPE html>
<html lang="en">
   </article>
   <header>
      <meta charset="utf-8" />
      <title>Clocked in Screen</title>
      <link rel="stylesheet" href="css\style.css" />
      <script language="javascript" src="scripts\currenttime.js"></script>
      <div class="zoomed2">
         <img src="img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   </header>
   <body>
      <h1 id="headline">Company Name</h1>
      <h2>
         <script language="javascript">
            setTimeout(function(){
                      window.location.href = 'employee_login_screen_clockedout.html';
                   }, 5000);
            
         </script>
         <p>Clockin successful! Have a great day!</p>
      </h2>
      <h5 id="headline">${context.employeeName}</h5>
   </body>
   </article>
</html>