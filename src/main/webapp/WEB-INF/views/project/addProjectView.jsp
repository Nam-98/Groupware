<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트추가</title>
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
	/* background-color: yellow; */
}
.button-box{
	text-align : center;
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
					<h3 class="page-title">My Project</h3>
					<div class="row">
						<div class="col-lg-10 d-none d-lg-block"></div>
						<div class="col-lg-2 col-12">
							<!-- Single button -->
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									Action <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="top-vacant d-none d-lg-block"></div>

					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">프 로 젝 트 추 가</h3>
						</div>
						<div class="panel-body">
							<form action="/project/addProjectProc.project" method="post"
								id="formBox">
								<div class="col-lg-12 col-12">
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
												<td><input type="text" class="textSpace" required
													id="pro_title" name=pro_title placeholder="Enter project-title"></td>
											</tr>
											<tr>
												<th scope="row">담 당 자(PM)</th>
												<td><input type="text" class="textSpace" required
													id="pro_id" name=pro_id placeholder="Enter project-manager"></td>
											</tr>
											<tr>
												<th scope="row">일 자</th>
												<td><input required type="date"
													name="pro_start_date_str" id="date3" size="12" />&nbsp~&nbsp<input
													required type="date" name="pro_end_date_str" id="date2"
													size="12" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
							<div class = "button-box">
							<button type="button" id="addsubmit" class="btn btn-success">등록</button>
							<button type="button" id="addCancel" class="btn btn-secondary">취소</button>
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
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$("#addCancel").on("click", function() {
		location.href = "/project/enterProjectList.project?cpage=1";
	});

	$("#addsubmit").on("click", function() {
		$("#formBox").submit();
	});
</script>

</html>