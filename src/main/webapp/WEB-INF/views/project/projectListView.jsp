<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트보기</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
	border: 1px solid black;
	margin: 0px;
	padding: 0px;
}

.wholecontainer {
	width: 1280px;
	height: 1080px;
}

.left-side {
	width: 260px;
	height: 1080px;
}

.right-side {
	width: 1020px;
	position: fixed;
	top: 0px;
	left: 260px;
}

.top-vacant {
	width: 100%;
	height: 20px;
	background-color: yellow;
}

.page-name {
	width: 510px;
	height: 50px;
	float: left;
}

.maincontainer {
	width: 1020px;
}
</style>
<body>
	<div class="wholecontainer">
		<div class="left-side"><jsp:include
				page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<div class="right-side">
			<div class="top-vacant d-none d-lg-block"></div>
			<div class="page-name">
				<h1>My project</h1>
			</div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class="maincontainer row">
				<div class="top-vacant d-none d-lg-block"></div>

							<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
								<div class="container-fluid">
									<a class="navbar-brand" href="#">Navbar</a>
									<button class="navbar-toggler" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#navbarNavDarkDropdown"
										aria-controls="navbarNavDarkDropdown" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>
									<div class="collapse navbar-collapse"
										id="navbarNavDarkDropdown">
										<ul class="navbar-nav">
											<li class="nav-item dropdown"><a
												class="nav-link dropdown-toggle" href="#"
												id="navbarDarkDropdownMenuLink" role="button"
												data-bs-toggle="dropdown" aria-expanded="false">
													Dropdown </a>
												<ul class="dropdown-menu dropdown-menu-dark"
													aria-labelledby="navbarDarkDropdownMenuLink">
													<li><a class="dropdown-item" href="#">Action</a></li>
													<li><a class="dropdown-item" href="#">Another
															action</a></li>
													<li><a class="dropdown-item" href="#">Something
															else here</a></li>
												</ul></li>
										</ul>
										<button type="button" id="askFix" class="btn btn-warning">추가</button>
									</div>
								</div>
							</nav>
				<div class="top-vacant d-none d-lg-block"></div>
				<div class="maincontainer row">
					<div class="col-lg-12 col-12">
						<div class="bodyContents">
							<div class="top-vacant d-none d-lg-block"></div>
							<div class="card">
								<div class="card-header">
									<h5>사 원 정 보</h5>
								</div>
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
												<td>${dto.break_use_count}일/${dto.break_total_count}일</td>
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
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$("#askFix").on("click", function() {
		alert("미구현");
	});
</script>

</html>