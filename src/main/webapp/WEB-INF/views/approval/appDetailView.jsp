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
	.align-right{text-align:right;}
	.ccTd{text-align:left;}
	.ccTd > span{margin-left:10px;}
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
											<td><a href="/approval/dlAttachedFiles.approval?app_saved_name=${f.app_saved_name}&app_seq=${f.app_seq}&app_ori_name=${f.app_ori_name}">${f.app_ori_name}</a></td>
										</c:forEach>
									</c:if>
									<c:if test="${empty files }"><td>첨부파일이 없습니다.</td></c:if>
							</tr>
							
							<tr id="ccRow">
								<th class='active'>참조자</th>
							</tr>
						</table>
						
						<table class='table' id="signRow">
							
						</table>

						<script>
						let rowCnt = 8;
						let signleng = 0;
						let dseleng = 0;
						let ccleng = 0;
						
						let signTh =  $('<tr>');
							signTh.append($("<th class='active' rowspan='2'>결재선</th>"));
						let signStmp =  $("<tr class='stmpRow'>");
						
						let dseTh =  $('<tr>');
							dseTh.append($("<th class='active' rowspan='2'>합의자</th>"))
						
						let dseStmp =  $("<tr class='stmpRow'>");
						let ccTh =  $("<td class='signTd ccTd' colspan='5'></td>");
							
						//결재,합의,참조 라인 구성
							<c:forEach items="${signs}" var="sign" varStatus="sta">
								<c:choose>
									<c:when test="${sign.app_sign_type_code==0}">//결재자

										signTh.append($("<th class='active signTh'>${sign.name} (결재)</th>"));	
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
									
									
									<c:when test="${sign.app_sign_type_code==2}">//합의자
										signTh.append($("<th class='active signTh'>${sign.name} (합의)</th>"));	
										let stmpTd${sta.count} = $("<td class='stamp'>");
										<c:choose>
											<c:when test="${sign.app_sign_id==sessionScope.id && isMyCheckTurn==1}">
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
										signleng++;
									</c:when>
									
									<c:when test="${sign.app_sign_type_code==1}">
										//참조
										ccTh.append($("<span class='label label-info'>${sign.name}</span>"));
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

									let ccrest = ccleng%rowCnt;
									let cccnt = rowCnt-ccrest;
									for(var i=0;i<cccnt; i++){
										ccTh.append($("<td class='signTd'>"));
									}
							
								
							$("#signRow").append(signTh);
							$("#signRow").append(signStmp);

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
							<form  action="/approval/writeCmt.approval?app_seq=${app_seq }" id="cmtForm" method="post">
	                        	<textarea style='resize: none; width: 100%; height: 100px' id="cmtArea" placeholder="내용을 입력해주세요." name="app_cmt_contents"  maxlength="300"></textarea>
	                        	<div class=align-right><button id="btnWrite" type="button" class="btn btn-info btn-sm">작성</button></div>
	                        </form>
	                    	<div id="cmtContainer">
	                    		<c:if test="${!empty cmts }">
	                    			<c:forEach items="${cmts}" var="cmt">
	                    			<div class="rows well">
                                       <div class="row replyRow">
                                          <div class="col-sm-12"><img style='width: 50px; height: 50px; text-align: left; margin-right: 5px;' src="/resources/profileImage/${cmt.app_cmt_writer}.png"></div>
                                          <div class="col-sm-12 rwiDiv" style='text-align: left;'>${cmt.app_cmt_writer }
                                          <input type="hidden" class="cmtSeq" value="${cmt.app_cmt_seq }">
                                             &nbsp&nbsp|&nbsp&nbsp ${cmt.app_cmt_date}&nbsp&nbsp|&nbsp&nbsp
                                             <c:choose>
                                             	<c:when test="${cmt.app_cmt_writer eq sessionScope.id}">
		                                             <button class="btnDelete">삭제</button>
                                             	</c:when>
                                             	<c:otherwise></c:otherwise>
                                             </c:choose>
                                             </div>
                                          </div>
    									<div class="row add_recomment">
                                          <div class="col-sm-12">
                                             <div class="col-sm-12">${cmt.app_cmt_contents }<input type="hidden" name="cmt_seq" value=${cmt.app_cmt_seq }>
                                             </div>
                                          </div>
                                       </div>
                            		 </div>
	                    		</c:forEach>
	                    		</c:if>	
	                    		<c:if test="${empty cmts }">작성된 의견이 없습니다</c:if>
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

	<!-- END WRAPPER -->
	<script>
		
		//결재관련 스크립트
		document.getElementById("btnSign").onclick = function(data){
			let check = confirm("결재하시겠습니까?");
			if(check){
				location.href="/approval/signApproval.approval?isAccept=Y&app_seq="+${app_seq}+"&app_type_code="+${app.app_type_code};
			}
		}
		document.getElementById("btnRtrn").onclick = function(data){
			let check = confirm("반송하시겠습니까?");
			if(check){
				location.href="/approval/signApproval.approval?isAccept=N&app_seq="+${app_seq}+"&app_type_code="+${app.app_type_code};
			}
		}
		
	</script>	
	
	<script>
		document.getElementById("btnWrite").onclick = function(){
					let form = document.getElementById("cmtForm");
					let contents = document.getElementById("cmtArea").value
					if(contents==''){
						alert("빈 댓글을 작성할 수 없습니다");return;
					}
					setCookie("cmtFlag","true", 1);
					//댓글작성 비동기 전송
					$.ajax({
						url : "/approval/writeCmt.approval?app_seq=${app_seq }",
						method : 'POST',
						dataType : 'json',
						data : {
							app_cmt_contents : contents
						},
						success : function(data){
							location.reload();
						},
						error : function(){
							alert('댓글을 작성하지 못하였습니다');
						}
						
					})
				}
		$(".btnDelete").on("click",function(){
			let seq = $(this).closest(".rwiDiv").children("input[type='hidden']").val();
			$.ajax({
				url : "/approval/delCmt.approval",
				method : 'POST',
				dataType : 'json',
				data : {
					app_cmt_seq : seq
				},
				success : function(data){
					location.reload();
				},
				error : function(){
					alert('댓글을 삭제하지 못하였습니다');
				}
				
			})
		})
		</script>
	<script>
	//댓글작성 후 새로고침인지 알려주는 cookie flag 생성,삭제,가져오기 function
	var setCookie = function(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp*24*60*60*1000);
		document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
		};
	var getCookie = function(name) {
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value? value[2] : null;
		};
	var deleteCookie = function(name) {
		setCookie(name, "", -1);
		}
		//댓글 작성 후 스크롤 맨 아래로 내리기
		window.onload = function(){
			let commentFlag = getCookie("cmtFlag");
			if(commentFlag=='true'){
				deleteCookie("cmtFlag");
				setTimeout(function(){
					window.scrollTo( 0, document.body.scrollHeight);
					
					
				})
			}
		}
	</script>
	<script>
		// 결재버튼 누른 후 뒤로가기 버튼 눌렀을 시, 버튼 눌리기 전 페이지로 가는 문제 해결
		window.onpageshow = function(event) {
		    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
			// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
			//해당 페이지가 불려온 페이지로 돌아간다.
			history.back();
		    }
		}
	</script>
</body>
</html>