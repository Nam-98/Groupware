<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	
	<style>
* {
	box-sizing: border-box;
}
a { text-decoration:none } 

.right-side {
	width: 1020px;
	height: 720px;
	position: fixed;
	top: 0px;
	left: 260px;
}

.top-vacant {
	width: 1020px;
	height: 20px;
	background-color: yellow;
}

.page-name {
	width: 510px;
	height: 50px;
	float: left;
}

</style>

</head>
<body>
	<!-- WRAPPER -->
<!-- 	<div id="wrapper"> -->
		<!-- NAVBAR -->
<!-- 		<nav class="navbar navbar-default navbar-fixed-top"> -->
<%-- 			<jsp:include page="/WEB-INF/views/commonPage/top.jsp"/> --%>
<!-- 		</nav> -->
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
<!-- 		<div class="sidebar" id="sidebar-nav"> -->
<%-- 			<jsp:include page="/WEB-INF/views/commonPage/left.jsp"/> --%>
<!-- 		</div> -->
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">공지사항</h3>
					<div class="maincontainer">

				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="col-7">제목 : ${dtos.get(0).write_title }<input id="brWriteId" type="hidden" value="${dtos.get(0).write_seq }"></th>
							<th scope="col" class="col-2">작성자 : ${dtos.get(0).write_id } <input id="loginId" type="hidden" value="${sessionScope.id}"></th>
							<th scope="col" class="col-2">작성일 : ${dtos.get(0).write_reg_date_wr }</th>
<%-- 							<th scope="col" class="col-1">조회수 : ${dtos.get(0).write_read_count }</th> --%>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="contents" colspan="4">${dtos.get(0).write_contents }</td>
						</tr>
					</tbody>
				</table>
			</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
<!-- 		<div class="clearfix"></div> -->
<%-- <jsp:include page="/WEB-INF/views/commonPage/footer.jsp" /> --%>
<!-- 	</div> -->
	<!-- END WRAPPER -->
</body>
</html>