<!DOCTYPE html>
<html lang="en">
</article>
<header>
	<meta charset="utf-8" />
	<title>Employee Login Screen/Clockin</title>
	<link rel="stylesheet" href="css\style.css" />
    <script language="javascript" src="scripts\currenttime.js"></script>
	
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
<div class="zoomed">
<h4 id="headline">Employee Name
 
        <div id="employee_opt_buttons">
		 <div class="img">
		    <a href="Clocked_in_screen.jsp"><img src="img\MixClockIn.png"></a>
		    <a href="Calendar_Screen.jsp"><img src="img\MixCalender.png"></a>
		    <a href="Logging_out_Screen.jsp"><img src="img\MixHomeIcon.png"></a>
		 </div>
		</div>
		</div>

</h4>
</div>
</body>

<footer>

         

</footer>

</article>
</html>