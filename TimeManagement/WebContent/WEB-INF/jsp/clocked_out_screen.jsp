<!DOCTYPE html>
<html lang="en">
   </article>
   <header>
      <meta charset="utf-8" />
      <title>Clocked Out Screen</title>
      <link rel="stylesheet" href="css\style.css" />
      <script language="javascript" src="scripts\currenttime.js"></script>
      <div class="zoomed2">
         <img src="img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   </header>
   <body>
      <h1 id="headline">Team Grammers</h1>
      <h2>
         <script language="javascript">
            var date = new Date();
            document.write(formatAMPM(date) + "<br>");
            
            setTimeout(function(){
                      window.location.href = 'perform_logout';
                   }, 5000);
            
         </script>
         <center>
         <p>Clockout successful! Have a great day ${tmContext.employeeName}!</p>
         </center>
      </h2>
   </body>
   </article>
</html>