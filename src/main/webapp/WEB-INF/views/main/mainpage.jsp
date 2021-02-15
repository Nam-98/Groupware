<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupWare Mainpage</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
<!--jqwidgets  -->
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript"
	src="/resources/lib/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxtabs.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            // create jqxtabs.
            $('#jqxtabs').jqxTabs({ width: 700, height: 225 });
            $('#jqxtabs').bind('selected', function (event) {
                var item = event.args.item;
                var title = $('#jqxtabs').jqxTabs('getTitleAt', item);
            });
        });
    </script>
</head>
<style>
.top-vacant {
	width: 100%;
	height: 20px;
	/* 	background-color: yellow; */
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
					<!-- MainMenu -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">Main Menu</h3>
							<p class="panel-subtitle">STJ Groupware</p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fas fa-inbox fa-4x"></i></span>
										<p>
											<span class="number">WebHard</span><span class="title">웹하드</span>
										</p>
										<input type=hidden value="/">
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric" style="cursor: pointer;"
										onclick="location.href='/nex/admin.nexacro';">
										<span class="icon"><i
											class="fas fa-user-cog fa-4x adminitem"></i></span>
										<p>
											<span class="number">Administrator</span><span class="title">관리자</span>
										</p>
										<input type=hidden value="/nex/admin.nexacro">
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric" style="cursor: pointer;"
										onclick="location.href='/approval/toAppMainView.approval';">
										<span class="icon"><i
											class="fas fa-file-signature fa-4x"></i></span>
										<p>
											<span class="number">e-Approval</span> <span class="title">전자결재</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric" style="cursor: pointer;"
										onclick="location.href='/message/msgInBoxList.message?cpage=1';">
										<span class="icon"><i class="fas fa-envelope fa-4x"></i></span>
										<p>
											<span class="number">Message</span> <span class="title">쪽지함</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END MainMenu -->
					<div class="row">
						<div class="col-md-4">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Commuting check</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<h4>
										<span id="currentTimeSpan"></span>
									</h4>

									<div class="">${attendanceValue.status }
										${attendanceValue.hour } ${attendanceValue.minute }</div>
									<div class="">${leaveWorkValue.status }
										${leaveWorkValue.hour } ${leaveWorkValue.minute }</div>

									<div class="top-vacant d-none d-lg-block"></div>
									<input type="button" value="출근하기" id="attendanceBtn"
										class="btn btn-gray btn-xs"> <input type="button"
										value="퇴근하기" id="leaveWorkBtn" class="btn btn-gray btn-xs">
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											<span class="panel-note"></span>
										</div>
										<div class="col-md-6 text-right">
											<a href="#" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Notice</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body no-padding"></div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											<span class="panel-note"><i class="fa fa-clock-o"></i>
												Latest 3 posts</span>
										</div>
										<div class="col-md-6 text-right">
											<a href="#" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Schedule</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<div class="metric">
										<div id='calendar'></div>
									</div>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											<span class="panel-note"><i class="fa fa-clock-o"></i>
												Latest 3 posts</span>
										</div>
										<div class="col-md-6 text-right">
											<a href="#" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<!-- TASKS -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">My Projects</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled task-list">
										<c:forEach var="i" items="${map}">
											<li>
												<p>
													${i.title}<span class="label-percent">${i.perfection}%</span>
												</p>
												<div class="progress progress-xs">
													<div class="progress-bar progress-bar-danger"
														role="progressbar" aria-valuenow="${i.perfection}"
														aria-valuemin="0" aria-valuemax="100"
														style="width: ${i.perfection}%">
														<span class="sr-only">${i.perfection}% Complete</span>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											<span class="panel-note"></span>
										</div>
										<div class="col-md-6 text-right">
											<a href="#" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
							<!-- END TASKS -->
						</div>
						<div class="col-md-8">
							<!-- TASKS -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">e-Approval</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<div id='jqxtabs'>
										<ul style='margin-left: 20px;'>
											<li>상신 문서</li>
											<li>승인 요청중&nbsp<span class="badge">${knrToBeCount}</span></li>
										</ul>
										<div>
											<div class="panel-body">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col">#</th>
															<th scope="col">제  목</th>
															<th scope="col">기안자(ID)</th>
															<th scope="col">기안날짜</th>
															<th scope="col">문서상태코드</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="i" items="${knrWriteList}">
															<tr>
																<th scope="row">${i.app_docs_num}</th>
																<td>${i.app_title}</td>
																<td>${i.name}</td>
																<td>${i.app_reg_date}</td>
																<td>${i.app_status_code}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<div>
										<div class="panel-body">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col">#</th>
															<th scope="col">제  목</th>
															<th scope="col">기안자(ID)</th>
															<th scope="col">기안날짜</th>
															<th scope="col">현재 상태</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="i" items="${knrToBeList}">
															<tr>
																<th scope="row">${i.app_docs_num}</th>
																<td>${i.app_title}</td>
																<td>${i.name}</td>
																<td>${i.app_reg_date}</td>
																<td>${i.app_is_my_sign_turn}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											<span class="panel-note"></span>
										</div>
										<div class="col-md-6 text-right">
											<a href="#" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
							<!-- END TASKS -->
						</div>
					</div>
					<div class="row">
						<div class="col-md-7">
							<!-- TODO LIST -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">To-Do List</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled todo-list">
										<li><label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
										</label>
											<p>
												<span class="title">Restart Server</span> <span
													class="short-description">Dynamically integrate
													client-centric technologies without cooperative resources.</span>
												<span class="date">Oct 9, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i
													class="icon-software icon-software-pencil"></i></a> <a href="#"><i
													class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div></li>
										<li><label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
										</label>
											<p>
												<span class="title">Retest Upload Scenario</span> <span
													class="short-description">Compellingly implement
													clicks-and-mortar relationships without highly efficient
													metrics.</span> <span class="date">Oct 23, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i
													class="icon-software icon-software-pencil"></i></a> <a href="#"><i
													class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div></li>
										<li><label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
										</label>
											<p>
												<strong>Functional Spec Meeting</strong> <span
													class="short-description">Monotonectally formulate
													client-focused core competencies after parallel
													web-readiness.</span> <span class="date">Oct 11, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i
													class="icon-software icon-software-pencil"></i></a> <a href="#"><i
													class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div></li>
									</ul>
								</div>
							</div>
							<!-- END TODO LIST -->
						</div>
						<div class="col-md-5">
							<!-- TIMELINE -->
							<div class="panel panel-scrolling">
								<div class="panel-heading">
									<h3 class="panel-title">Recent User Activity</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled activity-list">
										<li><img src="assets/img/user1.png" alt="Avatar"
											class="img-circle pull-left avatar">
											<p>
												<a href="#">Michael</a> has achieved 80% of his completed
												tasks <span class="timestamp">20 minutes ago</span>
											</p></li>
										<li><img src="assets/img/user2.png" alt="Avatar"
											class="img-circle pull-left avatar">
											<p>
												<a href="#">Daniel</a> has been added as a team member to
												project <a href="#">System Update</a> <span
													class="timestamp">Yesterday</span>
											</p></li>
										<li><img src="assets/img/user3.png" alt="Avatar"
											class="img-circle pull-left avatar">
											<p>
												<a href="#">Martha</a> created a new heatmap view <a
													href="#">Landing Page</a> <span class="timestamp">2
													days ago</span>
											</p></li>
										<li><img src="assets/img/user4.png" alt="Avatar"
											class="img-circle pull-left avatar">
											<p>
												<a href="#">Jane</a> has completed all of the tasks <span
													class="timestamp">2 days ago</span>
											</p></li>
										<li><img src="assets/img/user5.png" alt="Avatar"
											class="img-circle pull-left avatar">
											<p>
												<a href="#">Jason</a> started a discussion about <a href="#">Weekly
													Meeting</a> <span class="timestamp">3 days ago</span>
											</p></li>
									</ul>
									<button type="button"
										class="btn btn-primary btn-bottom center-block">Load
										More</button>
								</div>
							</div>
							<!-- END TIMELINE -->
						</div>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<!-- VISIT CHART -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Website Visits</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<div id="visits-chart" class="ct-chart"></div>
								</div>
							</div>
							<!-- END VISIT CHART -->
						</div>
						<div class="col-md-4">
							<!-- REALTIME CHART -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">System Load</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<div id="system-load" class="easy-pie-chart" data-percent="70">
										<span class="percent">70</span>
									</div>
									<h4>CPU Load</h4>
									<ul class="list-unstyled list-justify">
										<li>High: <span>95%</span></li>
										<li>Average: <span>87%</span></li>
										<li>Low: <span>20%</span></li>
										<li>Threads: <span>996</span></li>
										<li>Processes: <span>259</span></li>
									</ul>
								</div>
							</div>
							<!-- END REALTIME CHART -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
	</div>
	<!-- END WRAPPER -->
	<script>
	$(function() {
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);


		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

		var updateInterval = 3000; // in milliseconds

		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	});
	</script>

	<script>
      
      var tnaStatus;
      if (("${attendanceValue.status }" == "-") && ("${leaveWorkValue.status }" == "-")) {
         tnaStatus = 0;
         document.getElementById("attendanceBtn").className = "btn btn-default btn-xs";
      }else if (("${attendanceValue.status }" != "-") && ("${leaveWorkValue.status }" == "-")) {
         tnaStatus = 1;
         document.getElementById("attendanceBtn").className = "btn btn-gray btn-xs";
         document.getElementById("leaveWorkBtn").className = "btn btn-default btn-xs";
      }else {
         tnaStatus = 2;
         document.getElementById("attendanceBtn").className = "btn btn-gray btn-xs";
         document.getElementById("leaveWorkBtn").className = "btn btn-warning btn-xs";
      }
      // 0 : 출근 X 퇴근 X
      // 1 : 촐근 O 퇴근 X
      // 2 : 출근 O 퇴근 O
   
      // 출근버튼클릭
      $("#attendanceBtn").on("click", function() {
         if (tnaStatus == 0) {
            location.href = "/tna/attendanceInput.tna";   
         }
      })

      // 퇴근버튼클릭
      $("#leaveWorkBtn").on("click", function() {
         if (tnaStatus != 0) {
            location.href = "/tna/leaveWorkInput.tna";
         }
      })

      
      // 시간출력함수
      function printTime() {
         // 출력할 컴포넌트 아이디 지정
         var clock = document.getElementById("currentTimeSpan");
         // 현재날짜
         var now = new Date();
         // 요일출력 배열
         var week = ['일', '월', '화', '수', '목', '금', '토'];
         
         // 01월 02월 과 같이 깔끔하지 않은 형태 다듬기 위한 변수
         var printMonth = now.getMonth()+1;
         var printDate = now.getDate();
         
         // 시,분,초 10보다 작을경우 0 붙이기
         if (now.getHours() < 10) {
            printHours = "0" + now.getHours();
         }else {
            printHours = now.getHours();
         }
         if (now.getMinutes() < 10) {
            printMinutes = "0" + now.getMinutes();
         }else {
            printMinutes = now.getMinutes();
         }
         if (now.getSeconds() < 10) {
            printSeconds = "0" + now.getSeconds();
         }else {
            printSeconds = now.getSeconds();
         }
         
         var nowTime = now.getFullYear() + "년 " + printMonth + "월 " + printDate + "일 " + week[now.getDay()] + "요일 " + printHours + ":"  + printMinutes + ":" + printSeconds + "";
         
         clock.innerHTML = nowTime;
         setTimeout("printTime()",1000);
      }
      
      // 페이지 로드와 동시에 실행
      window.onload = function() {
         printTime();
      }
   </script>
	<script>
	  document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        
	        var calendar = new FullCalendar.Calendar(calendarEl, {        	
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
					      ],
					    }
					]

	        });
	        calendar.render();
	      });

   </script>
</body>
</html>