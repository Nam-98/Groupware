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
				<div class="row">
					<div class="col-3">
							<div class="input-group mb-3">
								<label class="input-group-text" for="inputGroupSelect01">문서종류</label>
								<select class="form-select" id="docsType" name="app_type_code">
									<c:forEach items="${docsType}" var="dto">
										<option value="${dto.app_type_code}">${dto.app_type_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					<div class="col-3">
						<div class="input-group mb-3">
								
							<input type="text" class="form-control" value="${writer}" readonly>
						</div>
					</div>
					<div class="col-6">결재라인</div>
				</div>
				<div class="row">
					<div class="col-3">
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect01">보존기간</label>
							<select class="form-select" id="inputGroupSelect01"
								name="app_archive">
								<option value="1">1년</option>
								<option value="2">2년</option>
								<option value="3">3년</option>
								<option value="5">5년</option>
								<option value="10">10년</option>
							</select>
						</div>
					</div>
					<div class="col-3">기안일<br>sysdate</div>
					<div class="col-6">참조라인</div>
				</div>
				<div class="row">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="title"	placeholder="제목"> 
							<label for="title">제목</label>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<textarea id="summernote" name="contents"></textarea>
					<br> https://okky.kr/article/519068?note=1554650
					</div>
				</div>
			</div>
		</div>
	</div>
	  <script>
    $(document).ready(function() {
    	//여기 아래 부분
    	$('#summernote').summernote({
    		  height: 350,                 // 에디터 높이
    		  minHeight: null,             // 최소 높이
    		  maxHeight: null,             // 최대 높이
    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
    		  lang: "ko-KR",					// 한글 설정
    		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
              
    	});    });
  </script>
</body>
</html>