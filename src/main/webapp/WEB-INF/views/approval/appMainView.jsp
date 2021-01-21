<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 메인</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<style type="text/css">
* {
	box-sizing: border-box;
	border: 1px solid black;
	margin: 0px;
	padding: 0px;
}

.wholecontainer {
	width: 1280px;
	height: 720px;
}

.right-side {
	width: 1020px;
	height: 720px;
	position: fixed;
	top: 0px;
	left: 260px;
}

.top-vacant {
	width: 1020px;
	height: 20px;
	background-color: yellow;
}

.page-name {
	width: 510px;
	height: 50px;
	float: left;
}

.infoContainer {
	border: 1px solid black;
	width: 100%;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="wholecontainer">
		<div class="left-side"><jsp:include
				page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<div class="right-side">
			<div class="top-vacant"></div>
			<div class="row">
				<div class="page-name col-6">
					<h1>전자결재</h1>
				</div>
				<div class="col-6">
					<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
				</div>
			</div>
			<div class="maincontainer">
					<div class="row">
						<div class="col-12 col-md-3">
							<h5>결재할 문서함</h5>
							<div class="infoContainer">미결재 / 결재완료 -> 그래프 등으로 표현하면 좋을 듯</div>
						</div>
						<div class="col-12 col-md-3">
							<h5>개인 문서함</h5>
							<div class="infoContainer">상신문서 반려문서 임시저장 결재완료 상신취소</div>
						</div>
						<div class="col-12 col-md-3">
							<h5>협조 문서함</h5>
							<div class="infoContainer">미결재 결재완료 -> 그래프</div>
						</div>
						<div class="col-12 col-md-3">
							<h5>부서/참조 수신함</h5>
							<div class="infoContainer">부서수신함 참조수신함</div>
						</div>
					</div>
					<div class="row accordion"></div>

					<div class="row">
						<div class="col-12">
							<p class="h6">결재할 문서함 > 미결재 문서</p>
						</div>
						<div class="col-12">문서번호 기안일자 문서명 기안자 나의결재 [상태] 다음결재자 [의견]</div>
					</div>
					<div class="row">
						<div class="col-12">
							<p class="h6">개인 문서함 > 상신 문서</p>
						</div>
						<div class="col-12">문서번호 기안일자 문서명 [상태] [의견]</div>
					</div>
					<div class="row">
						<div class="col-12">
							<p class="h6">협조 문서함 > 미결재 문서</p>
						</div>
						<div class="col-12">문서번호 기안일자 문서명 기안자 나의결재 [상태] 다음결재자 [의견]</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>