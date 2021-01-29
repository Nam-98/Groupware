<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당자(ID) 검색</title>
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
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- jqxtree  -->
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript"
	src="/resources/lib/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxpanel.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxtree.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// Create jqxTree
		$('#jqxTree').jqxTree({
			height : '500px',
			width : '120px'
		});
		$('#jqxTree').bind('select', function(event) {
			var htmlElement = event.args.element;
			var item = $('#jqxTree').jqxTree('getItem', htmlElement);
		});
	});
</script>
</head>
<style>
.top-vacant {
	width: 100%;
	height: 20px;
	/* 	background-color: yellow; */
}

.panel-body {
	text-align: center;
}

.orgTree {
	width: 20%;
	float: left;
}

.orgInfo {
	margin-left: 20px; padding-left : 20px;
	width: 80%;
	float: left;
	padding-left: 20px;
}

.table table-sm {
	width: 100%;
}

li>a {
	color: black;
	text-decoration: none;
}

.profilBox>img {
	width: 100%;
	height: 100%;
}

.profilBox {
	width: 130px;
	height: 200px;
	text-align: center;
}

.demo-icons li {
	margin-bottom: 0px;
	text-align: left;
}
</style>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<div class="panel panel-headline demo-icons">
					<div class="panel-heading">
						<h3 class="panel-title">담당자(ID) 검색</h3>
					</div>
					<div class="panel-body">
						<input type="text" id="pmName" readonly value="${dto.name}"><input
							type="text" id="pmId" readonly value="${dto.id}">
						<button id="returnButton" class="btn btn-primary">선택</button>
					</div>
					<div class="panel-body">
						<h3>조직도</h3>
						<hr>
						<div class="orgTree" id='jqxTree'>
							<ul>
								<c:forEach items="${dlist}" var="i">
									<li item-expanded='true'>${i.dept_name}
										<ul>
											<c:forEach items="${mlist}" var="j">
												<c:if test="${j.dept_code == i.dept_code}">
													<li class="memberList" id="${j.name}"><a
														href="/member/orgProMemInfo.member?id=${j.id}">${j.name}</a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="orgInfo well">
							<div class="profilBox d-none d-lg-block">
								<img class="profileImg img-thumbnail" alt="${dto.id}"
									src="/resources/profileImage/${dto.id}.png">
							</div>
							<div class="top-vacant d-none d-lg-block"></div>
							<div class="bodyContents">
								<table class="table table-sm">
									<thead>
										<tr class="table-secondary">
											<th scope="col">항 목</th>
											<th scope="col">내 용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">이 름</th>
											<td>${dto.name}</td>
										</tr>
										<tr>
											<th scope="row">연 락 처</th>
											<td>${dto.contact}</td>
										</tr>
										<tr>
											<th scope="row">생 년 월 일</th>
											<td>${dto.birth}</td>
										</tr>
										<tr>
											<th scope="row">부 서</th>
											<td>${dto.dept_name}</td>
										</tr>
										<tr>
											<th scope="row">직 위</th>
											<td>${dto.position_name}</td>
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

<script>
	$('#returnButton').click(function() {
		var returnValueName = document.getElementById('pmName').value;
		var returnValueId = document.getElementById('pmId').value;
		var returnValue = {
			key1 : returnValueName,
			key2 : returnValueId
		};

		window.opener.getReturnValue(JSON.stringify(returnValue));
		window.close();
	});
</script>
</html>