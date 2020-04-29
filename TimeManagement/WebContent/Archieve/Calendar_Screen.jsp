<!DOCTYPE html>	
<html>
<header lang="en">
	<meta charset="utf-8" />
    <title>Time Management Calendar</title>
    <link href="css\style.css" rel="stylesheet">
    <script src="scripts\calendar.js"></script>
	<script language="javascript" src="scripts\currenttime.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

	<h1 id="headline">Employee Name</h1>
  </header>
  <body><div id="page-body">
  
     <style>

			body {
            background-image: url('black-grey.png');
			background-repeat: no-repeat;
			background-size: 100%;
			
	        }
            </style>
	<h2>
    <div class="zoomed">	
      <script language="javascript">
         var date = new Date();
         document.write(formatAMPM(date) + "<br>");     
	  </script>
	  
	  </div>
    </h2>
	
<center>
<input type="text" name="daterange" value=" " />

<script>
var startDate;
var endDate;

$(function() {
  $('input[name="daterange"]').daterangepicker({
    "alwaysShowCalendars": true,
    opens: 'center',
    locale: {
    applyLabel: 'Submit',
        
    }
  }, 
  
  function(start, end) {
      console.log("Callback has been called!");
      $('#reportrange span').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'));
      startDate = start;
       endDate = end;    

     });
  
  $('#saveBtn').click(function(){
      console.log(startDate.format('D MMMM YYYY') + ' - ' + endDate.format('D MMMM YYYY'));
  });
  
});
</script>
</center>

<script>
function goBack() {
  window.history.back();
}
</script>

<div class="zoomed">
<div id="calendar_opt_buttons">
		 <div class="img">
		 <center>
		 <button type="button" id="saveBtn" class="btn btn-primary" data-dismiss="modal">Confirm</button>
		 	<a href="employee_hours_log_view.html"><img src="MixCalender.png"/a>
		    <a href="perform_logout"><img src="img\MixHomeIcon.png"></a>
			<a id="myLink" href="#" onclick="goBack();return false;"><img src="img\MixBackArrow.png"></a>
			
		 </center>
		 </div>
		</div>
		</div>

</div>
  </body>
</html>