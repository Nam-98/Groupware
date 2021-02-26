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

<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />  
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxpanel.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxtree.js"></script>
 
  <script type="text/javascript">

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
              ['insert',['picture']]
            ],
          fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
          fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    });
});
</script>	
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
       	margin-left: 10px;
    }
    
    li>a{
    	color: black;
   text-decoration: none;
    }
    .msgInput{
    border: 1px solid gray;}

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
				<div class="col-md-9">
						<div class="well">
							<div class="panel panel-headline demo-icons">
								<div class="panel-heading">
									<h3 class="panel-title">쪽 지 작 성</h3>
								</div>
								<div class="panel-body">
									<div style="width: 100%;">
										<form method="post" enctype="multipart/form-data"
											action="/message/msgProc.message">

											<div class="row mb-3">
												<div class="col-3 col-sm-2">
													<b>받는 사람 </b>
												</div>

												<div class="col-9 col-sm-10 pr-5">
													<input class="msgInput" type="text"
														name="msg_receiver_name" id="msg_receiver_name" style="width: 80%;" readonly /> 
														<input type="button" class="btn btn-sm btn-primary" value="찾기" id="search">
														
													<!-- 값을 숨겨서 보내는 장소 -->
													<input type="hidden" name="msg_receiver" id="msg_receiver">
													<input class="msgInput" type="hidden"
														name="msg_sender_name" style="width: 75%;" value="${msg_sender_name}" />
												</div>
											</div>
											<br>

											<div class="row mb-3">
												<div class="col-3 col-sm-2">
													<b>제목 </b>
												</div>
												<div class="col-9 col-sm-10">
													<input class="msgInput" type="text"
														placeholder="제목을 입력하시오." name="msg_title" value="RE: ${mdto.msg_title}"
														style="width: 80%;" />
												</div>
											</div>
											<br>

											<div class="row mb-3">
												<div class="col-3 col-sm-2">
													<b>파일첨부</b>
												</div>
												<div class="col-9 col-sm-10">
													<input type="file" class="form-control" name="attfiles"
														id="inputGroupFile04"
														aria-describedby="inputGroupFileAddon04"
														aria-label="Upload" style="width: 80%;">
												</div>
											</div>
											<br>

											<textarea id="summernote" name="msg_contents"
												placeholder="내용을 입력하시오."></textarea>
											<input id="subBtn" class="btn btn-primary btn-sm"
												type="submit" style="float: right;" value="보내기"/>

										</form>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
	</div>
	<!-- END WRAPPER -->
	
	<!-- summernote 내용 불러오기. -->
	<script>
	$(document).ready(function(){
		var contents = "<br><br>---------Original Message---------<br> From : "+`${msg_receiver_name}`+"<br> To : "+`${msg_sender_name}`+"<br> DATE : "+`${mdto.msg_sender_date_str}`+"<br> Subject : "+`${mdto.msg_title}`+"<br><br>"+`${mdto.msg_contents}`;
	$('#summernote').summernote('code',contents )});
	</script>
	
	<!-- 받는 사람 값이 빈값일때. -->
	<script>
	var name = document.getElementById("msg_receiver_name").value;
		if(name == ""){
			document.getElementById("msg_receiver_name").value=`${msg_receiver_name}`;	
		 	  document.getElementById("msg_receiver").value=`${msg_receiver}`;
		};
	</script>
	
	<!-- 주소록 찾아가기 -->
	<script>
		$("#search")
				.on(
						"click",
						function() {
							var options = 'top=40, left=40, width=1150, height=700, status=no, menubar=no, toolbar=no, resizable=no';
							window.open("/message/msgPopup.message", "popup",
									options);
						});
		function getReturnValue(returnValue) {
			obj = JSON.parse(returnValue);
			  document.getElementById("msg_receiver_name").value=obj.key1;	
		 	  document.getElementById("msg_receiver").value=obj.key2;
			} 
	</script>
	
	
</body>



</html>