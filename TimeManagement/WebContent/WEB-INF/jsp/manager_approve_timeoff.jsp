<!--This is the manager select time clock page. The user can specify the employee, the date, and the status of time clock events to display.
   Requirement 3.1.3 & 3.1.4-->
<!DOCTYPE html>	
<html>
   <header lang="en">
      <meta charset="utf-8" />
      <title>Manager Approve TimeOff</title>
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
               
               
               $( function() {
                $("#submit_form_info2").submit(function() {
                 $("#status").val("REJECTED")
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
         <div>
            <form action="manager_approve_timeoff.html" method="post" id="form1">
               <input type="hidden" id="status" name="newStatus" value="APPROVE">
               <div class="table-wrapper-scroll-y my-custom-scrollbar wrap">
                  <table class="table table-bordered table-striped mb-0" id="tblData">
                     <caption><b>List of Time Off Requests</b></caption>
                     <thead>
                        <tr>
                           <th><input type="checkbox" id="chkParent" name="chkParent" align="center"></th>
                           <th>Name</th>
                           <th>Start Date</th>
                           <th>End Date</th>
                           <th>PTO Requested</th>
                           <th>Sick Requested</th>
                           <th>Floater Requested</th>
                           <th>Unpaid Requested</th>
                           <th>Status</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="tm" items="${timeOffs}">
                           <tr>
                              <td><input type="checkbox" id="${tm.timeOffId}" value="${tm.timeOffId}" name="timeOffIds">
                              <td>${tm.name}</td>
                              <td>${tm.startDate}</td>
                              <td>${tm.endDate}</td>
                              <td>${tm.ptoRequested}</td>
                              <td>${tm.sickRequested}</td>
                              <td>${tm.floaterRequested}</td>
                              <td>${tm.unpaidRequested}</td>
                              <td>${tm.status}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </form>
            <br>
            <br>
         </div>
         <form action="" id="submit_form_info"></form>
         <form action="" id="submit_form_info2"></form>
         <form action="manager_select_timeoff.html" id="form3"></form>
         <form action="welcome.html" id="form4"></form>
         <div id="employee_opt_buttons">
            <div class="zoomed2">
               <center>
                  <input type="image" form="submit_form_info" src="..\img\MixCheck.png">
                  <input type="hidden"  form="submit_form_info2">
                  <input type="image" form="submit_form_info2" src="..\img\MixX.png">  
                  <input type="image" form="form3" src="..\img\MixViewTimeOff.png">
                  <input type="image" form="form4" src="..\img\MixBackArrow.png">
               </center>
            </div>
         </div>
      </h3>
   </body>
</html>