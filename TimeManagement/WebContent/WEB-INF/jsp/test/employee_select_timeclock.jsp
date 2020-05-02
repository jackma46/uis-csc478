<!--This is the employee select time clock page, the user should be able to pick a date from a drop down.
	Requirement 2.2.1-->
<form action="employee_display_timeclock.html" id="form1">
	<p><b>Please select a date:</b><br>
	<input type="text" id="datepicker" name="date">
	</p>
</form>
<br>
<br>
<table class="layout-table">
	<tr>
		<td>
		    <form action="abc.html" id="submit_form_info">
		    	<input type="image"
						src="${pageContext.request.contextPath}/img/MixCheck.png">
			</form>
		</td>
		<td>
			<form action="welcome.html" id="form2">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixBackArrow.png">
			</form>
		</td>
		<td>
			<form action="perform_logout" id="form3">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixHomeIcon.png">
			</form>
		</td>
	</tr>
</table>