<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 내용 보기</title>
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
* { margin: auto;
	box-sizing: border-box;
}

.contents {
	padding: left;
	width: 400px;
	height: 400px;
}
.btn{
	margin-left: 5px;
}

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
					<div class="maincontainer">
					<br><br><br>
					<div class="btn-group-ml" role="group" style="text-align: right;">
  					<button type="button" class="btn btn-primary" id="reply">답장 하기</button>
  					<button type="button" class="btn btn-primary" id="delete">삭제</button>
  					<button type="button" class="btn btn-primary" id="list">목록으로</button>
					</div>
					<br>
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="col-7">제목 : ${mdto.msg_title }</th>
							<th scope="col" class="col-2">발신자 : ${mdto.msg_sender_name }</th>
							<th scope="col" class="col-2">발신일 : ${mdto.msg_sender_date_str }</th>
							<th scope="col" class="col-1">수신일 : ${mdto.msg_receive_date_str }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="contents" colspan="4">${mdto.msg_contents }</td>
						</tr>
						<tr>
							<td class="file" colspan="4">
								첨부 파일 : 
								<c:forEach items="${attlist }" var="i">
									<a href = "/message/attFilesDown.message?msg_seq=${i.msg_seq }&msg_ori_name=${i.msg_ori_name}&msg_saved_name=${i.msg_saved_name}">${i.msg_ori_name}</a><br>
								</c:forEach>
							</td>
						</tr>	
					</tbody>
				</table>
				
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
	
<script>
	document.getElementById("list").onclick=function(){
		location.href="/message/msgInBoxList.message?cpage=1"
	}
		
	document.getElementById("delete").onclick = function() {
		location.href = "/message/msgDelete.message?msg_seq=${mdto.msg_seq}";
	}
	
	document.getElementById("reply").onclick = function() {
		location.href = "/message/msgReply.message?msg_sender_name=${mdto.msg_sender_name }&msg_receiver_name=${mdto.msg_receiver_name}&msg_receiver=${mdto.msg_receiver}";
	}
</script>
</body>
</html>