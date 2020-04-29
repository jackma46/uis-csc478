<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<header>
	<h1 id="headline"><b>Team Grammers</b></h1>
</header>
<head>
	<meta charset="ISO-8859-1">
	<title>Time Management System</title>
	<style>
		.buttons { 
  			width: 20%;
 			table-layout: fixed;
 			border-collapse: collapse;
		}
		.buttons button { 
  			width: 100%;
		}
	</style>
	
</head>

<body>
	
	<br>
	<br>


    <form action="perform_login" method="post" id="form1">
	<div class="container">
   		<label for="textbox">Employee ID</label><input type="text" placeholder="Enter ID" name="username"/>
   		<br><br>
  		<label for="textbox">Password   </label><input type="password" placeholder="Enter Password" name="password"/>
  		<br><br>
  		</div>
  	
  		<table class=buttons>
		<tr>   
        <td><button type="submit">Submit</button>
     	<td><button type="reset">Clear</button>
		</tr></table>
		
    </form>
  

</body>
<footer>
       

</footer>
</html>