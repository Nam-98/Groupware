<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="/"><img style='height: 30px;' src="/resources/CommonImg/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<form class="navbar-form navbar-left">
				</form>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
<!-- 						<li class="dropdown">
							<a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
								<i class="lnr lnr-alarm"></i>
								<span class="badge bg-danger">5</span>
							</a>
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a></li>
								<li><a href="#" class="more">See all notifications</a></li>
							</ul>
						</li> 
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li> -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/resources/profileImage/${sessionScope.id}.png" class="img-circle" alt="Avatar"> <span>${sessionScope.id}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="/member/enterMyPage.member"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp&nbsp <span>My Profile</span></a></li>
								<li><a href="/message/msgInBoxList.message?cpage=1"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp&nbsp  <span>Message</span></a></li>
								<li><a href="#"> <span class="glyphicon glyphicon-cloud-download" aria-hidden="true"></span>&nbsp&nbsp <span>Webhard</span></a></li>
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
