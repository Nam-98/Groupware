<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.panel-body div {
	border: 1px solid black;
}

.tableBox {
	width: 100%;
	height: 280px;
}

.tableLine {
	width: 100%;
	height: 12%;
}

.tableLine>.tableTitle {
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
}

.tableLine>.tableValue {
	float: left;
	width: 85%;
	height: 100%;
}

.tableReason {
	height: 64%;
}

.tableValue>textarea {
	resize: none;
	width: 100%;
	height: 100%;
}

.componentBox {
	text-align: right;
}

#wrapper #sidebar-nav, #wrapper .main {
	padding-top: 0px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<!-- 		<nav class="navbar navbar-default navbar-fixed-top"> -->
		<%-- 			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" /> --%>
		<!-- 		</nav> -->
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/webhard/leftWebhard.jsp" />
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-body">
						<form method="post" enctype="multipart/form-data" action="/webhard/uploadFile.webhard?dirSeq=${dirSeq }">
							<input type="submit" value="upload">
							<input type="button" value="download">
							<input type="file" name="attfiles" multiple>
						</form>
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


	<script>
		$(".main").css({
			"padding-top": "0px"
		});
	</script>
</body>
</html>