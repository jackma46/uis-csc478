<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<!--This the wrapper JSP, this template will be used for all other JSPs.-->

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
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  	$( function() {
  		$( "#datepicker" ).datepicker({dateFormat: "yy-mm-dd"});
	} );
  	</script>
	<script>
  	$( function() {
    	var dateFormat = "yy-mm-dd",
      	from = $( "#from" )
        	.datepicker({
          	defaultDate: "+1w",
          	changeMonth: true,
          	numberOfMonths: 3
        	})
        	.on( "change", function() {
          	to.datepicker( "option", "minDate", getDate( this ) );
        	}),
      	to = $( "#to" ).datepicker({
        	defaultDate: "+1w",
        	changeMonth: true,
        	numberOfMonths: 3
      	})
      	.on( "change", function() {
        	from.datepicker( "option", "maxDate", getDate( this ) );
      	});
 
   	 function getDate( element ) {
      	var date;
      	try {
        	date = $.datepicker.parseDate( dateFormat, element.value );
     	 } catch( error ) {
      	  date = null;
      	}
 
      	return date;
    	}
  	} );
  </script>
  <script type="text/javascript">
  $( function() {
	  $("#submit_form_info").submit(function() {
		  $("#form1").submit();
		  return false;
	  });
  });
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