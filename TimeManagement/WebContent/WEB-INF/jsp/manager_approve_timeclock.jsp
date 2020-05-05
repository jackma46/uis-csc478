<!--This is the manager time clock approval page. The user should see all the submitted time clock events in a table with check boxes. 
   Requirement 3.2.1 & 3.2.2-->
<!DOCTYPE html>	
<html>
   <header lang="en">
      <meta charset="utf-8" />
      <title>Manager Approve TimeClock</title>
      <link href="..\css\style.css" rel="stylesheet">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script language="javascript" src="..\scripts\currenttime.js"></script>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <div class="zoomed2">
         <img src="..\img\TeamGrammers.png" alt="Italian Trulli">
      </div>
   </header>
   <body>
      <div class="zoomed">
         <h1 id="headline">Team Grammers</h1>
      </div>
      <h2>
         <div class="zoomed">
            <script language="javascript">
               var date = new Date();
               document.write(formatAMPM(date) + "<br>");        
               
               $( function() {
                $("#submit_form_info").submit(function() {
                 $("#form1").submit();
                 return false;
                });
               });
               
            </script>
            <script type='text/javascript'>
               $(document).ready(function() {
               	  $('#chkParent').click(function() {
               	    var isChecked = $(this).prop("checked");
               	    $('#tblData tr:has(td)').find('input[type="checkbox"]').prop('checked', isChecked);
               	  });
               
               	  $('#tblData tr:has(td)').find('input[type="checkbox"]').click(function() {
               	    var isChecked = $(this).prop("checked");
               	    var isHeaderChecked = $("#chkParent").prop("checked");
               	    if (isChecked == false && isHeaderChecked)
               	      $("#chkParent").prop('checked', isChecked);
               	    else {
               	      $('#tblData tr:has(td)').find('input[type="checkbox"]').each(function() {
               	        if ($(this).prop("checked") == false)
               	          isChecked = false;
               	      });
               	      console.log(isChecked);
               	      $("#chkParent").prop('checked', isChecked);
               	    }
               	  });
               	});
            </script>
         </div>
      </h2>
      <div class="zoomed">
         <h5 id="headline">${tmContext.employeeName}</h5>
      </div>
      <h3>
         <form action="manager_approve_timeclock.html" method="post" id="form1">
            <div>
               <div class="table-wrapper-scroll-y my-custom-scrollbar wrap">
                  <table class="table table-bordered table-striped mb-0" id="tblData">
                     <caption><b>List of Time Clock Events</b></caption>
                     <tr>
                        <th><input type="checkbox" id="chkParent"></th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Time In</th>
                        <th>Time Out</th>
                        <th>Status</th>
                     </tr>
                     <c:forEach var="tm" items="${timeClocks}">
                        <tr>
                           <td><input type="checkbox" id="${tm.timeClockId}" value="${tm.timeClockId}" name="timeClockIds">
                           <td>${tm.name}</td>
                           <td>${tm.formattedDate}</td>
                           <td>${tm.timeIn}</td>
                           <td>${tm.timeOut}</td>
                           <td>${tm.status}</td>
                        </tr>
                     </c:forEach>
                  </table>
               </div>
            </div>
         </form>
         <br>
         <br>
         <form action="" id="submit_form_info"></form>
         <form action="manager_select_timeclock.html" id="form2"></form>
         <form action="welcome.html" id="form3"></form>
         <div id="employee_opt_buttons">
            <div class="zoomed2">
               <center>
                  <input type="image" form="submit_form_info" src="..\img\MixCheck.png">
                  <input type="image" form="form2" src="..\img\MixCalendar.png">
                  <input type="image" form="form3" src="..\img\MixBackArrow.png">
               </center>
            </div>
         </div>
      </h3>
   </body>
</html>