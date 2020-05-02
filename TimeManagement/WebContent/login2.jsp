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
   			<table>
 
   			<tr>
   				<td><label for="textbox">Employee ID</label></td>
   				<td><input type="text" placeholder="Enter ID" id="employeeid_textbox" name="username"/></td>
			</tr>
			<tr>
   				<td><label for="textbox">Password</label></td>
   				<td><input type="password" placeholder="Enter Password" id="password_textbox" name="password"/></td>
   			</tr>
			<tr>
     			<td></td>
     			<td><input type="image" name="submit" src="${pageContext.request.contextPath}/img/MixCheck.png"/>
     			<input type="image" name="clear" src="${pageContext.request.contextPath}/img/MixX.png" onclick="clearLoginForm()"></td>
			</tr>

		    </table>
		</div>
				</form>


</body>
<footer> </footer>
</html>