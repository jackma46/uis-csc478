<!DOCTYPE html>
<html lang="en">
   <header>
      <meta charset="utf-8" />
      <title>Web App Home Page</title>
      <link rel="stylesheet" href="css\style.css" />
      <script language="javascript" src="scripts\currenttime.js"></script>
      <script language="javascript" src="scripts\hidePassword.js"></script>
   </header>
       <div class="zoomed2">
         <img src="img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   <body>
      <div class="zoomed">
         <h1 id="headline">Team Grammers</h1>
      </div>
      <h2>
         <div class="zoomed">
            <script language="javascript">
               var date = new Date();
               document.write(formatAMPM(date) + "<br>");
               
               function clearLoginForm() {
               document.getElementById('employeeid_textbox').value = ''
               document.getElementById('password_textbox').value = ''
               }
               
            </script>
         </div>
      </h2>
      <center>
         <div class="zoomed">
            <form action="perform_login" method="post" id="form1" autocomplete="off">
               <p><label for="employeeid_textbox">Employee ID:</label><input type="text" placeholder="Enter ID" id="employeeid_textbox" name="username"/><br><br></p>
               <p><label for="password_textbox">Password:</label><input type="password" placeholder="Enter Password" id="password_textbox" name="password"/></p>
            </form>
            <div class="Checkbox_password">
               <h3><input type="checkbox" id="showpassword" onclick="hidePassword()">Show Password</h3>
            </div>
         </div>
      </center>
      <div id="employee_opt_buttons">
         <div class="zoomed">   
            <input type="image" form="form1" src="img\MixCheck.png">
            <input type="image" id="clear" name="clear" src="img\MixX.png" onclick="clearLoginForm()">
         </div>
      </div>
   </body>
</html>