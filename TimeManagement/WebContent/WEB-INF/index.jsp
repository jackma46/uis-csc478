<!DOCTYPE html>
<html lang="en">
</article>
<header>
	<meta charset="utf-8" />
	<title>Web App Home Page</title>
	<link rel="stylesheet" href="css\style.css" />
    <script language="javascript" src="scripts\currenttime.js"></script>
	<script language="javascript" src="scripts\hidePassword.js"></script>
	
	        <style>

			body {
            background-image: url('black-grey.png');
			background-repeat: no-repeat;
			background-size: 100%;
			
	        }
            </style>
			<div class="zoomed">
			<h1 id="headline">Company Name</h1>
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

<h3>
    <form action="">
	<div class="zoomed">
   <div>
   <label for="textbox">Employee ID   </label><input type="text" placeholder="Enter ID" id="employeeid_textbox"/><br><br>
   <label for="textbox">Password    </label><input type="password" placeholder="Enter Password" id="password_textbox">
     <div class="Checkbox_password">
        <input type="checkbox" id="showpassword" onclick="hidePassword()">Show Password<br><br>
     </div>
     <input type="image" formmethod="post" id="img" name="submit" src="img\MixCheck.png" border="0" onclick="formdata()"/>
	 </form>
     <input type="image" id="img" name="clear" src="img\MixX.png" onclick="document.getElementById('employeeid_textbox').value = 'test'">
     <a href="Calendar_Screen.jsp"><img src="img\MixCalender.png"></a>	
	
	</div>
	</div>
     
</h3>

</body>

<footer>

         

</footer>

</article>
</html>