<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 쓰기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
   <!-- VENDOR CSS -->
   <!--<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">-->
   <link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
   <link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
   <!-- MAIN CSS -->
   <link rel="stylesheet" href="/assets/css/main.css">
   <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
   <link rel="stylesheet" href="/assets/css/demo.css">
   <!-- GOOGLE FONTS -->
   <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
   <!-- ICONS -->
   <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
    <script src="/assets/vendor/jquery/jquery.min.js"></script>
   <!--<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>-->
   <script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
   <script src="/assets/vendor/chartist/js/chartist.min.js"></script>
   <script src="/assets/scripts/klorofil-common.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<style>
	*{border: 0px solid black;
        box-sizing: border-box;       
         margin: 0;	
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
    
    li>a{
    	color: black;
   text-decoration: none;
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
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp"/>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp"/>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">쪽지 보내기</h3>
					<div class ="maincontainer">
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
	<form method="post" enctype="multipart/form-data" action="/message/msgProc.message?msg_receiver=${dto.id }">
		<div>
		받는 사람 : <input type="text" name="msg_receiver_name" style="width: 90%;" value="${dto.dept_name}  ${dto.name} " readonly/></div><br>
		<div>
		보낸 사람 : <input type="text" name="msg_sender_name" style="width: 90%;" value="${myInfo.DEPT_NAME}  ${myInfo.NAME} " readonly/></div>
		<br>
		<div>
		제목 : <input type="text" placeholder="제목을 입력하시오." name="msg_title" style="width: 93%;"/></div>
		<br>
		<textarea id="summernote" name="msg_contents" placeholder="내용을 입력하시오."></textarea>
		
		<div class="input-group" style="width: 100%;">
  		<input type="file" class="form-control" name="attfiles" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" style="width: 100%;"> 
		</div>
		
		<input id="subBtn" class="btn btn-primary" type="submit" value="보내기" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
			    </div>
			</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme I Need</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<script>
$(document).ready(function() {
    //여기 아래 부분
    $('#summernote').summernote({
       height : 300, // 에디터 높이
       minHeight : 300, // 최소 높이
       maxHeight : null, // 최대 높이
       focus : true, // 에디터 로딩후 포커스를 맞출지 여부
       lang : "ko-KR", // 한글 설정
       toolbar: [
              // [groupName, [list of button]]
              ['fontname', ['fontname']],
              ['fontsize', ['fontsize']],
              ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
              ['color', ['forecolor','color']],
              ['table', ['table']],
              ['para', ['ul', 'ol', 'paragraph']],
              ['height', ['height']],
              ['insert',['picture','link','video']],
              ['view', ['fullscreen', 'help']]
            ],
          fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
          fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    });
 });
</script>	
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
<script>
	
	let ws = new WebSocket("ws://192.168.113.1/chat")
	
</script>
</body>
</html>