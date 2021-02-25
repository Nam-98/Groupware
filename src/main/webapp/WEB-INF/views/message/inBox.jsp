<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수신함</title>
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
			<div class="panel panel-headline demo-icons">
				<div class="container-fluid">
				
				
				<div class="panel-heading">
					<h3 class="page-title">수 신 함</h3>
					<div class="right">
  					<input type="button" class="btn btn-sm btn-primary" id="cabBtn" value="보관함이동">
  					<script>
  						$("#cabBtn").click(function(){
  							var confirm_val = confirm("보관함으로 옮기시겠습니까?");
  							
  							if(confirm_val){
  								var chkArr = new Array();
  								
  								$("input[class='chk']:checked").each(function(){
  									chkArr.push($(this).attr("value"));
  			
  								});
  								
  								
  								$.ajax({
  									url : "/message/msgInCabinsert.message",
  									type : "post",
  									data : {"chk" : chkArr},
  								}).done(function(result){
  										console.log("result123 : "+result);
										let json = JSON.parse(result);
  										console.log(json);
  										if(json.result == 1){
  										location.href = "/message/msgInBoxList.message?cpage=1";
  										
  										for(var i=0; i<chkArr.length;i++){
  											let temp = ".trChk_"+chkArr[i];
  											$(temp).remove();
  										}
  										}else{
  											alert("삭제 실패");
  										}
  									})
  							}
  						})
  					</script>
  					
 					
  					<input type="button" class="btn btn-sm btn-primary" id="delBtn" value="삭제">
  					<script>
  						$("#delBtn").click(function(){
  							var confirm_val = confirm("정말 삭제하시겠습니까?");
  							
  							if(confirm_val){
  								var chkArr = new Array();
  								
  								$("input[class='chk']:checked").each(function(){
  									chkArr.push($(this).attr("value"));
  								});
  								
  								$.ajax({
  									url : "/message/delMsgInList.message",
  									type : "post",
  									data : {"chk" : chkArr},
  								}).done(function(result){
  										console.log("result123 : "+result);
										let json = JSON.parse(result);
  										console.log(json);
  										if(json.result == 1){
  										location.href = "/message/msgInBoxList.message?cpage=1";
  										
  										for(var i=0; i<chkArr.length;i++){
  											let temp = ".trChk_"+chkArr[i];
  											$(temp).remove();
  										}
  										}else{
  											alert("삭제 실패");
  										}
  									})
  							}
  						})
  					</script>
					</div>
					</div>
					<div class="panel-body">
					<table class="table table-secondary table-striped">
					<thead class="table-light">
						<tr>
							<th scope="col">
							<div class="input-group" style="width:5%;">
							<span class="input-group-addon-default">
        					<input type="checkbox" aria-label="..." class="checkAll">
      						</span>
      						</div>
      						</th>
							<th scope="col">제목</th>
							<th scope="col">발신자</th>
							<th scope="col">발신일</th>
							<th scope="col">수신일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${mlist }">
							<tr class="trChk_${i.msg_seq}">
								<th scope="col">
								<div class="input-group" style="width:5%;">
								<span class="input-group-addon-default">
        						<input type="checkbox" class="chk" name="msg_seq" value="${i.msg_seq}">
      							</span>
      							</div>
      							</th>
								<td><a href="/message/msgReceiveView.message?msg_seq=${i.msg_seq}&msg_receive_date_str=${i.msg_receive_date_str }">${i.msg_title }</a></td>
								<td>${i.msg_sender_name }</td>
								<td>${i.msg_sender_date_str }</td>
								<td>${i.msg_receive_date_str }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="navi" style="text-align: center;">${navi }</div>
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
	<script>
		$(document).ready(function(){
			$(".checkAll").click(function(){
				$(".chk").prop("checked",this.checked);
			})
		})
	</script>
	<script>
		$(".chk").click(function(){
			$(".checkAll").prop("checked",false);
		});
	</script>
</body>
</html>