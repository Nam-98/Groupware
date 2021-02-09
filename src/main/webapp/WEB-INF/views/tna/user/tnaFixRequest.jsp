<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.panel-body div{
	border: 1px solid black;
}
.tableBox{
	width: 100%;
	height: 280px;
}
.tableLine{
	width: 100%;
	height: 12%;
}
.tableLine>.tableTitle{
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
}
.tableLine>.tableValue{
	float: left;
	width: 85%;
	height: 100%;
}
.tableReason{
	height: 64%;
}
.tableValue>textarea{
	resize: none;
	width: 100%;
	height: 100%;
}

.componentBox{
	text-align: right;
}
</style>
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
<!-- 		<nav class="navbar navbar-default navbar-fixed-top"> -->
<%-- 			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" /> --%>
<!-- 		</nav> -->
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
<!-- 		<div class="sidebar" id="sidebar-nav"> -->
<%-- 			<jsp:include page="/WEB-INF/views/commonPage/left.jsp" /> --%>
<!-- 		</div> -->
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
<!-- 		<div class="main"> -->
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">근태관리</h3>
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<h3 class="panel-title">근 태 조 정 신 청</h3>
						</div>
						<div class="panel-body">
							<form action="/tna/tnaFixRequestSubmit.tna" method="post" id="formBox">
								<div class="tableBox">
									<div class="tableLine">
										<div class="tableTitle">신청 날짜</div>
										<div class="tableValue" id="requestDateDiv">xxxx년 x월 x일 (n요일) [오늘날짜]</div>
									</div>
									<div class="tableLine">
										<div class="tableTitle">현재 상태</div>
										<div class="tableValue" id="currentStatusDiv">STATUS (xxxx/x/x/n) [정정할날짜]</div>
									</div>
									<div class="tableLine">
										<div class="tableTitle">변경요청 상태</div>
										<div class="tableValue">
											<select class="" name="tna_obj_changed_code" id="selectStatus">
												<option value="선택">선택</option>
											<c:forEach varStatus="none" var="list" items="${tnaStatusList}">
												<option value="${list.tna_status_code }">${list.tna_status_name }</option>
											</c:forEach>
											</select>
											
										</div>
									</div>
									<div class="tableLine tableReason">
										<div class="tableTitle">사유</div>
										<div class="tableValue">
											<textarea name="tna_obj_reason" id="textReason"></textarea>
										</div>
									</div>
								</div>
								<div class="componentBox">
									<input type="submit" class="btn btn-primary btn-xs" value="신청하기">
									<input type="button" class="btn btn-gray btn-xs" value="취소" id="tnaFixCancel">
								</div>
								<input id="" type="hidden" value="${tnaCalendarValue.TNA_SEQ }" name="tna_seq">
								<input id="" type="hidden" value="${tna_status }" name="tna_obj_status">
							</form>
						</div>
					</div>


				</div>
			</div>
			<!-- END MAIN CONTENT -->
<!-- 		</div> -->
		<!-- END MAIN -->
		<div class="clearfix"></div>
			<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
		</div>
		<!-- END WRAPPER -->

	<script>
				
		// 시간출력함수
		function printRequestDate() {
			// 출력할 컴포넌트 아이디 지정
			var clock = document.getElementById("requestDateDiv");
			// 현재날짜
			var now = new Date();
			// 요일출력 배열
			var week = [ '일', '월', '화', '수', '목', '금', '토' ];

			// 01월 02월 과 같이 깔끔하지 않은 형태 다듬기 위한 변수
			var printMonth = now.getMonth() + 1;
			var printDate = now.getDate();

			// 시,분,초 10보다 작을경우 0 붙이기
			if (now.getHours() < 10) {
				printHours = "0" + now.getHours();
			} else {
				printHours = now.getHours();
			}
			if (now.getMinutes() < 10) {
				printMinutes = "0" + now.getMinutes();
			} else {
				printMinutes = now.getMinutes();
			}
			if (now.getSeconds() < 10) {
				printSeconds = "0" + now.getSeconds();
			} else {
				printSeconds = now.getSeconds();
			}

			var nowTime = now.getFullYear() + "년 " + printMonth + "월 "
					+ printDate + "일 (" + week[now.getDay()] + "요일) "
// 					+ printHours + ":" + printMinutes + ":" + printSeconds + ""
					;

			clock.innerHTML = nowTime;
			setTimeout("printRequestDate()", 1000);
		}
		
		// 시간출력함수
		function printCurrentStatus() {
			// 출력할 컴포넌트 아이디 지정
			var clock = document.getElementById("currentStatusDiv");
			var nowStatus = "";
			// 현재날짜
			if ("${tna_status}" == "start") {
				var now = new Date('${tnaCalendarValue.TNA_START_TIME}');
				nowStatus = '${tnaCalendarValue.TNA_START_STATUS_NAME}';
			}else {
				var now = new Date('${tnaCalendarValue.TNA_END_TIME}');
				nowStatus = '${tnaCalendarValue.TNA_END_STATUS_NAME}';
			}

			// 요일출력 배열
			var week = [ '일', '월', '화', '수', '목', '금', '토' ];

			// 01월 02월 과 같이 깔끔하지 않은 형태 다듬기 위한 변수
			var printMonth = now.getMonth() + 1;
			var printDate = now.getDate();

			// 시,분,초 10보다 작을경우 0 붙이기
			if (now.getHours() < 10) {
				printHours = "0" + now.getHours();
			} else {
				printHours = now.getHours();
			}
			if (now.getMinutes() < 10) {
				printMinutes = "0" + now.getMinutes();
			} else {
				printMinutes = now.getMinutes();
			}
			if (now.getSeconds() < 10) {
				printSeconds = "0" + now.getSeconds();
			} else {
				printSeconds = now.getSeconds();
			}

			var nowTime = "[" + nowStatus + "] " + now.getFullYear() + "년 " + printMonth + "월 "
			+ printDate + "일 " 
				+ printHours + "시 " + printMinutes + "분" 
// 				+ printSeconds + ""
				+ " (" + week[now.getDay()] + "요일) "
				;

			clock.innerHTML = nowTime;
		}
		


		// 페이지 로드와 동시에 실행
		window.onload = function() {
			printRequestDate();
			printCurrentStatus();
		}
		
		$("#tnaFixCancel").on("click", function() {
			window.close();
		});
		
		// 정정신청제출 Submit
		document.getElementById("formBox").onsubmit = function() {
			if (document.getElementById("selectStatus").value == "선택") {
				alert("변경 요청할 상태를 선택해 주세요.");
				return false;
			}
			if (document.getElementById("textReason").value == "") {
				alert("사유를 입력해주세요.");
				return false;
			}
		}
		
	</script>
</body>
</html>