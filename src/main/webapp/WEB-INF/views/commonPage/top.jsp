<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="/"><img style='height: 30px;' src="/resources/CommonImg/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-indent-decrease"></i></button>
				</div>
				<form class="navbar-form navbar-left">
				</form>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/resources/profileImage/${sessionScope.id}.png" class="img-circle" alt="Avatar"> <span>${sessionScope.id}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="/member/enterMyPage.member"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp&nbsp <span>My Profile</span></a></li>
								<li><a href="/message/msgInBoxList.message?cpage=1"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp&nbsp  <span>Message</span></a></li>
								<li><a href="javascript:void(0);" class="goWebhard"> <span class="glyphicon glyphicon-cloud-download" aria-hidden="true"></span>&nbsp&nbsp <span>Webhard</span></a></li>
								<li><a href="/member/logout.member"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp&nbsp <span>Logout</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<script>
			if(${empty sessionScope.id}){
				alert("로그아웃 되었습니다.");
				location.href="/";
			}
			
		</script>
		<script>
// 			$('.goWebhard').on('click', function(){
// 				var url = "/webhard/webhardMain.webhard";
// 				var popupWidth = 1440;
// 				var popupHeight = 810;
// 				var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 				// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
// 				var popupY = (window.screen.height / 2) - (popupHeight / 2) - 50;
// 				// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
				
// 				var options='top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no, location=no';
// 				window.open(url,"popup",options);
// 			})
		</script>
