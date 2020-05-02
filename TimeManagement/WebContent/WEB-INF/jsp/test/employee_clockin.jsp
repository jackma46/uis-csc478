<!--This is the employee clock in page, the user should see the option to clock in or access other modules. 
	Requirement 2.0.0 & 2.1.0-->
<table class="layout-table">
	<tr>
		<td>
			<form action="clocked_in.html" id="form1">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixClockIn.png">
			</form>
		</td>
		<td>
			<form action="employee_select_timeclock.html" id="form2">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixManCalendar.png">
			</form>
		</td>
		<td>
			<form action="employee_display_timeoff.html" id="form3">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixTimeOff.png">
			</form>
		</td>
		<td>
			<form action="perform_logout" id="form4">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixHomeIcon.png">
			</form>
		</td>
	</tr>
</table>