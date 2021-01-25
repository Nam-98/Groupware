<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<style>
* {
	box-sizing: border-box;
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

.maincontainer {
	margin-top: 80px;
}
</style>

<title>글쓰기</title>

<script>
	$(document)
			.ready(
					function() {
						//여기 아래 부분
						$('#summernote')
								.summernote(
										{
											height : 300, // 에디터 높이
											minHeight : 500, // 최소 높이
											maxHeight : null, // 최대 높이
											focus : true, // 에디터 로딩후 포커스를 맞출지 여부
											lang : "ko-KR", // 한글 설정
											toolbar : [
													// [groupName, [list of button]]
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'insert',
															[ 'picture',
																	'link',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋음체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]
										});
					});
</script>


</head>
<body>
	<div class="container container-figure">
		<div class="left-side"><jsp:include
				page="/WEB-INF/views/commonPage/left.jsp" /></div>
		<div class="right-side">
			<div class="top-vacant"></div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
		</div>
	</div>

	<div class="maincontainer">
		<div style="width: 50%; margin-left: 300px;">
			<form action="/write/insertBoardWrite.write" method="post">
				제목 : <input type="text" name="write_title" style="width: 40%;" placeholder="제목을 입력하세요."/><br><br>
				작성자 : <input type="text" name="write_id" style="width: 20%;" value="${id}" readonly/> <br><br>
				<textarea id="summernote" name="write_content"></textarea>
				<input id="subBtn" type="button" value="작성 완료" style="float: right;" onclick="goWrite(this.form)" /> 
				<input id="delBtn" type="button" value="작성 취소" style="float: right;">
			</form>
		</div>
	</div>

	<script>
		document.getElementById("delBtn").onclick = function() {
			location.href = "/write/boardList.write?cpage=1";
		}
	</script>

	<script>
		function goWrite(frm) {
			var write_title = frm.write_title.value;
			var write_id = frm.write_id.value;
			var write_content = frm.write_content.value;

			if (write_title.trim() == '') {
				alert("제목을 입력해주세요");
				return false;
			}
			if (write_id.trim() == '') {
				alert("작성자를 입력해주세요");
				return false;
			}
			if (write_content.trim() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			frm.submit();
		}
	</script>
</body>
</html>