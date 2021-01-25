<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pdto.pro_title}</title>
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
/* 	background-color: yellow; */
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
				<h1>My Project : ${pdto.pro_title}</h1>
			</div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class="maincontainer row">
				<div class="top-vacant d-none d-lg-block"></div>
				<div>
					<button type="button" id="gokanban" class="btn btn-success">칸반보드</button>
					<button type="button" id="deletepro" class="btn btn-secondary">삭제</button>
				</div>
				<div class="top-vacant d-none d-lg-block"></div>
				<div class="col-lg-12 col-12">
					<div class="card">
						<div class="card-header">
							<h5>프 로 젝 트 정 보</h5>
						</div>
						<div class="card-body">
							<table class="table table-sm">
								<thead>
									<tr class="table-secondary">
										<th scope="col">항 목</th>
										<th scope="col">내 용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">프로젝트명</th>
										<td>${pdto.pro_title}</td>
									</tr>
									<tr>
										<th scope="row">담 당 자(PM)</th>
										<td>${pdto.pro_id}</td>
									</tr>
									<tr>
										<th scope="row">일 자 (전체 : ${proTerm} 일)</th>
										<td>${pdto.pro_start_date}~${pdto.pro_end_date}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="top-vacant d-none d-lg-block"></div>
				<div class="col-lg-12 col-12">
					<div class="card">
						<div class="card-header">
							<h5>프 로 젝 트 전 체 진 행 률</h5>
						</div>
						<div class="card-body">

							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
											aria-expanded="false" aria-controls="flush-collapseOne">
											시간경과율</button>
									</h2>
									<div id="flush-collapseOne" class="accordion-collapse collapse"
										aria-labelledby="flush-headingOne"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<div class="progress">
												<div
													class="progress-bar progress-bar-striped progress-bar-animated"
													role="progressbar" aria-valuenow="${timeRate}" aria-valuemin="0"
													aria-valuemax="100" style="width: ${timeRate}%"></div>
											</div>
											<br>
											시간 경과율 : ${timeRate}
											<br>
											시간 경과율 : {(프로젝트 마감일-오늘) / (프로젝트 전체 기간)} * 100
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingTwo">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
											aria-expanded="false" aria-controls="flush-collapseTwo">
											프로젝트진행률</button>
									</h2>
									<div id="flush-collapseTwo" class="accordion-collapse collapse"
										aria-labelledby="flush-headingTwo"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
										<div class="progress">
												<div
													class="progress-bar progress-bar-striped progress-bar-animated"
													role="progressbar" aria-valuenow="${projectRate}" aria-valuemin="0"
													aria-valuemax="100" style="width: ${projectRate}%"></div>
											</div>
											<br>
											전체 진행률 : ${projectRate}
											<br>
											전체 진행률 : {(완료kanban)+0.5*(진행중kanban) / (전체kanban-중지kanban)} * 100
											<br>
											진행상태없음 : ${list.get(0)}<br>
											시작 전 : ${list.get(1)}<br>
											진행 중 : ${list.get(2)}<br>
											완   료 : ${list.get(3)}<br>
											중   지 : ${list.get(4)}<br>
										</div>
									</div>
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
$("#gokanban").on("click", function() {
	alert("미구현");
});
$("#deletepro").on("click", function() {
	alert("미구현");
});
</script>

</html>