<!DOCTYPE html>
<html lang="en">
</article>
<header>
	<meta charset="utf-8" />
	<title>Employee Hours Log View</title>
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
<h4 id="headline">Employee Name</h4>

</div>
<table>
<tr><th>Date: </th><td>${timeClock.formattedDate}</td></tr>
<tr><th>Time In: </th><td>${timeClock.timeIn}</td></tr>
<tr><th>Time Out: </th><td>${timeClock.timeOut}</td></tr>
<tr><th>Status: </th><td>${timeClock.status}</td></tr>
</table>


</body>

<footer>

         

</footer>

</article>
</html>