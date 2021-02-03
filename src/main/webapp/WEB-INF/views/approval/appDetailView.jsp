<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 상세페이지</title>
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
	<script	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
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
					<h3 class="page-title">전자결재 상세페이지</h3>
					<div class="panel">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<div id="comInfoContainer">
								<div class="row">
									<div class="col-sm-2"><blockquote class="blockquote-reverse">문서 종류</blockquote></div>
									<div class="col-sm-4">${app.app_type_name}</div>
									<div class="col-sm-2"><blockquote class="blockquote-reverse">문서 번호</blockquote></div>
									<div class="col-sm-4">${app.app_docs_num}</div>
								</div>
								<div class="row">
									<div class="col-sm-2"><blockquote class="blockquote-reverse">기안 부서</blockquote></div>
									<div class="col-sm-4">
										<c:forEach items="${mlist}" var="mem">
											<c:if test="${app.app_id==mem.id}">
												${mem.dept_name }
											</c:if>
										</c:forEach>
									</div>
									<div class="col-sm-2"><blockquote class="blockquote-reverse">기안자</blockquote></div>
									<div class="col-sm-4">
										<c:forEach items="${mlist}" var="mem">
											<c:if test="${app.app_id==mem.id}">
												${mem.name }
											</c:if>
										</c:forEach>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-2"><blockquote class="blockquote-reverse">보존연한</blockquote></div>
									<div class="col-sm-4">${app.app_archive}년</div>
									<div class="col-sm-2"><blockquote class="blockquote-reverse">기안 일시</blockquote></div>
									<div class="col-sm-4">${app.app_reg_date}</div>
								</div>
							</div>
						</div>

						<!-- pannel 내부의 내용 작성 div-->
						<div class="panel-body">
							<div id="tViewer">${contents}</div>
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
				<p class="copyright">&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme I Need</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->

</body>
</html>