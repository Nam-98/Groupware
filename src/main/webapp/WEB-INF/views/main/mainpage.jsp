<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupWare Mainpage</title>
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
<script src="https://kit.fontawesome.com/b1e233372d.js"
	crossorigin="anonymous"></script>
<style type="text/css">
#container {
	margin-left: 50px;
	margin-right: 50px;
}

.iconbox {
	text-align: center;
}

.iconbox:hover {
	cursor: pointer;
}

.bodyContents {
	height: 50%;
	min-height: max-content;
	border: 1px solid black;
	border-radius: 5px;
	text-align: center;
}

.bodyContainer {
	height: 500px;
	overflow: hidden;
}

#appContainer {
	display: none;
	height: 92%;
}

#messageContainer {
	height: 92%;
}

.profilBox {
	width: 30%;
	border-radius: 70%;
	overflow: hidden;
	margin: auto;
	margin-top: 40px;
	margin-bottom: 20px;
	position: relative;
}

.profileImg {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div id=container>
		<div class="topbanner row">
			<div class="col-12">topbanner</div>
		</div>
		<div class="menuButtons row">
			<div class="col-12 d-lg-none d-inline">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item adminitem"><a class="nav-link active"
									aria-current="관리자" href="#">관리자</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="전자결재" href="/approval/toAppMainView.approval">전자결재</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="업무일지" href="#">업무일지</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="쪽지함" href="#">쪽지함</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="일정관리" href="#">일정관리</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="웹하드" href="#">웹하드</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="근태관리" href="/tna/tnaCheckPage.tna">근태관리</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="조직관리" href="#">조직관리</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="프로젝트관리" href="#">프로젝트관리</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="커뮤니티" href="/write/enterCommunity.write">커뮤니티</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="마이페이지" href="/member/enterMyPage.member">마이페이지</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="col-1 iconbox d-lg-inline d-none ">
				<i class="fas fa-user-cog fa-4x adminitem"></i>
				<h6 class="adminitem">관리자</h6>
				<input type=hidden value="/">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-file-signature fa-4x"></i>
				<h6>전자결재</h6>
				<input type=hidden value="/approval/toAppMainView.approval">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-pen-square fa-4x"></i>
				<h6>업무일지</h6>
				<input type=hidden value="/">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-envelope fa-4x"></i>
				<h6>쪽지함</h6>
				<input type=hidden value="/">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-calendar-alt fa-4x"></i>
				<h6>일정관리</h6>
				<input type=hidden value="/">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-inbox fa-4x"></i>
				<h6>웹하드</h6>
				<input type=hidden value="/">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-user-clock fa-4x"></i>
				<h6>근태관리</h6>
				<input type=hidden value="/tna/tnaCheckPage.tna">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-sitemap fa-4x"></i>
				<h6>조직도</h6>
				<input type=hidden value="/">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fab fa-trello fa-4x"></i>
				<h6>프로젝트관리</h6>
				<input type=hidden value="/">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-users fa-4x"></i>
				<h6>커뮤니티</h6>
				<input type=hidden value="/write/enterCommunity.write">
			</div>
			<div class="col-1 iconbox d-lg-inline d-none">
				<i class="fas fa-id-card fa-4x"></i>
				<h6>마이페이지</h6>
				<input type=hidden value="/member/enterMyPage.member">
			</div>
		</div>
		<div class="bodyContainer row">
			<div class="col-lg-2 col-12">
				<div class="bodyContents loginInfo">
					<div class="profilBox d-none d-lg-block">
						<img class="profileImg " alt=""
							src="/resources/CommonImg/user-solid.png">
					</div>
					<div class="m-2">${sessionScope.id}님 환영합니다!</div>
					<button id="logout" class="btn btn-primary" type="button">Logout</button>
				</div>
				<div class="bodyContents calendar">calendar</div>
			</div>
			<div class="col-lg-4 col-12">
				<div class="bodyContents TnAInfo">
					TnAInfo
					<div id="goWork">출근버튼</div>
					<div id="leaveWork">퇴근버튼</div>
				</div>
				<div class="bodyContents scheduleInfo">scheduleInfo</div>
			</div>
			<div class="col-lg-6 col-12">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-primary" id=btnMsg>
						Messages <span class="badge rounded-pill bg-danger">숫자</span>
					</button>
					<button type="button" class="btn btn-outline-primary" id=btnApp>Approval</button>
				</div>
				<div class="bodyContents" id="messageContainer">message</div>
				<div class="bodyContents" id="appContainer">approval</div>
			</div>
		</div>



	</div>

	<script type="text/javascript">
      document.getElementById("logout").onclick = function() {
          location.href = "/member/logout.member"
       }
   
      //관리자 page 여부
      let isAdmin = ${sessionScope.accessLevel}
      if(isAdmin==0){
         $.each($(".adminitem"), function(index, item){
            console.log("each도는중 : "+index);
            $(item).css("display","none");
         })
      }
      $("#btnMsg").on("click",function(){
         $("#messageContainer").css("display","block");
         $("#appContainer").css("display","none")
      })
      $("#btnApp").on("click",function(){
         $("#messageContainer").css("display","none");
         $("#appContainer").css("display","block")
      })
      
      // 상단 아이콘 링크설정
      // iconbox 내부의 inputTypehidden들의 value를 requestMapping으로 수정 요망
      let icons = document.getElementsByClassName("iconbox")
      for(var i = 0; i<icons.length; i++){
         icons[i].addEventListener("click",function(){
            console.log(this.childNodes[3].innerHTML);
            location.href = this.childNodes[4].value
         });
      }

   </script>
	<script>
   // 출퇴근 여부 (미완)
   let tnaData = JSON.parse(${isWork});
   let isWork = tnaData[status]
   </script>
</body>
</html>