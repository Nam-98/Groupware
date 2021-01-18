<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupWare Mainpage</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/b1e233372d.js" crossorigin="anonymous"></script>
<style type="text/css">
	.iconbox{
		text-align:center;
	}
	.iconbox:hover{
		cursor: pointer;
	}
	.bodyContents{
		height:50%;
		border:1px solid black;
		border-radius: 5px;
		text-align:center;
	}
	.bodyContainer{
		height:500px;
	}
	.messageContainer{
		height:100%;
	}
	.profilBox{
		width:100px;height:100px;border-radius:70%;overflow:hidden;background-color:gray;
	}
</style>
</head>
<body>
	<div id=container>
		<div class="topbanner row">
			<div class="col-12">
				topbanner
			</div>
		</div>
		<div class="menuButtons row">
			<div class="col-12 d-md-none d-inline">
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
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">전자결재</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">업무일지</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">쪽지함</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">일정관리</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">웹하드</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">근태관리</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">조직관리</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">프로젝트관리</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">커뮤니티</a></li>
								<li class="nav-item"><a class="nav-link active"	aria-current="전자결재" href="#">마이페이지</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="col-1 d-md-inline d-none"></div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-file-signature fa-4x"></i>
				<h6>전자결재</h6>
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-pen-square fa-4x"></i>
				<h6>업무일지</h6>			
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-envelope fa-4x"></i>
				<h6>쪽지함</h6>			
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-calendar-alt fa-4x"></i>
				<h6>일정관리</h6>
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-inbox fa-4x"></i>
				<h6>웹하드</h6>
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-user-clock fa-4x"></i>
				<h6>근태관리</h6>	
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-sitemap fa-4x"></i>
				<h6>조직도</h6>
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fab fa-trello fa-4x"></i>
				<h6>프로젝트관리</h6>
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-users fa-4x"></i>
				<h6>커뮤니티</h6>
			</div>
			<div class="col-1 iconbox d-md-inline d-none">
				<i class="fas fa-id-card fa-4x"></i>
				<h6>마이페이지</h6>
			</div>
			<div class="col-1 d-md-inline d-none"></div>
		</div>
		<div class="bodyContainer row">
			<div class="col-md-2 col-12">
				<div class="bodyContents loginInfo">
					loginInfo
					<div class="profilBox">
						<img class="profilImg" alt="" src="/user-solid.png">
					</div>
				</div>
				<div class="bodyContents calendar">calendar</div>
			</div>
			<div class="col-md-4 col-12">
				<div class="bodyContents TnAInfo">TnAInfo</div>
				<div class="bodyContents scheduleInfo">scheduleInfo</div>
			</div>
			<div class="col-md-6 col-12">
				<div class="bodyContents messageContainer">message
				<span class="badge rounded-pill bg-danger">숫자</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>