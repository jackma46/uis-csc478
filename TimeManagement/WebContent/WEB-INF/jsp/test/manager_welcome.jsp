<!--This is the manager home screen, the user should see the option approve time clock events or time off requests. 
	Requirement 3.0.0-->

<table class="layout-table">
	<tr>
		<td>
			<form action="manager_approve_timeclock.html" method="get" id="form1">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixManCalendar.png">
			</form>
		</td>
		<td>
			<form action="manager_approve_timeoff.html" method="get" id="form2">
				<input type="image"
					src="${pageContext.request.contextPath}/img/MixCalendar.png">
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