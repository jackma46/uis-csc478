<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
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
<table border="1" cellpadding="5">
   <caption><h2>List of Time Clocks</h2></caption>
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


</body>

<footer>

         

</footer>

</article>
</html>