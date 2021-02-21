<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.pro_kb_title}</title>
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
.top-vacant {
	width: 100%;
	height: 20px;
	/* 	background-color: yellow; */
}

textarea {
	resize: none;
}

.main {
	padding-top: 0px;
}

#fixkanbanBtn {
	margin-left: 300px;
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
							<h3 class="panel-title">
								칸 반 보 기
							</h3>
							<div class="right">
								<input type="button" id="deleteKanban" class="btn btn-sm btn-danger" value="삭제">
								<input type="button" id="cancelKanban" class="btn btn-sm btn-info" value="취소">
							</div>
						</div>
						<div class="panel-body">
						<form action="/project/fixKanbanInfo.project" method="post">
									<input type="text" name="pro_kb_title"
									value="${dto.pro_kb_title}"
									style="width: 100%; height: 50px; font-size: 30px; font-weight: bold;"><hr>
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">항목</th>
										<th scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">#</th>
										<td><input type="text" class="textSpace"
											value="${dto.pro_kb_seq}" style="width: 10%;" required
											name="pro_kb_seq" readonly></td>
									</tr>
									<tr>
										<th scope="row">프로젝트</th>
										<td>${dto.pro_seq}</td>
									</tr>
									<tr>
										<th scope="row">진행상태</th>
										<td>${dto.pro_kb_process_code}</td>
									</tr>
									<tr>
										<th scope="row">담당자(ID)</th>
										<td>변경 전 : ${dto.pro_kb_manager}<br> 변경 후 : <input
											type="text" class="textSpace" required
											id="projectManagerName" placeholder="name" readonly>
											<input type="text" class="textSpace" required
											id="pro_kb_manager" name="pro_kb_manager" placeholder="ID"
											readonly> <input type="button" id="find" value="찾기">
										</td>
									</tr>
									<tr>
										<th scope="row">상세정보</th>
										<td><textArea name="pro_kb_details"
												style="width: 100%; height: 70px;">${dto.pro_kb_details}</textArea></td>
									</tr>
								</tbody>
							</table>
							<input id="fixkanbanBtn" type="submit" class="btn btn-primary"
								value="수정">
						</form>
						</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
</body>
<script>
	$("#find")
			.on(
					"click",
					function() {
						var options = 'top=10, left=10, width=1000, height=700, status=no, menubar=no, toolbar=no, resizable=no';
						window.open("/project/enterPopup.project", "popup2",
								options);
					});

	function getReturnValue(returnValue) {
		obj = JSON.parse(returnValue);
		document.getElementById("projectManagerName").value = obj.key1;
		document.getElementById("pro_kb_manager").value = obj.key2;
	}
</script>
<script>
	$("#deleteKanban")
			.on(
					"click",
					function() {
						location.href = "/project/deleteKanban.project?pro_kb_seq=${dto.pro_kb_seq}";
					});
	$("#cancelKanban").on("click", function() {
		window.close();
	});
</script>
</html>