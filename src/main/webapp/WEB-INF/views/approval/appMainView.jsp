<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
                    <h3 class="page-title">페이지명</h3>
                    <div class="row">
						<div class="col-12 col-md-3">
							<div class="panel">
								<div class='panel-heading'>
									<h3 class='panel-title'>결재할 문서함</h3>
									<!--pannel의 최소화 및 닫기 버튼-->
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">미결재 / 결재완료 -> 그래프 등으로 표현하면 좋을 듯</div>
							</div>
						</div>
						<div class="col-12 col-md-3">
							<div class="panel">
								<div class='panel-heading'>
									<h3 class='panel-title'>개인 문서함</h3>
									<!--pannel의 최소화 및 닫기 버튼-->
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">상신문서 반려문서 임시저장 결재완료 상신취소</div>
							</div>
						</div>
						<div class="col-12 col-md-3">
							<div class="panel">
								<div class='panel-heading'>
									<h3 class='panel-title'>협조 문서함</h3>
									<!--pannel의 최소화 및 닫기 버튼-->
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">미결재 결재완료 -> 그래프</div>
							</div>
						</div>
						<div class="col-12 col-md-3">
							<div class="panel">
								<div class='panel-heading'>
									<h3 class='panel-title'>부서/참조 수신함</h3>
									<!--pannel의 최소화 및 닫기 버튼-->
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">부서수신함 참조수신함</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 col-md-4">
							<div class="panel">
								<div class='panel-heading'>
									<h3 class='panel-title'>결재할 문서함 > 미결재 문서</h3>
									<!--pannel의 최소화 및 닫기 버튼-->
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">문서번호 기안일자 문서명 기안자 나의결재 [상태] 다음결재자 [의견]</div>
							</div>
						</div>
						<div class="col-12 col-md-4">
							<div class="panel">
								<div class='panel-heading'>
									<h3 class='panel-title'>개인 문서함 > 상신 문서</h3>
									<!--pannel의 최소화 및 닫기 버튼-->
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">문서번호 기안일자 문서명 [상태] [의견]</div>
							</div>
						</div>
						<div class="col-12 col-md-4">
							<div class="panel">
								<div class='panel-heading'>
									<h3 class='panel-title'>협조 문서함 > 미결재 문서</h3>
									<!--pannel의 최소화 및 닫기 버튼-->
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">문서번호 기안일자 문서명 기안자 나의결재 [상태] 다음결재자 [의견]</div>
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
				<p class="copyright">&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme I Need</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
</body>
</html>