<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트추가</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
</head>
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
	position: absolute;
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
				<h1>프로젝트추가</h1>
			</div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class="maincontainer row">
				<div class="top-vacant d-none d-lg-block"></div>
				<div class="dropdown">
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> Dropdown link </a>

					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul>
					<button type="button" id="addProject" class="btn btn-warning">추가</button>
				</div>
				<div class="top-vacant d-none d-lg-block"></div>
				<div class="col-lg-12 col-12">
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
								<th scope="row">프로젝트명</th>
								<td><input type="text" class="textSpace" required id="pro_title" name=pro_title
									placeholder="프로젝트명을 입력해주세요."></td>
								<th scope="row">담 당 자(PM)</th>
								<td><input type="text" class="textSpace" required id="pro_id" name=pro_id></td>
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
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$("#askFix").on("click", function() {
		alert("미구현");
	});
</script>

</html>