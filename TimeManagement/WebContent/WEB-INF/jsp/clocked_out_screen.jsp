<!DOCTYPE html>
<html lang="en">
</article>
<header>
	<meta charset="utf-8" />
	<title>Clocked out Screen</title>
	<link rel="stylesheet" href="css\style.css" />
    <script language="javascript" src="scripts\currenttime.js"></script>
	
	        <style>

			body {
            background-image: url('../black-grey.png');
			background-repeat: no-repeat;
			background-size: 100%;
			
	        }
            </style>
            
            <div class="zoomed2">
             <img src="img\TeamGrammers.png" alt="Italian Trulli">
            </div>
			
			
</header>

<body>
<h1 id="headline">Company Name</h1>

<h2>
<script language="javascript">

  var date = new Date();
  document.write(formatAMPM(date) + "<br>");
  
  setTimeout(function(){
            window.location.href = 'employee_login_screen_clockedin.html';
         }, 5000);
 
  </script>
  
  <p>Clockout successful! Have a great day!</p>
  
</h2>



<h5 id="headline">${context.employeeName}</h5>

</body>


</article>
</html>