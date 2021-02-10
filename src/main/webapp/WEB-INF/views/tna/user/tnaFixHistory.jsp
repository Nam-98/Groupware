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
	height: 330px;
}
.tableLine{
	width: 100%;
	height: 9.09090909%;
}
.tableLine>.sector1{
	float: left;
	width: 10%;
	height: 100%;
}
.tableLine>.sector2{
	float: left;
	width: 10%;
	height: 100%;
}
.tableLine>.sector3{
	float: left;
	width: 10%;
	height: 100%;
}
.tableLine>.sector4{
	float: left;
	width: 60%;
	height: 100%;
}
.tableLine>.sector5{
	float: left;
	width: 10%;
	height: 100%;
}
.navi {
	width: 100%;
	height: 45px;
	text-align: center;
	line-height: 45px;
	text-decoration: none;
	color: black;
}
.popupSpan {
	cursor: pointer;
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
					<h3 class="page-title">근태관리</h3>
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<h3 class="panel-title">근 태 조 정 내 역</h3>
						</div>
						<div class="panel-body">
							<div class="tableBox">
								<div class="tableLine">
									<div class="sector1">번 호</div>
									<div class="sector2">신 청 일</div>
									<div class="sector3">변 경 요 청 상 태</div>
									<div class="sector4">내 용</div>
									<div class="sector5">구 분 상 태</div>
								</div>
								<c:forEach varStatus="i" var="list" items="${tnaFixRequestList}">
								<div class="tableLine">
									<div class="sector1">${list.TNA_OBJ_SEQ }</div>
									<div class="sector2">${list.TNA_OBJ_REG_DATE }</div>
									<div class="sector3">${list.TNA_STATUS_NAME }</div>
									<div class="sector4">
									<span class="popupSpan" id="link${list.TNA_SEQ}${list.TNA_OBJ_STATUS}">${list.TNA_ORI_STATUS_NAME } ${list.TNA_OBJ_TIME }</span>
									</div>
									<script>
										$('#link${list.TNA_SEQ}${list.TNA_OBJ_STATUS}').on('click', function(){
											var url = "/tna/tnaFixRequestPage.tna?tna_seq=${list.TNA_SEQ}&tna_status=${list.TNA_OBJ_STATUS}";
											var popupWidth = 800;
											var popupHeight = 600;
											var popupX = (window.screen.width / 2) - (popupWidth / 2);
											// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
											var popupY = (window.screen.height / 2) - (popupHeight / 2) - 50;
											// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
											
											var options='top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no, location=no';
											window.open(url,"popup",options);
										})
									</script>
									<div class="sector5">${list.TNA_OBJ_PROC_STATUS_NAME }</div>
								</div>
								</c:forEach>
							</div>
							<div class="navi">${navi }</div>
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


</body>
</html>