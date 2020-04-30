<!--This is the employee clock out page, the user should see the option to clock out or access other modules. 
	Requirement 2.0.0 & 2.1.0-->
	
<table class="layout-table">
	<tr>
		<td>
			<form action="clocked_out.html" id="form1">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixClockOut.png">
			</form>
		</td>
		<td>
			<form action="employee_select_timeclock.html" id="form2">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixManCalender.png">
			</form>
		</td>
		<td>
			<form action="employee_display_timeoff.html" id="form3">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixCalendar.png">
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