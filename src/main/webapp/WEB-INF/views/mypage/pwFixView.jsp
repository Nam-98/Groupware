<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>비밀번호 변경</title>
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
					<h3 class="page-title">마이페이지</h3>
					<form action="/member/fixMyPw.member" method="post" id="formBox">
						<div class="panel panel-headline demo-icons">
							<div class="panel-heading">
								<h3 class="panel-title">비 밀 번 호 변 경</h3>
							</div>
							<div class="panel-body">
								<div class="col-md-3 col-12"></div>
								<div class="col-md-6 col-12">
									<table class="table table-sm">
										<tbody>
											<tr>
												<th scope="row">현재 비밀번호</th>
												<td><input required type="password" placeholder="" name="pw" id="pw"></td>
											</tr>
											<tr>
												<th scope="row">새 비밀번호</th>
												<td><input id="newpw" required type="password"
													placeholder="" name="newpw"></td>
											</tr>
											<tr>
												<th scope="row">비밀번호 확인</th>
												<td><input id="newpwck" required type="password"
													placeholder=""></td>
											</tr>
											<tr>
												<th scope="row">상태값</th>
												<td><span id="ckpwmsg"></span>
											</tr>
											<tr></tr>
										</tbody>
									</table>
									<input id="ckFlag" type="hidden" value="false">
								</div>
								<div class="col-md-3 col-12"></div>
							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-md-4">
										<span class="panel-note"></span>
									</div>
									<div class="col-md-4 text-center">
										<button type="submit" class="btn btn-sm btn-primary">수정</button>
										<input id="cancel" type="button" class="btn btn-sm btn-danger"
											value="취소">
									</div>
									<div class="col-md-4">
										<span class="panel-note"></span>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- END MAIN CONTENT -->
			</div>
			<!-- END MAIN -->
			<div class="clearfix"></div>
			<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
		</div>
	</div>
	<!-- END WRAPPER -->
	<script>
		$("#cancel").on("click", function() {
			location.href = "/member/enterMyPage.member";
		});
	</script>

	<script>
		/*비번 일치불일치 코드*/
		let newpw = document.getElementById("newpw");
		let newpwck = document.getElementById("newpwck");

		document.getElementById("newpwck").oninput = function() {
			if (newpwck.value == document.getElementById("newpw").value) {
				ckpwmsg.innerHTML = "비번 일치";
				ckpwmsg.style.color = "blue";
			} else {
				ckpwmsg.innerHTML = "비번 일치x";
				ckpwmsg.style.color = "red";
			}
		}
	</script>
	<script>
	$('#formBox').submit(function() {
		let pw = document.getElementById("pw").value;
		console.log(pw);
		console.log(${dtos.password});
		if(pw!=${dtos.password}){
			alert("비밀번호를 잘못 입력하셨습니다. ");
			return false;
		}
	});
	</script>
</body>
</html>