<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 메인</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<style type="text/css">
	#container{width:1000px;margin:auto;border:1px solid black;}
	.infoContainer{border:1px solid black; width:100%;border-radius: 5px;}
</style>
</head>
<body>
	<div id="container">
		<div class="row">
			<div class="col-12">
				<h3>전자결재 메인</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-3">
				<h5>결재할 문서함</h5>
				<div class="infoContainer">
					미결재 / 결재완료
				</div>
			</div>
			<div class="col-12 col-md-3">
				<h5>개인 문서함</h5>
				<div class="infoContainer">
					상신문서 반려문서 임시저장 결재완료 상신취소
				</div>
			</div>
			<div class="col-12 col-md-3">
				<h5>협조 문서함</h5>
				<div class="infoContainer">
					미결재 결재완료
				</div>
			</div>
			<div class="col-12 col-md-3">
				<h5>부서/참조 수신함</h5>
				<div class="infoContainer">
					부서수신함 참조수신함
				</div>
			</div>
		</div>
		<div class="row accordion">
			
		</div>
		
		<div class="row">
			<div class="col-12"><p class="h6">결재할 문서함 > 미결재 문서</p></div>
			<div class="col-12">문서번호 기안일자 문서명 기안자 나의결재 [상태] 다음결재자 [의견]</div>
		</div>
		<div class="row">
			<div class="col-12"><p class="h6">개인 문서함 > 상신 문서</p></div>
			<div class="col-12">문서번호 기안일자 문서명 [상태] [의견]</div>
		</div>
		<div class="row">
			<div class="col-12"><p class="h6">협조 문서함 > 미결재 문서</p></div>
			<div class="col-12">문서번호 기안일자 문서명 기안자 나의결재 [상태] 다음결재자 [의견]</div>
		</div>
	</div>
</body>
</html>