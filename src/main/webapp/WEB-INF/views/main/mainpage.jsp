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
.dataRow:hover{cursor:pointer;}
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
					<!-- MainMenu -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">Main Menu</h3>
							<p class="panel-subtitle">STJ Groupware</p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="metric goWebhard" style="cursor: pointer;">
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
									<h3 class="panel-title"><b>Commuting check</b></h3>
									<div class="right"></div>
								</div>
								<div class="panel-body">
									<h4>
										<span id="currentTimeSpan"></span>
									</h4>


									<div class="top-vacant d-none d-lg-block"></div>
									<input type="button" value="출근하기" id="attendanceBtn"
										class="btn btn-gray btn-xs"> <input type="button" value="퇴근하기" id="leaveWorkBtn" class="btn btn-gray btn-xs">
									<hr>
									<div class="">
										<span class="glyphicon glyphicon-flag" aria-hidden="true">&nbsp<b>${attendanceValue.status }</b>&nbsp
										</span>
										<c:if test='${attendanceValue.status != "-"}'>${attendanceValue.hour }시 ${attendanceValue.minute }분</c:if>

									</div>
									<hr>
									<div class="">
										<span class="glyphicon glyphicon-home" aria-hidden="true">&nbsp<b>${leaveWorkValue.status }</b>&nbsp
										</span>
										<c:if test='${leaveWorkValue.status != "-"}'> ${leaveWorkValue.hour }시 ${leaveWorkValue.minute }분</c:if>
									</div>
									<hr>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											<span class="panel-note"></span>
										</div>
										<div class="col-md-6 text-right">
											<a href="/tna/tnaCheckPage.tna" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<!-- TASKS -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><b>e-Approval</b></h3>
									<div class="right"></div>
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
															<th scope="col">제 목</th>
															<th scope="col">기안자(ID)</th>
															<th scope="col">기안날짜</th>
															<th scope="col">문서상태</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="i" items="${knrWriteList}">
															<tr class='dataRow'>
																<th scope="row">${i.app_docs_num}<input type=hidden value="${i.app_seq}"></th>
																<td>${i.app_title}</td>
																<td>${i.name}</td>
																<td>${i.app_reg_date}</td>
																<td>${i.app_status_name}</td>
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
															<th scope="col">제 목</th>
															<th scope="col">기안자(ID)</th>
															<th scope="col">기안날짜</th>
															<th scope="col">현재 상태</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="i" items="${knrToBeList}">
															<tr class='dataRow'>
																<th scope="row">${i.app_docs_num}<input type=hidden value="${i.app_seq}"></th>
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
											<a href="/approval/toAppMainView.approval" class="btn btn-primary">more</a>
										</div>
									</div>
								</div>
							</div>
							<!-- END TASKS -->
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><b>My Projects</b></h3>
									<div class="right"></div>
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
											<a href="/project/enterProjectList.project?cpage=1" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">

							<!-- TASKS -->

							<div class="panel">

								<div class="panel-heading">
									<h3 class="panel-title">
										<b>Inbox&nbsp</b><span class="badge rounded-pill bg-danger">${kgsMsgCount}</span>
									</h3>
									<div class="right"></div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">발신날짜</th>
												<th scope="col">제 목</th>
												<th scope="col">발신인</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="i" items="${kgsMsgList}">
												<tr>
													<td>${i.msg_send_date}</td>
													<th scope="row"><a href="/message/msgReceiveView.message?msg_seq=${i.msg_seq}&msg_receive_date_str=${msg_receive_date_str}">${i.msg_title}</a></th>
													<td>${i.msg_sender_name}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											<span class="panel-note"></span>
										</div>
										<div class="col-md-6 text-right">
											<a href="/message/msgInBoxList.message?cpage=1" class="btn btn-primary">more</a>
										</div>
									</div>
								</div>
							</div>
							<!-- END TASKS -->

						</div>
						<div class="col-md-4">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title"><b>Schedule</b></h3>
									<div class="right"></div>
								</div>
								<div class="panel-body">
									<div class="metric">
										<div id='calendar'></div>
									</div>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6">
											
										</div>
										<div class="col-md-6 text-right">
											<a href="/schedule/monthSchedule.schedule" class="btn btn-primary">Go</a>
										</div>
									</div>
								</div>
							</div>
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
		$('.goWebhard').on('click', function(){
			var url = "/webhard/webhardMain.webhard";
			var popupWidth = 1440;
			var popupHeight = 810;
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
			var popupY = (window.screen.height / 2) - (popupHeight / 2) - 50;
			// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
			
			var options='top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no, location=no';
			window.open(url,"popup",options);
		})
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
       if ("${leaveWorkValue.status }" == "조퇴"){
      	 document.getElementById("leaveWorkBtn").className = "btn btn-warning btn-xs";
       }else if ("${leaveWorkValue.status }" == "퇴근"){
      	 document.getElementById("leaveWorkBtn").className = "btn btn-success btn-xs";
       }else{
      	 document.getElementById("leaveWorkBtn").className = "btn btn-danger btn-xs";
       }
       
       
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
   		<script>
		//row눌렀을 때 링크로 이동
		$(".dataRow").on("click",function(){
			console.log($(this).children().first().children("input").val());
			location.href="/approval/toAppDetailView.approval?app_seq="+$(this).children().first().children("input").val()
		});
		
	      setTimeout(function() {
	                 $("#jqxtabs").css({
	                    "width": "100%"
	                 })
	              }, 300
	        );
	</script>
</body>
</html>