<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<title>프로젝트 보기</title>
<meta charset="utf-8">
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
<style>
* {
	border: 0px solid black;
}

.top-vacant {
	width: 100%;
	height: 20px;
	/* 	background-color: yellow; */
}

.profilBox {
	text-align: center;
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
					<h3 class="page-title">My Project : ${pdto.pro_title}</h3>
					<div class="row">
						<div class="col-lg-9 d-none d-lg-block"></div>
						<div class="col-lg-3 col-12">
							<button type="button" id="gokanban" class="btn btn-success">칸반보드</button>
							<button type="button" id="deletepro" class="btn btn-secondary">삭제</button>
						</div>
					</div>
					<div class="top-vacant d-none d-lg-block"></div>

					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">프 로 젝 트 정 보</h3>
						</div>
						<div class="panel-body">
							<table class="table table-sm">
								<thead>
									<tr class="table-secondary">
										<th scope="col">항 목</th>
										<th scope="col">내 용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">프로젝트명</th>
										<td>${pdto.pro_title}</td>
									</tr>
									<tr>
										<th scope="row">담 당 자(PM)</th>
										<td>${pdto.pro_id}</td>
									</tr>
									<tr>
										<th scope="row">일 자 (전체 : ${proTerm} 일)</th>
										<td>${pdto.pro_start_date}~${pdto.pro_end_date}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">프 로 젝 트 전 체 진 행 률</h3>
						</div>
						<div class="panel-body">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">시간경과율</h3>
								</div>
								<div class="panel-body">
									<div class="progress">
										<div
											class="progress-bar progress-bar-success progress-bar-striped active"
											role="progressbar" aria-valuenow="${timeRate}"
											aria-valuemin="0" aria-valuemax="100"
											style="width: ${timeRate}%"></div>
									</div>
									<br> 시간 경과율 : ${timeRate} <br> 시간 경과율 : {(프로젝트
									마감일-오늘) / (프로젝트 전체 기간)} * 100
								</div>
							</div>

							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">프로젝트진행률</h3>
								</div>
								<div class="panel-body">
									<div class="progress">
										<div
											class="progress-bar progress-bar-success progress-bar-striped active"
											role="progressbar" aria-valuenow="${projectRate}"
											aria-valuemin="0" aria-valuemax="100"
											style="width: ${projectRate}%"></div>
									</div>
									<br> 전체 진행률 : ${projectRate} <br> 전체 진행률 :
									{(완료kanban)+0.5*(진행중kanban) / (전체kanban-중지kanban)} * 100 <br>
									진행상태없음 : ${list.get(0)}<br> 시작 전 : ${list.get(1)}<br>
									진행 중 : ${list.get(2)}<br> 완 료 : ${list.get(3)}<br> 중
									지 : ${list.get(4)}
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END MAIN CONTENT -->
			</div>
			<!-- END MAIN -->
			<div class="clearfix"></div>
			<footer>
				<div class="container-fluid">
					<p class="copyright">
						&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme
							I Need</a>. All Rights Reserved.
					</p>
				</div>
			</footer>
		</div>
	</div>
	<!-- END WRAPPER -->
	<script>
		$("#gokanban").on("click", function() {
			alert("미구현");
			location.href = "/project/gokanban.project";
		});
		$("#deletepro").on("click", function() {
			alert("미구현");
		});
	</script>

</body>
</html>
