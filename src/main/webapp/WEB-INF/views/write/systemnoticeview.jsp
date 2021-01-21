<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>시스템 공지사항</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!--    스타일시트-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<!--    자바스크립트-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>

<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid black;
}

table {
	border: 1px solid black;
}

.contents {
	padding: left;
	width: 500px;
	height: 500px;
}

.list{
    position: relative;
    left: 1210px;
}

</style>
</head>

<body>
	<div class="container">
		<div class="left-side"><jsp:include
				page="/WEB-INF/views/commonPage/left.jsp" /></div>
		<div class="right-side">
			<div class="top-vacant"></div>
			<div class="page-name">
				<h1>시스템 공지사항</h1>
			</div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class="maincontainer">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="col-7">제목 : ${dtos.write_title }</th>
							<th scope="col" class="col-2">작성자 : ${dtos.write_id }</th>
							<th scope="col" class="col-2">작성일 : ${dtos.write_reg_date }</th>
							<th scope="col" class="col-1">조회수 : ${dtos.write_read_count }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="contents" colspan="4">${dtos.write_contents }</td>
						</tr>

						<tr>
							<td>댓글 대댓글...ㅠㅠ</td>
						</tr>
					</tbody>
				</table>
				<button id="list" class="list">목록으로</button>
			</div>
		</div>
	</div>
	<script>
	document.getElementById("list").onclick=function(){
		location.href="/write/systemNoticeList.write?cpage=1"
	}
</script>
</body>
</html>