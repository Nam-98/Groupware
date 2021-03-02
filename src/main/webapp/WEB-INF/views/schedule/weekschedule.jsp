<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간 일정</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 아이콘 fontawesome -->
<script src="https://kit.fontawesome.com/b1e233372d.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/assets/img/favicon.png">
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>

<!-- Calendar -->
<link href='/resources/lib/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/lib/fullcalendar/main.js'></script>
<!--     <script src='/resources/lib/fullcalendar/main.min.css'></script> -->
<!--     <script src='/resources/lib/fullcalendar/main.min.js'></script> -->

</head>
<style>
* {
	box-sizing: border-box;
}

#calendar {
	width: 100%;
}

.fc-toolbar-chunk {
	display: flex;
	//
	일렬로
	나란히
	align-items
	:
	center;
	//
	수직
	가운데
	정렬
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
					<h3 class="page-title">일정관리</h3>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">주 간 일 정</h3>
							<div class="right">
								<input type="button" id="addSchedule"
									class="btn btn-xs btn-primary" value="일정추가">
							</div>
						</div>
						<div class="panel-body">
							<div id="calendar" class="col-6"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
	<!-- END WRAPPER -->
	</div>

	<script>
	 	document.addEventListener('DOMContentLoaded', function() {
		    var calendarE2 = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarE2, {
				initialView: 'dayGridWeek',
				
				headerToolbar: {
					left: '',
					center: 'prev title next',
					right: 'today'
				},
				
				locale: 'ko',
				businessHours: true,
				eventSources: [
				    {
				      events: [
				    	  <c:forEach var="i" items="${list }">
				    	  {
					          title  : '${i.sch_title }',
					          start  : '${i.sch_start_date_sc }',
					          end    : '${i.sch_end_date_sc }',
					          url : "/schedule/scheduleView.schedule?sch_seq=${i.sch_seq}"
				    	  },
				          </c:forEach>
				    	  
				    	  <c:forEach var="a" items="${hlist}">
		                    	 <c:forEach var="j" begin="2020" end="2050" step="1">
		                    	 {
			                        title : '${a.comp_hd_name}',
			                        <c:set var="date" value="${fn:split(a.comp_hd_date_str,'-')}"></c:set>
			                        start : '${j}-<c:out value='${date[0]}'></c:out>-<c:out value='${date[1]}'></c:out>',
			                        url : "/schedule/holidayScheduleView.schedule?comp_hd_seq=${a.comp_hd_seq}",
			                        color: '#e4cb10'
		                    	 },
		                     </c:forEach>
		                </c:forEach>
				      ],
				    }
				]
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
   			this.close();
   		}
   	}
   </script>

</body>
</html>