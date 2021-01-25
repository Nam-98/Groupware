<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp"/>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp"/>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">출퇴근 체크</h3>
					<div class="top-vacant d-none d-lg-block"></div>
					<div class="col-lg-12 col-12">
						<span id="currentTimeSpan"></span>
						<div class="">
							${attendanceValue.status }
							${attendanceValue.hour }
							${attendanceValue.minute }
						</div>
						<div class="">
							${leaveWorkValue.status }
							${leaveWorkValue.hour }
							${leaveWorkValue.minute }
						</div>
						<input type="button" value="출근하기" id="attendanceBtn" class="btn btn-gray btn-xs"> 
						<input type="button" value="퇴근하기" id="leaveWorkBtn" class="btn btn-gray btn-xs">
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme I Need</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	
	
	
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
</body>
</html>