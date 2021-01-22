<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>쪽지 보내기</title>
    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<style>
	*{/* border: 1px solid black; */ 
        box-sizing: border-box;       
         margin: 0;	
	}
	
	.wholecontainer{
       
		width: 1280px;
		height:720px;
	}
	.left-side{
		
		width: 255px;
		height: 720px;
		float: left;
	}
	
	.right-side{
		width: 1020px;
		height: 720px;
		float: left;
	}
	.top-vacant{
		width: 1020px;
		height: 20px;
	}
	.page-name{
		width: 100%;;
		height: 50px;
		float : left;
	}
    .maincontainer{
        width: 100%;
        height: 700px;
    }
    .orgTree{
        width: 20%;
        height: 650px;
        float: left;
    }
    .orgInfo{
        width: 80%;
        height: 650px;
        float: left;
    }
    
    /* Remove default bullets */
ul, #myUL1 {
	list-style-type: none;
}

/* Remove margins and padding from the parent ul */
#myUL1 {
	
    margin: 0;
	padding: 0;
	position: fixed;
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
</style>
<body>
	<div class ="wholecontainer">
		<div class = "left-side">
		<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<div class = "right-side">
			<div class = "top-vacant">
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			</div>
			
			<div class ="maincontainer">
			<div class = "top-vacant"></div>
			<div class = "top-vacant"></div>
			<div class = "top-vacant"></div>
			    <div class="orgTree">
			        <ul id="myUL1">
			<c:forEach items="${dlist }" var="i">			
			<li><span class="caret1">${i.dept_name}</span>
				
				<ul class="nested1">
				<c:forEach items="${mlist }" var="j">
				<c:if test="${j.dept_code == i.dept_code }">				
					<li><a href="/message/msgMemInfo.message?id=${j.id}">${j.name }</a></li>
				</c:if>
				</c:forEach>								
				</ul>
				
				</li>	
						
			</c:forEach>				
			</ul>
			    </div>
			    <div class="orgInfo">
			    	<h3 style="text-align: left;">쪽지 쓰기</h3><br>

<div style="width: 80%;">
	<form method="post" action="/board/insertBoard.board">
		<input type="text" name="dept" style="width: 90%;" value="부서 : ${dto.dept_name}"readonly/><br><br>
		<input type="text" name="receiver" style="width: 90%;" value="받는 사람 : ${dto.name}" readonly/>
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
		<input id="subBtn" type="button" value="작성 완료" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
			    </div>
			</div>
		</div>
	</div>
</body>
<script>
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
<script>
function goWrite(frm) {
	var title = frm.title.value;
	var writer = frm.writer.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (writer.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
</html>