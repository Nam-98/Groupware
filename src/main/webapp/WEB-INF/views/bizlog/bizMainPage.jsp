<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 메인</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
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
	<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
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


.active2, .collapsible:hover {
	background-color: #555;
}

.collapsible:after {
	content: '\002B';
	color: white;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active2:after {
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
#searchInput{width:60%;display:inline-flex;}
#searchType{padding-left:10px;width:25%;display:inline-block;}
.dateSelect{width:fit-content;display:inline-block;}
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
					<div class="panel-body">
							<!-- 검색창 및 글 작성 버튼 -->
							<div class="dateContainer row">
								<div class="col-md-6 col-xs-12">
									<select id="date-year" class="dateSelect form-control input-sm"></select> 
									<select id="date-month"	class="dateSelect form-control input-sm">
										<option value='1'>1월</option>
										<option value='2'>2월</option>
										<option value='3'>3월</option>
										<option value='4'>4월</option>
										<option value='5'>5월</option>
										<option value='6'>6월</option>
										<option value='7'>7월</option>
										<option value='8'>8월</option>
										<option value='9'>9월</option>
										<option value='10'>10월</option>
										<option value='11'>11월</option>
										<option value='12'>12월</option>
								</select>
								<button type="button" class="btn btn-primary btn-xs" id="changeDate">날짜 변경</button>
								</div>
								<div class="col-md-6 col-xs-12">
									<button type="button" class="btn btn-success pull-right btn-xs" id="toWrite">글작성하기</button>	
								</div>

								
							</div>
							
						<hr></hr>

							<!-- 업무일지 리스트업-->
							<h2>
								<c:set var="selectedDate" value="${fn:split(strDate,'-')}"></c:set>
								<c:out value="${selectedDate[0]}"></c:out>년 <c:out value="${selectedDate[1]}"></c:out>월 업무일지 
							</h2>
							번호, 업무일지 유형, 제목, 등록일, 상태(확인,반송 등) Copy
							
							<div class="collapseContainer">
								<p>Collapsible Set:</p>
								<button class="collapsible">Open Section 1</button>
								<div class="content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud 
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat.</p>
								</div>
								<button class="collapsible">Open Section 2</button>
								<div class="content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat.</p>
								</div>
								<button class="collapsible">Open Section 3</button>
								<div class="content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat.</p>
								</div>
							</div>
							<!-- 업무일지 리스트업 종료-->
							



						</div><!-- panel body 종료 -->
						<div class="panel-footer">
							<div class="row">
								<div class="col-md-5 col-sm-12">
									<select id="searchType"
										class="form-control input-sm selectInline" name="searchType">
										<option value="biz_title">제목</option>
										<option value="biz_writer">작성자</option>
										<option value="biz_contents">내용</option>
									</select>
									<div class="input-group" id=searchInput>
										<input class="form-control input-sm" type="text"
											placeholder='검색어를 입력하세요'> <span
											class="input-group-btn"><button
												class="btn btn-primary btn-sm" type="button"
												style="all: none;">Go!</button></span>
									</div>
								</div>
							</div>
							<!-- row종료 -->
						</div>
						
						
					</div><!-- panel 종료 -->
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
	</div>
	<!-- END WRAPPER -->
	<script type="text/javascript">
		document.getElementById("toWrite").onclick = function(){
			location.href = "/bizlog/toWriteView.bizlog";
		}
		
		//페이지가 로딩된 후 선택된 날짜에 맞추어 year부분 select를 설정한다.
		let selectedDate = "${strDate}";
		window.onload = function(){			
			var sYear = selectedDate.split("-")[0];
			var year = document.getElementById("date-year");
			for(var i=0; i<10; i++){
				year.options[year.options.length] = new Option(sYear-i+"년", sYear-i);
			}
			//이번달로 select를 자동 세팅함
			var sMonth = selectedDate.split("-")[1];
			document.getElementById("date-month").options[sMonth-1].selected = true;
		}
		
		//날짜변경 버튼 클릭 시
		document.getElementById("changeDate").onclick = function(){
			var sYear = document.getElementById("date-year").value;
			var sMonth = document.getElementById("date-month").value;
			location.href = "/bizlog/toMainPage.bizlog?strDate="+sYear+"-"+sMonth;
		}
	</script>
	<script>
	//collapse 전용 javascript
		var coll = document.getElementsByClassName("collapsible");
		var i;
		
		for (i = 0; i < coll.length; i++) {
		  coll[i].addEventListener("click", function() {
		    this.classList.toggle("active2");
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
</body>
</html>