<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 체크</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
				<h1>출퇴근 체크</h1>
			</div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class="maincontainer row">
				<div class="top-vacant d-none d-lg-block"></div>
				<div class="col-lg-12 col-12">
					<span id="currentTimeSpan"></span>
					<div class="">
						${attendanceValue.status }
						${attendanceValue.hour }
						${attendanceValue.minute }
					</div>
					<div class="">
						${leaveWorkValue.status }
						${leaveWorkValue.hour }
						${leaveWorkValue.minute }
					</div>
					<input type="button" value="출근하기" id="attendanceBtn"> 
					<input type="button" value="퇴근하기" id="leaveWorkBtn">
				</div>
			</div>



		</div>
	</div>

	<script>
		// 출근버튼클릭
		$("#attendanceBtn").on("click", function() {
			location.href = "/tna/attendanceInput.tna";
		})
		
		// 퇴근버튼클릭
		$("#leaveWorkBtn").on("click", function() {
			location.href = "/tna/leaveWorkInput.tna";
		})
		
		function printTime() {
			var clock = document.getElementById("currentTimeSpan");
			var now = new Date();
			var nowTime = now.getFullYear() + "년 " + now.getMonth()+1 + "월 " + now.getDate() + "일 " + now.getHours() + ":"  + now.getMinutes() + ":" + now.getSeconds() + "";
			clock.innerHTML = nowTime;
			setTimeout("printTime()",1000);
		}
		window.onload = function() {
			printTime();
		}
	</script>
</body>
</html>