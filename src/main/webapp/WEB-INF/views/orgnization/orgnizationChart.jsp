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
					<h3 class="page-title">조직도</h3>
					<div class ="maincontainer">
			    <div class="orgTree" id='jqxTree'>
							<ul>
								<c:forEach items="${dlist}" var="i">
									<li item-expanded='true'>${i.dept_name}
										<ul>
											<c:forEach items="${mlist}" var="j">
												<c:if test="${j.dept_code == i.dept_code}">
													<li class="memberList" id="${j.name}"><a
														href="/member/orgMemInfo.member?id=${j.id}">${j.name}</a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</div>
			    <div class="orgInfo">
			    
			    	<div class="panel panel-headline demo-icons">	
			    	
			    	<div class="panel-heading">
								<h3 class="panel-title">개 인 정 보</h3>
							</div>
			    	<div class="panel-body">		
				<div class="col-lg-2 col-12">
					<div class="bodyContents loginInfo">
						
						<div class="top-vacant d-none d-lg-block"></div>
						<div class="top-vacant d-none d-lg-block"></div>						
						<div class="profilBox d-none d-lg-block">
							<img class="profileImg img-thumbnail" alt="${dto.id}"
								src="/resources/profileImage/${dto.id}.png">
							
						</div>
					</div>
				</div>
				<div class="col-lg-10 col-12">
					<div class="bodyContents">
						<div class="row">
							<div class="col-lg-10 d-none d-lg-block"></div>
							<div class="col-lg-2 col-12">
								<button type="button" id="askFix" class="btn btn-warning">쪽지 보내기</button>
							</div>
						</div>																	
								<div class="top-vacant d-none d-lg-block"></div>				
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
				
				<div class="maincontainer row">
					<div class="col-lg-12 col-12">
						<div class="bodyContents">
							
							<div class="panel panel-headline demo-icons">
								<div class="panel-heading">
									<h3 class="panel-title">사 원 정 보</h3>
								</div>
								<div class="panel-body">
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
												<th scope="row">휴 가 일 수</th>
												<td>${dto.break_use_count}일/${dto.break_total_count} 일</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
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
<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
	</div>
	<!-- END WRAPPER -->

<script>
	document.getElementById("askFix").onclick = function(){
		location.href = "/message/orgSendMessage.message?msg_receiver=${dto.id}&msg_receiver_name=${dto.dept_name}  ${dto.name}"
	}
</script>
</body>
</html>