<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일간 일정</title>
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
<style>
* {
	box-sizing: border-box;
}

/* .addDiv{ */
/* 	text-align: center; */
/* } */

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
					<h3 class="page-title">일간 일정</h3>
				</div>
				<div class="panel panel-headline demo-icons">
					<div class="panel-heading">
						<h3 class="panel-title">일 간 일 정</h3>
					</div>
					<div class="panel-body">
						<div>
							
						</div>
<!-- 						<div class="addDiv"> -->
<!-- 							<button id="addBtn">일정 추가하기</button> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<div class="col">시간<button class="glyphicon glyphicon-plus"></button></div> -->
<!-- 						</div> -->
					</div>
					
					<table class="table">
						<thead>
							<tr>
								<th scope="col">시간</th>
								<th>일정 리스트 : 총 n 개</th>
							</tr>
						</thead>
						<tbody>					
							<tr>
								<td><a href="#">오전6시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오전7시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오전8시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오전9시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오전10시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오전11시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오후12시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오후1시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오후2시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오후3시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오후4시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오후5시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							<tr>
								<td><a href="#">오후6시</a></td>
								<td>일간 일정 리스트</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			<!-- END MAIN CONTENT -->
			</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
			<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
		</div>
	<!-- END WRAPPER -->
	</div>
</body>
</html>