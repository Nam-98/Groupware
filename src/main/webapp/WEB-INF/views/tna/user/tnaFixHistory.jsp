<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.panel-body div {
	border: 0px solid black;
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
<title>근태조정내역</title>
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
					<h3 class="page-title">My TnA</h3>
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<h3 class="panel-title">근 태 조 정 내 역</h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">내용</th>
										<th scope="col">변경요청상태</th>
										<th scope="col">신청일</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${tnaFixRequestList}">
										<tr>
											<th scope="row">${i.TNA_OBJ_SEQ}</th>
											<td><span class="popupSpan"
												id="link${i.TNA_SEQ}${i.TNA_OBJ_STATUS}">${i.TNA_ORI_STATUS_NAME }
													${i.TNA_OBJ_TIME }</span> 
													<script>
										$('#link${i.TNA_SEQ}${i.TNA_OBJ_STATUS}').on('click', function(){
											var url = "/tna/tnaFixRequestPage.tna?tna_seq=${i.TNA_SEQ}&tna_status=${i.TNA_OBJ_STATUS}&tna_obj_proc_status_name=${i.TNA_OBJ_PROC_STATUS_NAME}";
											var popupWidth = 800;
											var popupHeight = 600;
											var popupX = (window.screen.width / 2) - (popupWidth / 2);
											// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
											var popupY = (window.screen.height / 2) - (popupHeight / 2) - 50;
											// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
											
											var options='top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no, location=no';
											window.open(url,"popup",options);
										})
									</script></td>
											<td>${i.TNA_STATUS_NAME}</td>
											<td>${i.TNA_OBJ_REG_DATE}</td>
											<td>${i.TNA_OBJ_PROC_STATUS_NAME}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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