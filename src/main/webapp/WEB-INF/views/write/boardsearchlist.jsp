<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 게시판 검색</title>
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


.navi {
	text-align: center;
}
</style>

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
					<h3 class="page-title">회사 게시판 검색</h3>
					<div class="maincontainer">
			<form action="boardSearch.write?cpage=1" method="post">
				<table>
					<tr>
						<td>
						<select id="condition" name="condition">
<!-- 							<option value="">검색조건</option> -->
<!-- 							<option value="">전체보기</option> -->
							<option value="write_title">제목</option>
							<option value="write_id">작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요">
						<button id="searchBtn" type="submit">검색</button>
						</td>
					</tr>
				</table>
			 </form>

				<table class="table table-secondary table-striped">
					<thead class="table-light">
						<tr>
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${list }">
							<tr>
								<th scope="row">${i.rn }</th>
								<td><a href="boardView.write?write_seq=${i.write_seq}">${i.write_title }</a></td>
								<td>${i.write_id }</td>
								<td>${i.write_reg_date }</td>
								<td>${i.write_read_count }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="navi">${navi }</div>
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
</body>
</html>