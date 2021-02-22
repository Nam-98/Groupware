<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일간 일정</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 아이콘 fontawesome -->
<script src="https://kit.fontawesome.com/b1e233372d.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
<link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>

 <!-- Calendar -->
   <link href='/resources/lib/fullcalendar/main.css' rel='stylesheet'/>
    <script src='/resources/lib/fullcalendar/main.js'></script>
<!--     <script src='/resources/lib/fullcalendar/main.min.css'></script> -->
<!--     <script src='/resources/lib/fullcalendar/main.min.js'></script> -->
    
</head>
<style>
* {
	box-sizing: border-box;
}

#calendar{
	width: 100%;
}

.fc-toolbar-chunk {
  display: flex; // 일렬로 나란히
  align-items: center; // 수직 가운데 정렬
}
</style>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">일간 일정</h3>
				</div>
			</div>
			<div class="panel panel-headline demo-icons">
					<div class="panel-heading">
						<h3 class="panel-title">일 간 일 정</h3>
						<input type="button" id="addSchedule" class="btn btn-gray btn-xs" value="일정 추가하기">
					</div>
					<div class="panel-body">
						<div id="calendar" class="col-6"></div>
					</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
			<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
		</div>
	<!-- END WRAPPER -->
	</div>
	<!-- mad by 혜림누나 -->
	<script>
	 	document.addEventListener('DOMContentLoaded', function() {
		    var calendarE3 = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarE3, {
				initialView: 'timeGridWeek',
				
				headerToolbar: {
					left: '',
					center: 'prev title next',
					right: 'today'
				},
				locale: 'ko',
				businessHours: true,
				businessHours: {
					  // days of week. an array of zero-based day of week integers (0=Sunday)
					  daysOfWeek: [ 1, 2, 3, 4, 5 ], // Monday - Thursday

					  startTime: '9:00',
					  endTime: '18:00',
					},
				dayMaxEvents: true,
				
				events: [
					<c:forEach var="i" items="${list }">
					<c:choose>
					<c:when test="${i.sch_start_date_converter!=i.sch_end_date_converter}">
			    	  
			    	  {
				          title  : '${i.sch_title }',
				          start  : '${i.sch_start_date_sc}',
				          end : '${i.sch_end_date_sc }',
				          url : "/schedule/scheduleView.schedule?sch_seq=${i.sch_seq}",
				          allDay: true
			    	  },

			    	 </c:when>
			    	  <c:otherwise>
			    	  {
				          title  : '${i.sch_title }',
				          start  : '${i.sch_start_date_sc}',
				          end : '${i.sch_end_date_sc }',
				          url : "/schedule/scheduleView.schedule?sch_seq=${i.sch_seq}"
			    	  },
			    	  </c:otherwise>
			    	  </c:choose>
			          </c:forEach>			    	  
			      ],
			});
			 calendar.render();
	 	});
	</script>
	
	<script>
   		document.getElementById("addSchedule").onclick=function(){
	   		var con = confirm("일정을 추가하시겠습니까?")
	   		var popup='top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no';
	   		if(con == true){
	   			window.open("/schedule/addSchedulePage.schedule", "popup", popup)
	   		}else{
	   			location.href="/schedule/monthSchedule.schedule"
	   		}
   		}
	</script>
</body>
</html>