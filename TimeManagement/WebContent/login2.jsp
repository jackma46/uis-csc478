<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="ISO-8859-1">
	<title>Time Management System</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/css/style2.css">
	
	<script type="text/javascript">
	function clearLoginForm() {
		document.getElementById('employeeid_textbox').value = ''
		document.getElementById('password_textbox').value = ''
	}
	</script>
</head>

<body>
	<article>
		<header>
			<div id="headline">Team Grammers</div>
		</header>
	</article>

	<br>
	<br>


	<form action="perform_login" method="post">

		<div class="zoomed">
   		
   			<label for="textbox">Employee ID</label>
   			<input type="text" placeholder="Enter ID" id="employeeid_textbox" name="username"/>
   			<br><br>
   			<label for="textbox">Password</label>
   			<input type="password" placeholder="Enter Password" id="password_textbox" name="password"/>
   			<br><br>
   			<div id="login-buttons">
     		<input type="image" name="submit" src="${pageContext.request.contextPath}/img/MixCheck.png"/>
     		<input type="image" name="clear" src="${pageContext.request.contextPath}/img/MixX.png" onclick="clearLoginForm()">
		    </div>
		</div>
	</form>


</body>
<footer> </footer>
</html>