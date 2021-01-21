<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
	/*border: 1px solid black;*/
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
	position: absolute;
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
#signList{width:100%;}
    /* Remove default bullets */
ul, #myUL1 {
	list-style-type: none;
}

/* Remove margins and padding from the parent ul */
#myUL1 {
	
    margin: 0;
	padding: 0;
    width: 200px;
    height: 100%;
}

/* Style the caret/arrow */
.caret1 {
	cursor: pointer;
	user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret1::before {
	content: "\25B6";
	color: black;
	display: inline-block;
	margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down1::before {
	transform: rotate(90deg);
}

/* Hide the nested list */
.nested1 {
	display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active1 {
	display: block;
}
#orgTree{
	display: block; 
}
</style>
</head>
<body>
	<div class="wholecontainer">
		<div class="left-side">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<div class="right-side">
			<div class="top-vacant"></div>
			<div class="row">
				<div class="page-name col-6">
					<h3>전자결재 작성</h3>
				</div>
				<div class="col-6">
					<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
				</div>
			</div>
			<div class="maincontainer">
			<form action="/approval/writeApproval.approval" method="post">
				<table class="table">
					<thead>
						<tr>
							<th scope="row" class="align-middle">문서종류</th>
							<td  colspan="3">
								<select class="form-select" id="docsType" name="app_type_code">
									<c:forEach items="${docsType}" var="dto">
										<option value="${dto.app_type_code}">${dto.app_type_name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">보존기간</th>
							<td>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="1">
								 	<label class="form-check-label" for="inlineRadio1">1년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="2">
								 	<label class="form-check-label" for="inlineRadio1">2년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="3">
								 	<label class="form-check-label" for="inlineRadio1">3년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="5">
								 	<label class="form-check-label" for="inlineRadio1">5년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="10">
								 	<label class="form-check-label" for="inlineRadio1">10년</label>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="align-middle">
								<button type=button id="addSign" class="btn btn-outline-dark" data-bs-toggle="tooltip" data-bs-placement="right" title="결재자를 추가하려면 이 버튼을 누르세요">결재자</button>
							</th>
							<td>
								<table id="signList" class="table table-Light align-middle">
									<thead>
											<tr>
												<th scope="col">결재 순서</th>
												<th scope="col">이름</th>
												<th scope="col">직급</th>
												<th scope="col">부서</th>
												<th scope="col">결재구분</th>
												<th scope="col">삭제</th>
											</tr>
										</thead>
										<tbody id="signBody">
											<tr class="signRow">
												<td scope="row">
													1
												</td>
												<td>
													1
												</td>
												<td>
													1
												</td>
												<td>
													1
												</td>
												<td>
													1
												</td>
												<td>
													<button type="button" class="btn btn-danger perSignDel">삭제</button>													
												</td>
											</tr>
										</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<th scope="row" class="align-middle">첨부파일</th>
							<td>
								<div class="fileContainer">
								
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="form-control" id="title"	placeholder="제목" name="app_title"></td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea id="summernote" name="contents"></textarea>
								<br> https://okky.kr/article/519068?note=1554650
							</td>
						</tr>
					</thead>
				</table>
			</form>
			</div>
		</div>
	</div>


	<!-- 결재자 선택 modal창 -->
	<div class="modal selectSign" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">결재자 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class=""></div>
					조직도
					<div class="orgTree">
						<ul id="myUL1">
							<c:forEach items="${dlist }" var="i">
								<li><span class="caret1">${i.dept_name}</span>
									<ul class="nested1">
										<c:forEach items="${mlist }" var="j">
											<c:if test="${j.dept_code == i.dept_code }">
												<li><a href="/member/orgMemInfo.member?id=${j.id}">${j.name }</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
					검색
				
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary footClose" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
			});
		});

		//결재라인 관련 스크립트
		////모달창 열기
		$("#addSign").on("click", function() {
			console.log("addSign클릭")
			$(".selectSign").show();
		})
		////모달창 닫기
		$(".btn-close").on("click", function() {
			$(".selectSign").hide();
		})
		$(".footClose").on("click", function() {
			$(".selectSign").hide();
		})
		////삭제
		$("#signList").on("click", ".perSignDel", function() {
			if ($(".signRow").length > 1) {
				$(this).closest(".signRow").remove();
			} else {
				alert("결재자는 1명 이상이어야 합니다.");
			}
		})
		////모달창 내부 조직도 관련 script

		var toggler = document.getElementsByClassName("caret1");
		var i;

		for (i = 0; i < toggler.length; i++) {
			console.log(toggler.length);
			toggler[i].addEventListener("click", function() {
				this.parentElement.querySelector(".nested1").classList.toggle("active1");
				this.classList.toggle("caret-down1");
			});
		}
	</script>
</body>
</html>