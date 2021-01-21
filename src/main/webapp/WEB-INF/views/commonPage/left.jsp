<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.leftcontainer {
	width: 260px;
	height: 720px;

}
.left-logo{
	width: 260px;
	height: 70px;
	background-color : black;
}
/* Remove default bullets */
ul, #myUL {
	list-style-type: none;
}

/* Remove margins and padding from the parent ul */
#myUL {
	margin: 0;
	padding: 0;
	position: fixed;
	 top: 70px;
    left: 0;
	
}

/* Style the caret/arrow */
.caret {
	cursor: pointer;
	user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret::before {
	content: "\25B6";
	color: black;
	display: inline-block;
	margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down::before {
	transform: rotate(90deg);
}

/* Hide the nested list */
.nested {
	display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active {
	display: block;
}
</style>
</head>
<body>
	<div class="leftcontainer">
		<div class="left-logo">
		</div>
		<ul id="myUL">
			<li><span class="caret">전자결재</span>
				<ul class="nested">
					<li>결재서류작성</li>
					<li><span class="caret">결재문서함</span>
						<ul class="nested">
							<li>개인문서함</li>
							<li>협조문서함</li>
							<li>참조문서함</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">쪽지함</span>
				<ul class="nested">
					<li>쪽지보내기(조직도검색)</li>
					<li><span class="caret">보관함</span>
						<ul class="nested">
							<li>수신함</li>
							<li>발신함</li>
							<li>보관함</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">일정관리</span>
				<ul class="nested">
					<li>일정추가하기</li>
					<li><span class="caret">일정보기</span>
						<ul class="nested">
							<li>일간일정</li>
							<li>주간일정</li>
							<li>월간일정</li>
							<li>연간일정</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">출퇴근/근태관리</span>
				<ul class="nested">
					<li>출퇴근체크</li>
					<li>나의근태내역</li>
					<li>근태조정신청</li>
					<li>근태조정내역</li>
				</ul></li>
			<li><span class="caret">조직도</span></li>
			<li><span class="caret">프로젝트관리</span>
				<ul class="nested">
					<li>프로젝트추가</li>
					<li>프로젝트보기</li>
				</ul></li>
			<li><span class="caret">커뮤니티</span>
				<ul class="nested">
					<li>회사소개</li>
					<li><span class="caret">공지사항</span>
						<ul class="nested">
							<li>회사공지사항</li>
							<li>시스템공지사항</li>
						</ul></li>
					<li><span class="caret">게시판</span>
						<ul class="nested">
							<li>회사게시판</li>
							<li>갤러리게시판</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">마이페이지</span>
				<ul class="nested">
					<li>개인정보수정</li>
				</ul></li>
		</ul>
	</div>
</body>
<script>
var toggler = document.getElementsByClassName("caret");
var i;

for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested").classList.toggle("active");
    this.classList.toggle("caret-down");
  });
}
</script>
</html>