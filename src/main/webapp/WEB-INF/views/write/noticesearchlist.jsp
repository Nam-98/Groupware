<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
/*         div{ */
/*             border: 1px solid black; */
/*         } */
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

table {
	text-align: center;
}

.navi {
	text-align: center;
}
</style>
</head>

<body>
	<div class="container container-figure">
		<div class="left-side"><jsp:include
				page="/WEB-INF/views/commonPage/left.jsp" /></div>
		<div class="right-side">
			<div class="top-vacant"></div>
			<div class="page-name">
				<h1>공지사항</h1>
			</div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class="maincontainer">
			<form action="noticeSearch.write?cpage=1" method="post">
				<table>
					<tr>
						<td>
						<select id="condition" name="condition">
							<option value="">검색조건</option>
							<option value="">전체보기</option>
							<option value="write_title">제목</option>
							<option value="write_id">작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요">
						<button id="searchBtn" type="submit">검색</button>
						</td>
					</tr>
				</table>
			 </form>

				<table class="table table-secondary table-striped">
					<thead class="table-light">
						<tr>
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${list }">
							<tr>
								<th scope="row">${i.write_seq }</th>
								<td><a href="noticeView.write?write_seq=${i.write_seq}">${i.write_title }</a></td>
								<td>${i.write_id }</td>
								<td>${i.write_reg_date }</td>
								<td>${i.write_read_count }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="navi">${navi }</div>
			</div>
		</div>
	</div>
</body>

</html>