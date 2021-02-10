<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 메인페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
	<!-- VENDOR CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
	<style>
.align-right {
	text-align: right;
}

.clicker:hover {
	cursor: pointer
}

/*collapse css*/
.collapsible {
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
}
.btn3n-2{
	background-color: #276678;
		color: white;
}
.btn3n-1{
background-color:#1687a7;
	color: white;
}
.btn3n{background-color:#d3e0ea;	color: gray;}


.active, .collapsible:hover {
	background-color: #555;
}

.collapsible:after {
	content: '\002B';
	color: white;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.content {
	padding: 0 18px;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	background-color: #f1f1f1;
}
p{margin-top:10px;margin-bottom:10px;}
</style>
</head>
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
					<h3 class="page-title">업무일지</h3>
					<div class="panel">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<div class='row'>
								<div class='col-sm-12'>
									<h3 class="panel-title">업무일지</h3>
								</div>
							</div>
						</div>

					<div class="panel-body">
					<hr></hr>
							<!-- 검색창 및 글 작성 버튼 -->
							<div class="searchContainer row">
								<div class="col-sm-1 col-xs-4">
									<select id="sortType" class="form-control input-sm">
										<option value='default'>정렬 선택</option>
									</select>
								</div>
								<div class='col-sm-1 col-xs-4'>
									<select id="searchType" class="form-control input-sm"
										name="searchType">
										<option value="biz_title">제목</option>
										<option value="biz_writer">작성자</option>
										<option value="biz_contents">내용</option>
									</select>
								</div>
								<div class="col-sm-3 col-xs-8">
									<div class="input-group">
										<input class="form-control input-sm" type="text"> <span
											class="input-group-btn"><button
												class="btn btn-primary btn-sm" type="button"
												style="all: none;">Go!</button></span>
									</div>
								</div>

								<div class="col-sm-7 col-xs-8 align-right">
									<button type=button id=toWrite class="btn btn-success btn-sm"
										style="all: none;">업무일지 작성</button>
								</div>
							</div>
						<hr></hr>

							<!-- 업무일지 리스트업-->
							번호, 업무일지 유형, 제목, 작성자, 등록일, 상태(확인,반송 등)
							Copy
							<div class="collapseContainer">
							<p>Collapsible Set:</p>
<button class="collapsible">Open Section 1</button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
<button class="collapsible">Open Section 2</button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
<button class="collapsible">Open Section 3</button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>	
							</div>
				<!-- 업무일지 리스트업 종료-->
							



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
	<script type="text/javascript">
		document.getElementById("toWrite").onclick = function(){
			location.href = "/bizlog/toWriteView.bizlog";
		}
		
		$(".clicker").on("click",function(){
			
		})
	</script>
	<script>
	//collapse 전용 javascript
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}

let buttons = $(".collapseContainer").children("button");
let btncnt = 1;
//collpase 색깔 배치 바꾸기
for(let btn of buttons){
	if(btncnt%3==0){
		//btn.addClass("even");
		btn.setAttribute("class","collapsible btn3n");
	}else if(btncnt%3==1){
		btn.setAttribute("class","collapsible btn3n-2");
	}else{
		btn.setAttribute("class","collapsible btn3n-1");
	}
	btncnt++;
}

</script>
	<!-- END WRAPPER -->
</body>
</html>