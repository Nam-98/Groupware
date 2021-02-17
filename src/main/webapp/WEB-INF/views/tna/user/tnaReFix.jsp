<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
#textReason{
	resize: none;
	width: 100%;
	height: 100%;
}

.componentBox{
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title>My TnA</title>
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
 		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<h3 class="panel-title">조정신청내역</h3>
						</div>
						<div class="panel-body">
								
								<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">항목</th>
										<th scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">신청 날짜</th>
										<td><div class="tableValue" id="requestDateDiv">xxxx년 x월 x일 (n요일) [오늘날짜]</div></td>
									</tr>
									<tr>
										<th scope="row">현재 상태</th>
										<td><div class="tableValue" id="currentStatusDiv">STATUS (xxxx/x/x/n) [정정할날짜]</div></td>
									</tr>
									<tr>
										<th scope="row">변경요청 상태</th>
										<td>
										<div class="tableValue">
											<c:forEach varStatus="none" var="list" items="${tnaStatusList}">
												<c:if test='${list.tna_status_code == dto.TNA_OBJ_CHANGED_CODE}'>
													${list.tna_status_name }
												</c:if>
											</c:forEach>
										</div>
										</td>
									</tr>
									<tr>
										<th scope="row">사유</th>
										<td><div class="tableValue">
											<textarea name="tna_obj_reason" id="textReason" disabled>${dto.TNA_OBJ_REASON}</textarea>
										</div></td>
									</tr>
								</tbody>
							</table>
								<div class="componentBox">
									<input type="button" class="btn btn-gray btn-xs" value="닫기" id="tnaFixCancel">
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
		// 시간출력함수
		function printRequestDate() {
			// 출력할 컴포넌트 아이디 지정
			var clock = document.getElementById("requestDateDiv");
			// 현재날짜
// 			alert('${dto.tna_obj_reg_date}');
			var now = new Date('${dto.TNA_OBJ_REG_DATE}');
// 			var now = new Date('${dto.tna_obj_reg_date}');
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
// 			setTimeout("printRequestDate()", 1000);
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
			setTimeout(function() {
				checkOverlap();
				}, 100);
		}
		
		$("#tnaFixCancel").on("click", function() {
			window.close();
		});
		
	</script>
</body>
</html>