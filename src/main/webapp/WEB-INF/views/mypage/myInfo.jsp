<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<title>My Page</title>
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
					<h3 class="page-title">My page</h3>
					<div class="alert alert-warning alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span> <strong>Warning!</strong>
						개인정보수정은 관리자에게 문의바랍니다!!!
					</div>
					<div class="top-vacant d-none d-lg-block"></div>

					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">개 인 정 보</h3>
						</div>
						<div class="panel-body">
							<div class="col-lg-2 col-12">
								<div class="profilBox d-none d-lg-block">
									<img class="profileImg img-thumbnail" alt="${id}"
										src="/resources/profileImage/${id}.png">
									<div class="m-2">
										<div class="m-2">${sessionScope.id}&nbsp&nbsp
											${dto.position_name}님</div>
									</div>
								</div>
							</div>
							<div class="col-lg-10 col-12">
								<div class="bodyContents">
									<div class="card-body">
										<table class="table table-sm">
											<thead>
												<tr class="table-secondary">
													<th scope="col">항 목</th>
													<th scope="col">내 용</th>
													<th scope="col">항 목</th>
													<th scope="col">내 용</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">이 름</th>
													<td>${dto.name}</td>
													<th scope="row">생 년 월 일</th>
													<td>${dto.birth}</td>
												</tr>
												<tr>
													<th scope="row">연 락 처</th>
													<td>${dto.contact}</td>
													<th scope="row">성 별</th>
													<td>${dto.gender}</td>
												</tr>
												<tr>
													<th scope="row">주 소</th>
													<td>${dto.address1}</td>
													<th scope="row">상 세 주 소</th>
													<td>${dto.address2}(${dto.zip_code})</td>
												</tr>
												<tr>
													<th scope="row">결 혼 유 무</th>
													<td>${dto.is_married}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">사 원 정 보</h3>
						</div>
						<div class="panel-body">
							<div class="col-lg-12 col-12">
								<div class="bodyContents">
									<div class="card-body">
										<table class="table table-sm">
											<thead>
												<tr class="table-secondary">
													<th scope="col">항 목</th>
													<th scope="col">내 용</th>
													<th scope="col">항 목</th>
													<th scope="col">내 용</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">부 서</th>
													<td>${dto.dept_name}</td>
													<th scope="row">직 위</th>
													<td>${dto.position_name}</td>
												</tr>
												<tr>
													<th scope="row">입 사 일</th>
													<td>${dto.reg_date}</td>
													<th scope="row">퇴 사 일</th>
													<td>${dto.retire_date}</td>
												</tr>
												<tr>
													<th scope="row">사용휴가일수</th>
													<td>${dto.break_use_count}일 (전체 :
														${dto.break_total_count} &nbsp일 )</td>
												</tr>
											</tbody>
										</table>
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
		$("#askFix").on("click", function() {
			alert("미구현");
		});
	</script>

</body>
</html>

