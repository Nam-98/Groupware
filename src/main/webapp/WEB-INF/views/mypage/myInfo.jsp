<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보관리</title>
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
	/* 	border: 1px solid black; */
	margin: 0px;
	padding: 0px;
}

.wholecontainer {
	width: 1280px;
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
/*  	background-color: yellow;  */
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
				<h1>My page</h1>
			</div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class="maincontainer row">
				<div class="top-vacant d-none d-lg-block"></div>

				<div
					class="alert alert-danger alert-dismissible fade show col-6 d-none d-lg-block"
					role="alert">
					<strong>주의사항!</strong> 개인정보수정은 관리자에게 문의바랍니다!!!
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<div class="top-vacant d-none d-lg-block"></div>
				<div class="col-lg-2 col-12">
					<div class="bodyContents loginInfo">
						<div class="top-vacant d-none d-lg-block"></div>
						<div class="top-vacant d-none d-lg-block"></div>
						<div class="top-vacant d-none d-lg-block"></div>
						<div class="profilBox d-none d-lg-block">
							<img class="profileImg img-thumbnail" alt="${id}"
								src="/resources/profileImage/${id}.png">
							<div class=" m-2">
								<div class="m-2">${sessionScope.id}${dto.position_name}님</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-10 col-12">
					<div class="bodyContents">
						<div class="row">
							<div class="col-lg-10 d-none d-lg-block"></div>
							<div class="col-lg-2 col-12">
								<button type="button" id="askFix" class="btn btn-warning">수정 요청</button>
							</div>
						</div>
						<div class="top-vacant d-none d-lg-block"></div>
						<div class="card">
							<div class="card-header">
								<h5>개 인 정 보</h5>
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
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$("#askFix").on("click", function() {
		alert("미구현");
	});
</script>

</html>