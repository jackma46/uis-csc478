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
			
			<h1>${tmContext.employeeName}</h1>
		</header>
	</article>

	<br>
	<br>

	<jsp:include page="${tmContext.contentJsp}" />

</body>
<footer> </footer>
</html>