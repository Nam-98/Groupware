<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.panel-body div {
	border: 1px solid black;
}
.popupSpan {
	cursor: pointer;
}
</style>
<head>
<meta charset="UTF-8">
<title>웹하드</title>
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
		<!-- 		<nav class="navbar navbar-default navbar-fixed-top"> -->
		<%-- 			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" /> --%>
		<!-- 		</nav> -->
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/webhard/leftWebhard.jsp" />
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-body">
							<div class="control">
								<form method="post" enctype="multipart/form-data" action="/webhard/uploadFile.webhard?dirSeq=${dirSeq }">
									<input type="submit" value="upload">
									<input type="button" value="download" id="download-btn">
									<input type="file" name="attfiles" multiple>
									<input type= "button" value="새폴더 만들기" id="newFolder-btn">
								</form>
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col"><input class="form-check-input checkAll" type="checkbox" value="" id="flexCheckDefault"></th>
										<th scope="col">형식</th>
										<th scope="col">파일명</th>
										<th scope="col">업로드일</th>
									</tr>
								</thead>
								<tbody>
									<!-- 폴더 표현 부분 -->
									<c:forEach varStatus="j" var="folderList" items="${dirFolderList}">
										<tr>
											<th scope="row"><!-- 폴더체크박스 없음 --></th>
											<td><span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span></td>
											<td>
											<a href = "/webhard/webhardMain.webhard?dirSeq=${folderList.wh_dir_seq}"> ${folderList.wh_dir_name}</a>
											
											</td>
											<td><!-- 폴더생성일 없음 --></td>
										</tr>
									</c:forEach>
									<!-- 파일 표현 부분 -->
									<c:forEach var="i" items="${dirFileList}">
										<tr>
											<th scope="row"><input class="form-check-input checkObj" type="checkbox" value="${i.wh_files_seq}" name="chkList"></th>
											<td><span class="glyphicon glyphicon-file" aria-hidden="true"></span></td>
											<td>
											<a href = "/webhard/attFilesDown.webhard?wh_files_seq=${i.wh_files_seq }&wh_ori_name=${i.wh_ori_name}&wh_saved_name=${i.wh_saved_name}"> ${i.wh_ori_name}</a>
											
											</td>
											<td>${i.wh_upload_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
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
		$(".main").css({
			"padding-top": "0px"
		});
		$(".checkAll").on("click",function(){
            if ($(".checkAll").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
		})
		$(".checkObj").on("click",function(){
			$(".checkAll").prop("checked", false);
		})
		$("#download-btn").on("click",function(){
			  var chked_val = "";
			  $(":checkbox[name='chkList']:checked").each(function(pi,po){
			    chked_val += ","+po.value;
			  });
			  if(chked_val != "") {
				  chked_val = chked_val.substring(1);
			  }
			  alert(chked_val)
// 			  return chked_val;
		})
		$("#newFolder-btn").on("click",function(){
			var newFolderName = prompt('새 폴더 이름을 입력해 주세요.'); 
			if ((newFolderName != null) && (newFolderName != "")) {
			// 해당 디렉토리에 중복되는 폴더 이름이 있는지 확인
				$.ajax({
					url:'/webhard/mkdirOverlapCheck.webhard',
					type:'post',
					data:{dirSeq:"${dirSeq }", newFolderName:newFolderName},
					success:function(resp){
						if (resp > 0) {
							alert(newFolderName + "과(와) 동일한 이름을 가진 \n파일 또는 폴더가 이미 존재합니다.");
							return 1;
						}else{
							location.href = "/webhard/mkdirProcess.webhard?dirSeq=" +${dirSeq }+ "&newFolderName=" +newFolderName;
						}
					}
					
				})
			}
		})
	</script>
</body>
</html>