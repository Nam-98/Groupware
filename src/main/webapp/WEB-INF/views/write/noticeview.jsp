<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 뷰</title>
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

.contents {
	padding: left;
	width: 500px;
	height: 500px;
}
.btn{
	float: right;
	margin-left: 5px;
}
.comments{
	width: 1200px;
}
.list{
    position: relative;
    left: 1210px;
}
.comments{
	width: 1200px;
}

.reply-write > form {
    display:block;
    width:100%;
}

.reply-write > form > table {
    width:100%;
    border-collapse:collapse;
}

.reply-write > form > table th, .reply-write > form > table td {
    border:1px solid black;
    padding:10px;
}

.reply-write > form > table textarea {
    width:100%;
    display:block;
    box-sizing:border-box;
    height:100px;
}

.template-box {
    display:none;
}

.reply-list > table {
    width:100%;
    border-collapse:collapse;
}

.reply-list > table th, .reply-list > table td {
    border:1px solid black;
    text-align:center;
    padding:5px 0;
}

.reply-list .reply-body-td {
    text-align:left;
    padding-left:5px;
    padding-right:5px;
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
					<h3 class="page-title">공지사항</h3>
					<div class="maincontainer">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="col-7">제목 : ${dtos.write_title }<input id="brWriteId" type="hidden" value="${dtos.write_seq }"></th>
							<th scope="col" class="col-2">작성자 : ${dtos.write_id } <input id="loginId" type="hidden" value="${sessionScope.id}"></th>
							<th scope="col" class="col-2">작성일 : ${dtos.write_reg_date_wr }</th>
							<th scope="col" class="col-1">조회수 : ${dtos.write_read_count }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="contents" colspan="4">${dtos.write_contents }</td>
						</tr>
					</tbody>
				</table>
				<div class="reply-list con">
    <table>
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
            <col width="100">
        </colgroup>
        <thead>
            <tr>
                <th>날짜</th>
                <th>글쓴이</th>
                <th>내용</th>
                <th>비고</th>
            </tr>
        </thead>
        <tbody id="commentsBody">
        <c:if test="${not empty list }">
        	<c:forEach var="i" items="${list }">
            <tr data-modify-mode="N" data-reply-id="9" data-reply-writer-id="3">
                <td>
                   ${i.write_cmt_date }
                </td>
                <td>
                	${i.write_cmt_id }
                </td>
                <td class="reply-body-td">
                    <div class="modify-mode-invisible">
                   	${i.write_cmt_contents } <input type="hidden" name="cmt_seq" value=${i.write_cmt_seq }>
                    </div>
                </td>
                <td>
                    	<button class="btnDelete">삭제</button>
                </td>
            </tr>
            </c:forEach>
      </c:if>
        </tbody>
    </table>
</div>

<br>
<div class="reply-write con">
			        <table>
			            <colgroup>
			                <col width="100">
			            </colgroup>
			            <tbody>
			                <tr>
			                    <th>내용</th>
			                    <td>
			                        <div>
			                            <textarea id="brWriteArea" placeholder="내용을 입력해주세요." name="body" maxlength="300"></textarea>
			                        </div>
			                    </td>
			                </tr>
			                <tr>
			                    <th>작성</th>
			                    <td>
			                        <button id="brWrite" type="button">작성</button>
			                        <button id="brReset" type="button">취소</button>
			                    </td>
			                </tr>
			            </tbody>
			        </table>
			</div>
				<div class="btn">
					<button id="list" class="btn pull-left btn-primary">목록으로</button>
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
	$('#brWrite').click(function() {
		var brText = $('#brWriteArea').val();
		var id = $('#brWrite').parent().parent().parent().parent().parent().parent().find('#loginId').val();
		var bId = $('#brWrite').parent().parent().parent().parent().parent().parent().find('#brWriteId').val();
		var insertCommentArea = $("#commentsBody");
		console.log(id);
		console.log(bId);
		console.log(brText);
		console.log(insertCommentArea);
		
		if(!brText){
			console.log('내용을 입력해 주세요');
		
			
		}else{
			$.ajax({
				url : "${pageContext.request.contextPath}/write/commentWrite.write",
				method : 'POST',
				dataType: 'json',
				data : {
					write_seq : bId,
					write_cmt_id : id,
					write_cmt_contents : brText
				},
				success : function(data) {
				document.getElementById("brWriteArea").value="";
				
				console.log(data.cmtList[0].write_cmt_contents);
				console.log(data.cmtList[0].write_cmt_date);
				console.log(data.cmtList[0].write_cmt_id);
				console.log(data.cmtList[0].write_cmt_seq);
				insertCommentArea.append(
						 '<tr data-modify-mode="N" data-reply-id="9" data-reply-writer-id="3">'
			                +'<td>'
			                +data.cmtList[0].write_cmt_date
			                +'</td>'
			                +'<td>'
			                 +data.cmtList[0].write_cmt_id
			                +'</td>'
			                +'<td class="reply-body-td">'
			                +'    <div class="modify-mode-invisible">'
			                    +data.cmtList[0].write_cmt_contents
			                    +'<input type="hidden" name="cmt_seq" value="'+data.cmtList[0].write_cmt_seq+'"></div>'
			                +'</td>'
			                +'<td>'
			                 +'<button type=button class=btnDelete>삭제</button>'
			            +   ' </td>'
			        +  '</tr> '
				);
				
				},
				error : function(data) {
					console.log('컨트롤러 못가');
				}
			}) 
			
		}
	})
	
	
	$(document).on('click', '.btnDelete', function() {
		var parentTr = $(this).parent().parent();
		var write_cmt_seq = $(this).parent().parent().find('input[name=cmt_seq]').val();
		console.log(write_cmt_seq);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/write/commentDelete.write",
			type : "POST",
			dataType:"json",
			data : {write_cmt_seq : write_cmt_seq
			},
			 success : function(data) {
				 console.log(data);
				 parentTr.remove();
				console.log('삭제됨');
			}, error : function(data){
				 console.log(data);
				console.log('삭제안돼');
			}
		});
		
		
	})
	</script>
	
	<script>
	document.getElementById("list").onclick=function(){
		location.href="/write/noticeList.write?cpage=1"
	}
	
	if ("${dtos.write_id}" == "${sessionScope.id}") {
		$(".btnDelete").css("display","inline");
	}else{
		$(".btnDelete").css("display","none");
	}
</script>
</body>
</html>