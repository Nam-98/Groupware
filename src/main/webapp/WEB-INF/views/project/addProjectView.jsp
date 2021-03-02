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

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/assets/img/favicon.png">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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

.button-box {
	text-align: center;
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
					<h3 class="page-title">프로젝트</h3>					
					<div class="alert alert-warning alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>Notice!</strong><br>
						<span class="glyphicon glyphicon-ok"
							aria-hidden="true"></span> <span class="sr-only">Check:</span>&nbsp
						프로젝트 생성 시, 5개의 칸반이 생성됩니다.<br>
						<span class="glyphicon glyphicon-ok"
							aria-hidden="true"></span> <span class="sr-only">Check:</span>&nbsp
						프로젝트 수정이 불가하니, 신중한 생성 부탁드립니다.
					</div>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">프 로 젝 트 추 가</h3>
						</div>
						<div class="panel-body">
							<form action="/project/addProjectProc.project" method="post" id="formBox" >
								<div class="col-lg-12 col-12">
									<table class="table table-sm">
										<tbody>
											<tr>
												<th scope="row">프로젝트명</th>
												<td><input type="text" class="textSpace" required id="pro_title" name=pro_title
													placeholder="Enter project-title"></td>
											</tr>
											<tr>
												<th scope="row">담 당 자(PM)</th>
												<td><input type="text" class="textSpace" required id="projectManagerName" placeholder="name" readonly>
													<input type="text" class="textSpace" required  id="pro_id" name=pro_id placeholder="Enter project-manager ID" readonly>
													<button type="button" id="find">찾기</button></td>
											</tr>
											<tr>
												<th scope="row">일 자</th>
												<td><input type="date" name="pro_start_date_str" required  id="date3" size="12" />&nbsp~&nbsp
												<input type="date" name="pro_end_date_str" required  id="date2" size="12" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							
							<div class="button-box">
								<!-- <input type="submit" id="addsubmit" class="btn btn-primary" value="등록">&nbsp -->
								<input type="button" id="addsubmit" class="btn btn-primary" value="등록">
								<button type="button" id="addCancel" class="btn btn-secondary">취소</button>
							</div>
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
</body>
<script>
	$("#addCancel").on("click", function() {
		location.href = "/project/enterProjectList.project?cpage=1";
	});
</script>
<script>
$("#find").on("click", function() {
	var options='top=10, left=10, width=1000, height=700, status=no, menubar=no, toolbar=no, resizable=no';
	window.open("/project/enterPopup.project","popup",options);	
});

function getReturnValue(returnValue) {
	obj = JSON.parse(returnValue);
	  document.getElementById("projectManagerName").value=obj.key1;	
 	  document.getElementById("pro_id").value=obj.key2;
	}
</script>
<script>
$("#date2").change(function(){
var start_date=document.getElementById("date3").value;
var end_date=document.getElementById("date2").value;

if(end_date <= start_date){
	alert("종료일자를 재설정해주세요.");
	document.getElementById("date2").value='';
}
});

$("#addsubmit").on("click",function(){
	if($("#projectManagerName").val()==""){
		console.log("빈값");
		alert("담당자를 선택해 주세요");
		return;
	}
	$("#formBox").submit();
})
</script>
</html>