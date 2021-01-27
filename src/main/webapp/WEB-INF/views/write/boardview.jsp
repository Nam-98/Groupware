<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 게시판 뷰</title>
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
<!-- 	댓글 스크립트 -->
	<script>
	// 필수변수들
	var articleId = ${id};
	var loginedMemberId = 1;
	var loginedMemberName = '홍길동';
	var isLogined = loginedMemberId != 0;

	var Article__lastReceivedReplyId = 9;

	function Article__writeReply(form) {
	    if ( isLogined == false ) {
	        alert('로그인 후 이용해주세요');
	        return;
	    }
	    
	    form.body.value = form.body.value.trim();
	    
	    if ( form.body.value.length == 0 ) {
	        form.body.focus();
	        
	        alert('내용을 입력해주세요.');
	        return;
	    }
	    
	    var $form = $(form);
	    
	    form.body.value = '';
	    
	    $form.find('input[type="submit"]').val('작성중..');
	    $form.find('input[type="submit"]').prop('disabled', true);
	    $form.find('input[type="reset"]').prop('disabled', true);
	}

	function Article__drawReply(reply) {
	    Article__lastReceivedReplyId = reply.id;
	    
	    var $tbody = $('.reply-list table > tbody');
	    
	    var templateHtml = $('.template-box-2 tbody').html();
	    
	    var 번호 = reply.id;
	    var 작성자 = reply.writerName;
	    var 내용 = reply.body;
	    var 날짜 = reply.regDate.substr(2, 14);
	    var 작성자번호 = reply.memberId;
	    
	    var trHtml = templateHtml;

	    trHtml = replaceAll(trHtml, "{$번호}", 번호);
	    trHtml = replaceAll(trHtml, "{$작성자}", 작성자);
	    trHtml = replaceAll(trHtml, "{$내용}", 내용);
	    trHtml = replaceAll(trHtml, "{$날짜}", 날짜);
	    trHtml = replaceAll(trHtml, "{$작성자번호}", 작성자번호);
	    
	    $tbody.prepend(trHtml);
	}

	function Article__modifyReply(form) {
	    form.body.value = form.body.value.trim();
	    
	    if ( form.body.value.length == 0 ) {
	        form.body.focus();
	        
	        alert('내용을 입력해주세요.');
	        return;
	    }
	    
	    var $tr = $(form).closest('tr');
	    
	    $tr.attr('data-modify-mode', 'N');
	    
	    var newBody = form.body.value;
	    var id = form.id.value;
	    
	    // 실제 서버에서 실행
	    $tr.find(' > .reply-body-td > .modify-mode-invisible').empty().append('변경중..');
	    
	    $.post('./doModifyReply', {
	        id:id,
	        body: newBody
	    }, function(data) {
	        if ( data.resultCode.substr(0, 2) == 'S-' ) {
	            $tr.find(' > .reply-body-td > .modify-mode-invisible').empty().append(newBody);
	        }
	        else {
	            alert(data.msg);
	        }
	    }, 'json');
	}

	function Article__deleteReply(el) {
	    if ( isLogined == false ) {
	        alert('권한이 없습니다.');
	        return;
	    }
	    
	    var $tr = $(el).closest('tr');
	    
	    var id = parseInt($tr.attr('data-reply-id'));
	    var writerId = parseInt($tr.attr('data-reply-writer-id'));
	    
	    if ( loginedMemberId != writerId ) {
	        alert('권한이 없습니다.');
	        return;
	    }
	    
	    if ( confirm(id + '번 댓글을 삭제하시겠습니까?') == false ) {
	        return;
	    }
	    
	    $.post(
	        './doDeleteReply',
	        {
	            id:id
	        },
	        function(data) {
	            if ( data.resultCode.substr(0, 2) == 'S-' ) {
	                $tr.remove();
	            }
	            else {
	                alert(data.msg);
	            }
	        }
	    );
	}

	function Article__turnOnModifyMode(el) {
	    if ( isLogined == false ) {
	        alert('권한이 없습니다.');
	        return;
	    }
	    
	    var $tr = $(el).closest('tr');
	    
	    var writerId = parseInt($tr.attr('data-reply-writer-id'));
	    
	    if ( loginedMemberId != writerId ) {
	        alert('권한이 없습니다.');
	        return;
	    }
	    
	    var body = $tr.find(' > .reply-body-td > .modify-mode-invisible').html().trim();
	    
	    $tr.find(' > .reply-body-td > .modify-mode-visible > form > textarea').val(body);
	    
	    $tr.attr('data-modify-mode', 'Y');
	    $tr.siblings('[data-modify-mode="Y"]').attr('data-modify-mode', 'N');
	}

	function Article__turnOffModifyMode(el) {
	    var $tr = $(el).closest('tr');
	    
	    $tr.attr('data-modify-mode', 'N');
	}


	function replaceAll(str, searchStr, replaceStr) {
	    return str.split(searchStr).join(replaceStr);
	}
	</script>
	
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

.reply-list > table > tbody > tr[data-modify-mode="N"] .modify-mode-visible {
    display:none;
}

.reply-list > table > tbody > tr[data-modify-mode="Y"] .modify-mode-invisible {
    display:none;
}

.reply-list > table > tbody > tr > .reply-body-td > .modify-mode-visible > form {
    width:100%;
    display:block;
}

.reply-list > table > tbody > tr > .reply-body-td > .modify-mode-visible > form > textarea {
    width:100%;
    height:100px;
    box-sizing:border-box;
    display:block;
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
					<h3 class="page-title">회사 게시판 뷰</h3>
					<div class="maincontainer">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="col-7">제목 : ${dtos.write_title }</th>
							<th scope="col" class="col-2">작성자 : ${dtos.write_id }</th>
							<th scope="col" class="col-2">작성일 : ${dtos.write_reg_date }</th>
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
            <col width="50">
            <col width="150">
            <col width="200">
            <col>
            <col width="100">
        </colgroup>
        <thead>
            <tr>
                <th>번호</th>
                <th>날짜</th>
                <th>글쓴이</th>
                <th>내용</th>
                <th>비고</th>
            </tr>
        </thead>
        <tbody>
            <tr data-modify-mode="N" data-reply-id="9" data-reply-writer-id="3">
                <td>1</td>
                <td>
                    21-01-26 00:00
                </td>
                <td>
                    작성자
                </td>
                <td class="reply-body-td">
                    <div class="modify-mode-invisible">
                        댓글 어케해야하나요.......
                    </div>
                    <div class="modify-mode-visible">
                        <form action="" onsubmit="Article__modifyReply(this); return false;">
                            <input type="hidden" name="id" value="9">
                            <textarea maxlength="300" name="body"></textarea>
                            <input type="submit" value="수정완료">
                            <a href="javascript:;" onclick="Article__turnOffModifyMode(this);">수정취소</a>
                        </form>
                    </div>
                </td>
                <td>
                    <a href="javascript:;" onclick="Article__deleteReply(this);">삭제</a>
                    <a class="modify-mode-invisible" href="javascript:;" onclick="Article__turnOnModifyMode(this);">수정</a>
                    <a class="modify-mode-visible" href="javascript:;" onclick="Article__turnOffModifyMode(this);">수정취소</a>
                </td>
            </tr>

            <tr data-modify-mode="N" data-reply-id="8" data-reply-writer-id="2">
                <td>2</td>
                <td>
                    21-01-26 00:00
                </td>
                <td>
                    작성자2
                </td>
                <td class="reply-body-td">
                    <div class="modify-mode-invisible">
                        우웩 댓글 토나와
                    </div>
                    <div class="modify-mode-visible">
                        <form action="" onsubmit="Article__modifyReply(this); return false;">
                            <input type="hidden" name="id" value="8">
                            <textarea maxlength="300" name="body"></textarea>
                            <input type="submit" value="수정완료">
                            <a href="javascript:;" onclick="Article__turnOffModifyMode(this);">수정취소</a>
                        </form>
                    </div>
                </td>
                <td>
                    <a href="javascript:;" onclick="Article__deleteReply(this, 8);">삭제</a>
                    <a class="modify-mode-invisible" href="javascript:;" onclick="Article__turnOnModifyMode(this);">수정</a>
                    <a class="modify-mode-visible" href="javascript:;" onclick="Article__turnOffModifyMode(this);">수정취소</a>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="template-box template-box-2">
    <table border="1">
        <tbody>
            <tr data-modify-mode="N" data-reply-id="{$번호}" data-reply-writer-id="{$작성자번호}">
                <td>{$번호}</td>
                <td>
                    {$날짜}
                </td>
                <td>
                    {$작성자}
                </td>
                <td class="reply-body-td">
                    <div class="modify-mode-invisible">{$내용}</div>
                    <div class="modify-mode-visible">
                        <form action="" onsubmit="">
                            <input type="hidden" name="id" value="{$번호}">
                            <textarea maxlength="300" name="body"></textarea>
                            <input type="submit" value="수정완료">
                            <a href="javascript:;" onclick="Article__turnOffModifyMode(this);">수정취소</a>
                        </form>
                    </div>
                </td>
                <td>
                    <a href="javascript:;" onclick="Article__deleteReply(this);">삭제</a>
                    <a class="modify-mode-invisible" href="javascript:;" onclick="Article__turnOnModifyMode(this);">수정</a>
                    <a class="modify-mode-visible" href="javascript:;" onclick="Article__turnOffModifyMode(this);">수정취소</a>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<br>
<div class="reply-write con">
			    <form action="" onsubmit="Article__writeReply(this); return false;">
			        <table>
			            <colgroup>
			                <col width="100">
			            </colgroup>
			            <tbody>
			                <tr>
			                    <th>내용</th>
			                    <td>
			                        <div>
			                            <textarea placeholder="내용을 입력해주세요." name="body" maxlength="300"></textarea>
			                        </div>
			                    </td>
			                </tr>
			                <tr>
			                    <th>작성</th>
			                    <td>
			                        <input type="submit" value="작성">
			                        <input type="reset" value="취소">
			                    </td>
			                </tr>
			            </tbody>
			        </table>
			    </form>
			</div>
				<div class="btn">
					<button id="list" class="btn pull-left btn-primary">목록으로</button>
					<button id="modify" class="btn pull-left btn-primary">수정</button>
					<button id="delete" class="btn pull-left btn-primary">삭제</button>
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
	document.getElementById("list").onclick=function(){
		location.href="/write/boardList.write?cpage=1"
	}
	
	if ("${dtos.write_id}" == "${sessionScope.id}") {
		
		document.getElementById("delete").onclick = function() {
			location.href = "/write/deleteBoardWrite.write?write_seq=${dtos.write_seq}";
		}
		document.getElementById("modify").onclick = function() {
			location.href = "/write/modifyBeforeBoard.write?write_seq=${dtos.write_seq}";
		}
	}else{
		document.getElementById("delete").style.visibility = "hidden";
		document.getElementById("modify").style.visibility = "hidden";
	}
</script>
</body>
</html>