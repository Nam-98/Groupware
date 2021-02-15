<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보관함</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 아이콘 fontawesome -->
<script src="https://kit.fontawesome.com/b1e233372d.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/assets/img/favicon.png">
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
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
			
			<div class="panel panel-headline demo-icons">
			
				<div class="container-fluid">
					<div class="panel-heading">
					<h3 class="page-title">보 관 함</h3>
					</div>
					<div class="panel-body">

						

<ul class="nav nav-tabs" style="height:50px;">
  <li class="nav-item active">
    <a class="nav-link" data-toggle="tab" href="#inbox" >수신</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#outbox">발신</a>
  </li>
  
</ul>

<div class="tab-content">

  <div class="tab-pane fade active in" id="inbox">
    
   						 <div class="btn-group-ml" role="group"
                           style="text-align: right;">
                           <button type="button" class="btn btn-primary" id="delBtn">삭제</button>
                           <script>
  						$("#delBtn").click(function(){
  							var confirm_val = confirm("정말 삭제하시겠습니까?");
  							
  							if(confirm_val){
  								var chkArr = new Array();
  								
  								$("input[class='chk']:checked").each(function(){
  									chkArr.push($(this).attr("value"));
  								});
  								
  								$.ajax({
  									url : "/message/delMsgCabList.message",
  									type : "post",
  									data : {"chk" : chkArr},
  								}).done(function(result){
  										console.log("result123 : "+result);
										let json = JSON.parse(result);
  										console.log(json);
  										if(json.result == 1){
  										location.href = "/message/msgCabList.message?cpage=1";
  										
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

                        <table class="table table-secondary table-striped">
                           <thead class="table-light">
                              <tr>
                                 <th scope="col">
                                    <div class="input-group" style="width: 5%;">
                                       <span class="input-group-addon-default"> <input
                                          type="checkbox" aria-label="..." class="checkAll">
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
                              <c:forEach var="i" items="${inList }">
                                 <tr class="trChk_${i.MSG_SEQ}">
                                    <th scope="col">
                                       <div class="input-group" style="width: 5%;">
                                          <span class="input-group-addon-default"> <input
                                             type="checkbox" class="chk" name="msg_seq"
                                             value="${i.MSG_SEQ}">
                                          </span>
                                       </div>
                                    </th>
                                    <td><a
                                       href="/message/msgCabView.message?msg_seq=${i.MSG_SEQ}&msg_receive_date_str=${i.msg_receive_date_str }">${i.MSG_TITLE }</a></td>
                                    <td>${i.MSG_SENDER_NAME }</td>
                                    <td>${i.MSG_SENDER_DATE_STR }</td>
                                    <td>${i.MSG_RECEIVE_DATE_STR }</td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                        <div class="navi" style="text-align: center;">${inNavi }</div>
    
  </div>
  
  
  <div class="tab-pane fade" id="outbox">
    <p><div class="btn-group-ml" role="group"
                           style="text-align: right;">
                           <button type="button" class="btn btn-primary" id="delBtn1">삭제</button>
                           <script>
  						$("#delBtn1").click(function(){
  							var confirm_val = confirm("정말 삭제하시겠습니까?");
  							
  							if(confirm_val){
  								var chkArr = new Array();
  								
  								$("input[class='chk']:checked").each(function(){
  									chkArr.push($(this).attr("value"));
  								});
  								
  								$.ajax({
  									url : "/message/delMsgCabList.message",
  									type : "post",
  									data : {"chk" : chkArr},
  								}).done(function(result){
  										console.log("result123 : "+result);
										let json = JSON.parse(result);
  										console.log(json);
  										if(json.result == 1){
  										location.href = "/message/msgCabList.message?cpage=1";
  										
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

                        <table class="table table-secondary table-striped">
                           <thead class="table-light">
                              <tr>
                                 <th scope="col">
                                    <div class="input-group" style="width: 5%;">
                                       <span class="input-group-addon-default"> <input
                                          type="checkbox" aria-label="..." class="checkAll">
                                       </span>
                                    </div>
                                 </th>
                                 <th scope="col">제목</th>
                                 <th scope="col">수신자</th>
                                 <th scope="col">발신일</th>
                                 <th scope="col">수신일</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach var="i" items="${outList }">
                                 <tr class="trChk_${i.msg_seq}">
                                    <th scope="col">
                                       <div class="input-group" style="width: 5%;">
                                          <span class="input-group-addon-default"> <input
                                             type="checkbox" class="chk" name="msg_seq"
                                             value="${i.msg_seq}">
                                          </span>
                                       </div>
                                    </th>
                                    <td><a
                                       href="/message/msgCabView.message?msg_seq=${i.msg_seq}&msg_receive_date_str=${i.msg_receive_date_str }">${i.msg_title }</a></td>
                                    <td>${i.msg_receiver_name }</td>
                                    <td>${i.msg_sender_date_str }</td>
                                    <td>${i.msg_receive_date_str }</td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                        <div class="navi" style="text-align: center;">${outNavi }</div>                     
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
	<!-- <script>
		document.getElementById("first")[0].click();
	</script>
	 -->
</body>
</html>