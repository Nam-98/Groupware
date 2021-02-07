<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 상세페이지</title>
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
		th{text-align: right;
    width: 100px;}
    td{width:auto;}
    .signTh{text-align:center;}
    .signTd{text-align:center;}
	.slash {
	  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="100%" x2="100%" y2="0" stroke="gray" /></svg>');
	}
	.backslash {
	  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="0" x2="100%" y2="100%" stroke="gray" /></svg>');
	}
	.stmpRow{height:70px;}
	.table>tbody>tr>td, .table>tbody>tr>th{vertical-align:middle;}
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
					<h3 class="page-title">전자결재 상세페이지</h3>
					<div class="panel">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
						
						<table class='table'>
							<tr>
								<th class="active">기안 부서</th>
								<td class="">
									<c:forEach items="${mlist}" var="mem">	
										<c:if test="${app.app_id==mem.id}">
											${mem.dept_name }
										</c:if>
									</c:forEach>
								</td>
								<th class="active">기안자</th>
								<td class="">
									<c:forEach items="${mlist}" var="mem">
										<c:if test="${app.app_id==mem.id}">
											${mem.name }
										</c:if>
									</c:forEach>
								</td>
								<th class="active">기안 일시</th>
								<td>${app.app_reg_date}</td>
							</tr>
							<tr>
								<th class="active">문서 종류</th> 
								<td>${app.app_type_name}</td>
								<th class="active">문서 번호</th>
								<td>${app.app_docs_num}</td>
								<th class="active">보존연한</th> 
								<td>${app.app_archive}년</td>
							</tr>
							<tr>
								<th class="active">제목</th>
								<td colspan="5">${app.app_title }</td> 
							</tr>
							<tr>
								<th class="active">첨부파일</th>
									<c:if test="${!empty files }">
										<c:forEach items="${files }" var="f">
											<td><a href="/approval/dlAttachedFiles.approval?app_saved_name=${f.app_saved_name}&app_seq=${f.app_seq}">${f.app_ori_name}</a></td>
										</c:forEach>
									</c:if>
									<c:if test="${empty files }"><td>첨부파일이 없습니다.</td></c:if>
							</tr>
						</table>
						
						<table class='table' id="signRow">
							
						</table>
						<table class='table' id="dseRow">
							
						</table>
						<table class='table' id="ccRow">
							
						</table>
						<script>
						let rowCnt = 8;
						let signleng = 0;
						let dseleng = 0;
						let ccleng = 0;
						
						let signTh =  $('<tr>');
							signTh.append($("<th class='active' rowspan='2'>결재자</th>"));
						let signStmp =  $("<tr class='stmpRow'>");
						
						let dseTh =  $('<tr>');
							dseTh.append($("<th class='active' rowspan='2'>합의자</th>"))
						let dseStmp =  $("<tr class='stmpRow'>");
						let ccTh =  $('<tr>');
							ccTh.append($("<th class='active'>참조자</th>"))
							
						//결재,합의,참조 라인 구성
							<c:forEach items="${signs}" var="sign" varStatus="sta">
								<c:choose>
									<c:when test="${sign.app_sign_type_code==0}">
										signTh.append($("<th class='active signTh'>${sign.name}</th>"));	
										let stmpTd${sta.count} = $("<td class='stamp signTd'>");
										<c:choose>
											<c:when test="${sign.app_sign_id == sessionScope.id && isMyCheckTurn == 1}">
												//내 결재차례일 경우, 결재하기 버튼을 넣는다. 
												let btng = $("<div class='btn-group-vertical' role='group'>");
												btng.append($("<input type=button class='btn btn-primary' id='btnSign' value='결재하기'>"));
												btng.append($("<input type=button class='btn btn-danger' id='btnRtrn' value='반송하기'>"))
												stmpTd${sta.count}.append(btng);
											</c:when>
											<c:when test="${sign.app_sign_accept=='Y' && sign.app_sign_date!=null}">
												//이미 결재가 완료된 사안이면 stamp칸에 "승인" 이미지를 띄운다. 
												stmpTd${sta.count}.append($("<h6>승인<h6>"));
											</c:when>
											<c:when test="${sign.app_sign_accept=='N' && sign.app_sign_date!=null}">
												//반려된 사안이면 stamp칸에 "반려" 이미지를 띄운다. 
												stmpTd${sta.count}.append($("<h6>반려<h6>"));
											</c:when>
											<c:otherwise>
												//아직 결재 차례가 오지 않았다면 미결재로 둔다. 
												stmpTd${sta.count}.append($("<h6>미결재<h6>"));
											</c:otherwise>
										</c:choose>
										
										signStmp.append(stmpTd${sta.count});
										//signRow.append($("<input type=hidden value='${sign.app_sign_id}'>'"));
										signleng++;
									</c:when>
									
									<c:when test="${sign.app_sign_type_code==2}">
										dseTh.append($("<th class='active signTh'>${sign.name}</th>"));	
										let stmpTd${sta.count} = $("<td class='stamp'>");
										<c:choose>
											<c:when test="${sign.app_sign_id==sessionScope.id && isMyCheckTurn==1}">
												//내 결재차례일 경우, 결재하기 버튼을 넣는다. 
												stmpTd${sta.count}.append($("<input type=button id='btnSign' value='결재하기'>"));
											</c:when>
											<c:when test="${sign.app_sign_accept=='Y' && sign.app_sign_date!=null}">
												//이미 결재가 완료된 사안이면 stamp칸에 "승인" 이미지를 띄운다. 
												stmpTd${sta.count}.append($("<h6>승인<h6>"));
											</c:when>
											<c:when test="${sign.app_sign_accept=='N' && sign.app_sign_date!=null}">
												//반려된 사안이면 stamp칸에 "반려" 이미지를 띄운다. 
												stmpTd${sta.count}.append($("<h6>반려<h6>"));
											</c:when>
											<c:otherwise>
											//아직 결재 차례가 오지 않았다면 미결재로 둔다. 
											stmpTd${sta.count}.append($("<h6>미결재<h6>"));
											</c:otherwise>
										</c:choose>
										
										dseStmp.append(stmpTd${sta.count});
										dseleng++;
									</c:when>
									
									<c:when test="${sign.app_sign_type_code==1}">
										//참조
										ccTh.append($("<td class='signTd'><span class='label label-info'>${sign.name}</span></td>"));
										ccleng++;
									</c:when>
								</c:choose>
							</c:forEach>
							
									let signrest = signleng%rowCnt;
									let signcnt = rowCnt-signrest;
									for(var i=0;i<signcnt; i++){
										signTh.append($("<th class='active signTh'>"));
										signStmp.append($("<td class='stamp signTd'>"));
									}
								
									let dserest = dseleng%rowCnt;
									let dsecnt = rowCnt-dserest;
									for(var i=0;i<dsecnt; i++){
										dseTh.append($("<th class='active signTh'>"));
										dseStmp.append($("<td class='stamp signTd'>"));
									}
									let ccrest = ccleng%rowCnt;
									let cccnt = rowCnt-ccrest;
									for(var i=0;i<cccnt; i++){
										ccTh.append($("<td class='signTd'>"));
									}
							
								
							$("#signRow").append(signTh);
							$("#signRow").append(signStmp);
							$("#dseRow").append(dseTh);
							$("#dseRow").append(dseStmp);
							$("#ccRow").append(ccTh);
						</script>
						</div>
						<hr></hr>
						<!-- pannel 내부의 내용 작성 div-->
						<div class="panel-body">
							<div id="tViewer">${contents}</div>
						</div>
						<div class="panel-footer">
							<!-- 댓글부분 -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme I Need</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<script>
		$("#btnSign").on("click",function(){
			let check = confirm("결재하시겠습니까?");
			if(check){
				location.href="/approval/signApproval.approval?isAccept=Y&app_seq="+${app_seq};
			}
		})
		$("#btnRtrn").on("click",function(){
			let check = confirm("반송하시겠습니까?");
			if(check){
				location.href="/approval/signApproval.approval?isAccept=N&app_seq="+${app_seq};
			}
		})
	</script>
</body>
</html>