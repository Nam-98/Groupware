<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 공지사항 뷰</title>
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
* {
   box-sizing: border-box;
}

.top-vacant {
   width: 100%;
   height: 50px;
   /*    background-color: yellow; */
}

.contents {
   padding: left;
   width: 500px;
   height: 500px;
}

.comments {
   width: 1200px;
}

.reply-write>form {
   display: block;
   width: 100%;
}

.reply-write>form>table {
   width: 100%;
   border-collapse: collapse;
}

.reply-write>form>table th, .reply-write>form>table td {
   border: 1px solid black;
   padding: 10px;
}

.reply-write>form>table textarea {
   width: 100%;
   display: block;
   box-sizing: border-box;
   height: 100px;
}

.template-box {
   display: none;
}

.reply-list>table {
   width: 100%;
   border-collapse: collapse;
}

.reply-list>table th, .reply-list>table td {
   border: 1px solid black;
   text-align: center;
   padding: 5px 0;
}

.reply-list .reply-body-td {
   text-align: left;
   padding-left: 5px;
   padding-right: 5px;
}

.show-reply{
 text-decoration: underline;
 font-size: 10px; 
 font-weight: bold;
 margin-left: 15px;
 cursor: pointer;
}
</style>

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
            <div class="container-fluid">
               <h3 class="page-title">시스템 공지사항 뷰</h3>
               <button id="list" class="btn pull-left btn-primary">목록으로</button>
               <button id="modify" class="btn pull-left btn-primary">수정하기</button>
               <button id="delete" class="btn pull-left btn-primary">삭제하기</button>
               <div class="top-vacant d-none d-lg-block"></div>
               <div class="panel panel-headline demo-icons">
                  <div class="panel-heading">
                     <h3 class="panel-title">${dtos.write_title }</h3>
                     <input id="brWriteId" type="hidden" value="${dtos.write_seq }"><br>
                     ${dtos.write_id }<img style='width: 20px; height: 20px; line-height: 23px; margin-left: 5px;' src="/resources/profileImage/${dtos.write_id }.png">
                     <input id="loginId" type="hidden" value="${sessionScope.id}">&nbsp&nbsp|&nbsp&nbsp
                     ${dtos.write_reg_date_wr } &nbsp&nbsp|&nbsp&nbsp 조회수 :
                     ${dtos.write_read_count }
                  </div>
                  <hr>
                  <div class="panel-body">
                     <div class="contents" colspan="12" class="col-12">${dtos.write_contents}</div>
                  </div>
                  <hr>
                  <hr>
                  <div class="panel-body">
                     <div class="reply-list con">
                              <div class="well">   
                              	 <c:if test="${not empty list }">
	                    			<c:forEach var="i" items="${list }">
	                    			<div class="rows">
                                       <div class="row replyRow">
                                          <div class="col-sm-12"><img style='width: 50px; height: 50px; text-align: left; margin-right: 5px;' src="/resources/profileImage/${dtos.write_id }.png"></div>
                                          <div class="col-sm-12 rwiDiv" style='text-align: left;'>${i.write_cmt_id }
                                          <input type="hidden" class="reWriteId" value="${i.write_cmt_id }">
                                          <input type="hidden" value="${i.write_cmt_parent_seq }">
                                          <input type="hidden" class="reWritePseq" value="${i.write_cmt_seq }">
	                                      <input type="hidden" value="${i.write_seq }">
	                                      <input type="hidden" value="${i.write_cmt_contents }">
	                                      <input type="hidden" value="${i.write_cmt_date }">
                                             &nbsp&nbsp|&nbsp&nbsp ${i.write_cmt_date}&nbsp&nbsp|&nbsp&nbsp
                                             <c:choose>
                                             	<c:when test="${i.write_cmt_id eq sessionScope.id}">
		                                             <button class="btnDelete">삭제</button>
                                             	</c:when>
                                             	<c:otherwise></c:otherwise>
                                             </c:choose>
                                             </div>
                                          </div>
    									<div class="row add_recomment">
                                          <div class="col-sm-12">
                                             <div class="col-sm-12">${i.write_cmt_contents } <input type="hidden" name="cmt_seq" value=${i.write_cmt_seq }>
                                             </div>
                                          </div>
                                       </div>
                                       
                                       <label class="show-reply"><input type="hidden" class="reply" value="F">답변달기</label>
                                       <div class="re_comment_write_frm"  style="display: none;">
                                      	 <input type="text" class="reWrite" name="reply-write" style='width:1000px;'>
                                       	 <button type="button" class="reply-submit">작성</button>
                                       </div>
                                       <div class="reply-list">
                                       	
                                       	
                                       </div>
                                       <br>
                            		 </div>
                                     </c:forEach>
                        				</c:if>
                          
                              </div>
                     </div>
                     <hr>
                     <div class="reply-write con ">
                        <h3>댓글쓰기</h3>
                        <br>
                        <textarea style='resize: none; width: 100%; height: 200px' id="brWriteArea" placeholder="내용을 입력해주세요." name="body"  maxlength="300"></textarea>
                        <br>
                        <button id="brWrite" class="btn btn-primary" type="button">작성</button>
                        <button id="brReset" class="btn btn-primary" type="button">취소</button>
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
</body>
<script>
	$('.show-reply').click(function() {
		var a = $(this).parent().find($('.re_comment_write_frm'));
		var write_cmt_seq = $(this).parent().find($('input[name=cmt_seq]')).val();
		var replyList = $(this).parent().find($('.reply-list'));
		var reply = $(this).children(".reply");
		if(reply.val() == 'Y'){
			$(this).parent().children(".re_comment_write_frm").css("display","none");
			$(this).parent().children(".reply-list").css("display","none");
			
			replyList.empty();
			reply.val('F');
			
		}else if(reply.val() == 'F'){
			$(this).parent().children(".reply-list").css("display","inline");
			a.css('display','block');
			reply.val('Y');
			console.log(reply.val);
			$.ajax({
	             url : "${pageContext.request.contextPath}/write/reCommentList.write",
	             method : 'POST',
	             dataType : 'json',
	             data : {
	                write_cmt_seq : write_cmt_seq
	             },
	             success : function(data) {
	            	 for(var i=0; i<data.reCmtList.length; i++){
	            		 replyList.append(
	            				 '<div class="bundle">'
								 +'<div class="row">'
								 + '<div class="col-sm-12" style="text-align: left;">'
								 + '&nbsp&nbsp|&nbsp&nbsp'
	            				 + data.reCmtList[i].write_cmt_id
	            				 + '&nbsp&nbsp|&nbsp&nbsp'
	            				 + data.reCmtList[i].write_cmt_contents
	            				 + '&nbsp&nbsp|&nbsp&nbsp'
	            				 + data.reCmtList[i].write_cmt_date
	            				 + '&nbsp&nbsp|&nbsp&nbsp'
	            				 + '<button type="button" class="btnReDelete">삭제</button>'
	            				 + '</div>'
	            				 + '<input type="hidden" name="re_cmt_seq" value="'+data.reCmtList[i].write_cmt_seq+'">'
	            				 + '</div>'
	            				 );
	            	 };
	            	 reply.val('Y');
	             },   error : function(data) {
	                 console.log('컨트롤러 못가');
	             }
			 }) 
		}
		else{
			console.log('아무것도 인식 안돼');

		}
	})
	

	$('.reply-submit').click(function() {
						var reText = $(this).closest('div').children('.reWrite').val();
						var reId = $('.reWrite').parent().parent().parent().parent().parent().parent().parent().find('#loginId').val();
						var reBid = $('.reWrite').parent().parent().parent().parent().parent().parent().find('#brWriteId').val();
						var rePid = $(this).closest(".rows").children(".replyRow").children(".rwiDiv").children(".reWritePseq").val();
						var insertReplyArea = $(this).closest('div');

						console.log(reId);
						console.log(reBid);
						console.log(reText);
						console.log(insertReplyArea);
						console.log(rePid);

						if (!reText) {
							console.log('내용을 입력해주세요');
						} else {
							$.ajax({
										url : "${pageContext.request.contextPath}/write/reCommentWrite.write",
										method : 'POST',
										dataType : 'json',
										data : {
											write_cmt_id : reId,
											write_seq : reBid,
											write_cmt_contents : reText,
											write_cmt_parent_seq : rePid
										},
										success : function(data) {
										console.log(data);
										$(".reWrite").val("");
										insertReplyArea.last().append(
												 '<div class="bundle">'
												 +'<div class="row">'
												 + '<div class="col-sm-12" style="text-align: left;">'
												 + '&nbsp&nbsp|&nbsp&nbsp'
					            				 + data.reCmtList[0].write_cmt_id
					            				 + '&nbsp&nbsp|&nbsp&nbsp'
					            				 + data.reCmtList[0].write_cmt_contents
					            				 + '&nbsp&nbsp|&nbsp&nbsp'
					            				 + data.reCmtList[0].write_cmt_date
					            				 + '&nbsp&nbsp|&nbsp&nbsp'
					            				 + '<button type="button" class="btnReDelete">삭제</button>'
					            				 + '</div>'
					            				 + '<input type="hidden" name="re_cmt_seq" value="'+data.reCmtList[0].write_cmt_seq+'">'
					            				 + '</div>'
					            				 );
						},
				});
			}
		});
	</script>

	<script>

	$('#brWrite').click(function() {
						var brText = $('#brWriteArea').val();
						var id = $('#brWrite').parent().parent().parent().parent().parent().parent().find('#loginId').val();
						var bId = $('#brWrite').parent().parent().parent().parent().parent().parent().find('#brWriteId').val();
						var insertCommentArea = $(".well");
						console.log(id);
						console.log(bId);
						console.log(brText);
						console.log(insertCommentArea);

						if (!brText) {
							console.log('내용을 입력해 주세요');

						} else {
							$.ajax({
										url : "${pageContext.request.contextPath}/write/commentWrite.write",
										method : 'POST',
										dataType : 'json',
										data : {
											write_seq : bId,
											write_cmt_id : id,
											write_cmt_contents : brText
										},
										success : function(data) {
											document.getElementById("brWriteArea").value = "";
											console.log(data.cmtList[0].write_cmt_contents);
											console.log(data.cmtList[0].write_cmt_date);
											console.log(data.cmtList[0].write_cmt_id);
											console.log(data.cmtList[0].write_cmt_seq);
											insertCommentArea.first().append(
															'<div class="rows">'
																	+ '<div class="row">'
																	+ '<div class="col-sm-12"><img style="width: 50px; height: 50px; text-align: left; margin-right: 5px;" src="/resources/profileImage/${dtos.write_id }.png"></div>'
																	+ '<div class="col-sm-12" style="text-align: left;">'
																	+ data.cmtList[0].write_cmt_id
																	+ ' &nbsp&nbsp|&nbsp&nbsp'
																	+ data.cmtList[0].write_cmt_date
																	+ '&nbsp&nbsp|&nbsp&nbsp'
																	+ '<button class="btnDelete">삭제</button>'
																	+ '</div>'
																	+ '</div>'
																	+ '<div class="row">'
																	+ '<div class="col-sm-12">'
																	+ '<div class="col-sm-12">'
																	+ data.cmtList[0].write_cmt_contents
																	+ '<input type="hidden" name="cmt_seq" value="'+data.cmtList[0].write_cmt_seq+'">'
																	+ '</div>'
																	+ '</div>'
																	+ '</div>'
																	+ '<label class="show-reply">답변달기</label>'
																	+ '</div>'
																	);
											window.location.reload();

										},
										error : function(data) {
											console.log('컨트롤러 못가');
										}
									})

						}
					})

	$(document).on('click','.btnDelete',function() {
						var parentTr = $(this).parent().parent().parent();
						var write_cmt_seq = $(this).parent().parent().parent().find('input[name=cmt_seq]').val();
						console.log(write_cmt_seq);
						console.log(parentTr);
						$.ajax({
									url : "${pageContext.request.contextPath}/write/commentDelete.write",
									type : "POST",
									dataType : "json",
									data : {
										write_cmt_seq : write_cmt_seq
									},
									success : function(data) {
										console.log(data);
										parentTr.remove();
										console.log('삭제됨');
									},
									error : function(data) {
										console.log(data);
										console.log('삭제안돼');
									}
								});

					})
		$(document).on('click','.btnReDelete',function() {
							var parentTr = $(this).parent().parent().parent();
							var write_cmt_seq = $(this).parent().parent().parent().find('input[name=re_cmt_seq]').val();
							console.log(write_cmt_seq);
							console.log(parentTr);
							$.ajax({
										url : "${pageContext.request.contextPath}/write/commentReDelete.write",
										type : "POST",
										dataType : "json",
										data : {
											write_cmt_seq : write_cmt_seq
										},
										success : function(data) {
											console.log(data);
											parentTr.remove();
											console.log('삭제됨');
										},
										error : function(data) {
											console.log(data);
											console.log('삭제안돼');
										}
									});
	
						})			

	document.getElementById("list").onclick = function() {
		location.href = "/write/systemNoticeList.write?cpage=1";
	}

	if ("${dtos.write_id}" == "${sessionScope.id}") {

		document.getElementById("delete").onclick = function() {
			location.href = "/write/deleteBoardWrite.write?write_seq=${dtos.write_seq}";
		}
		document.getElementById("modify").onclick = function() {
			location.href = "/write/modifyBeforeBoard.write?write_seq=${dtos.write_seq}";
		}

	} else {
		document.getElementById("delete").style.visibility = "hidden";
		document.getElementById("modify").style.visibility = "hidden";

	}
</script>
</html>