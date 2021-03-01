<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
td{
	border: 0px solid black;
/* 	text-align: center; */
}
th{
	border: 0px solid black;
/* 	text-align: center; */
}
.checkArea{
	width: 5%;
}
.typeArea{
	width: 15%;
	text-align: center;
}
.titleArea{
	width: 60%;
}
.dateArea{
	width: 20%;
	text-align: center;
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
					<h3 class="page-title">
					Webhard [${nowDirName }]
					</h3>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<form method="post" enctype="multipart/form-data" action="/webhard/uploadFile.webhard?dirSeq=${dirSeq }" id="uploadForm">
								<div class="navbar-form navbar-left" role="control">
								
    								<span id="upload-btn" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-open"></span> Upload</span>
									<span id="newFolder-btn" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-plus"></span> New Folder</span>
									<span id="parentFolder-btn" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-level-up"></span> To Parent Folder</span>
									<span id="download-btn" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-save"></span> Download</span>
									<span id="checkDel-btn" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-trash"></span> Delete</span>
									<span id="rename-btn" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-erase"></span> Rename</span>
									
									<!-- 보이지않는 파일 첨부 영역 -->
									<input type="file" name="attfiles" id="attfiles" multiple style="display:none">
									
								</div>
								
								<div class="navbar-form navbar-right" role="search">
<!-- 									<input type="text" class="form-control" placeholder="Search"> -->
									<input type="text" class="form-control" placeholder="10MB 이하 업로드 가능">
									<span id="search-btn" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-search"></span></span>
								</div>
							</form>
						</div>
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col" class="checkArea"><input class="form-check-input checkAll" type="checkbox" value="" id="flexCheckDefault"></th>
										<th scope="col" class="typeArea">형식</th>
										<th scope="col" class="titleArea">파일명</th>
										<th scope="col" class="dateArea">수정된 날짜</th>
									</tr>
								</thead>
								<tbody>
									<!-- 폴더 표현 부분 -->
									<c:forEach varStatus="j" var="folderList" items="${dirFolderList}">
										<tr>
											<th scope="row" class="checkArea"><input class="form-check-input checkObj checkFolder" type="checkbox" value="${folderList.wh_dir_seq}" name="chkList"></th>
											<td class="typeArea"><span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span></td>
											<td class="titleArea">
											<a href = "/webhard/webhardMain.webhard?dirSeq=${folderList.wh_dir_seq}"> ${folderList.wh_dir_name}</a>
											
											</td>
											<td class="dateArea"><!-- 폴더생성일 없음 --></td>
										</tr>
									</c:forEach>
									<!-- 파일 표현 부분 -->
									<c:forEach var="i" items="${dirFileList}">
										<tr>
											<th scope="row" class="checkArea"><input class="form-check-input checkObj checkFile" type="checkbox" value="${i.wh_files_seq}" name="chkList"></th>
											<td class="typeArea"><span class="glyphicon glyphicon-file" aria-hidden="true"></span></td>
											<td class="titleArea">
											<a href = "" id="downloadFileId${i.wh_files_seq }"> ${i.wh_ori_name}</a>
											 <script>
											 	var enc = encodeURI("/webhard/attFilesDown.webhard?wh_files_seq=${i.wh_files_seq }&wh_ori_name=${i.wh_ori_name}&wh_saved_name=${i.wh_saved_name}");
											 	$("#downloadFileId${i.wh_files_seq }").attr("href", enc)
											 </script>
											
											</td>
											<td class="dateArea">${i.wh_upload_date}</td>
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
		// 페이지 온로드
		$( document ).ready(function() {
			// 체크박스 개수를 판단해 컴포넌트 노출 제어
			check_result();
			
			// 최상위 디렉토리일 경우 상위 디렉토리 이동버튼 제거
			topDirHide();
			
			// 강제로 panel 최상단으로 끌어올리기
			$(".main").css({
				"padding-top": "0px"
			});
			
			
		});

		
		// 전체체크 버튼 동작
		$(".checkAll").on("click",function(){
            if ($(".checkAll").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
            check_result();
		});
		
		// 단일체크 동작 시 전체체크 해제
		$(".checkObj").on("click",function(){
			$(".checkAll").prop("checked", false);
			check_result();
		});
		
		// 체크 후 다운로드 버튼 클릭 시 동작
		$("#download-btn").on("click",function(){
			// 폴더의 체크값 어레이 선언
			var chkArrFolder = new Array();
			// 파일의 체크값 어레이 선언
			var chkArrFile = new Array();
			
			// 체크된 폴더 리스트 값 담기
			$("input[class='form-check-input checkObj checkFolder']:checked").each(function(){
				chkArrFolder.push($(this).attr("value"));
			});					
			
			// 체크된 파일 리스트 값 담기
			$("input[class='form-check-input checkObj checkFile']:checked").each(function(){
				chkArrFile.push($(this).attr("value"));
			});
			
			// 파일이 하나도 체크되어있지 않다면 함수종료
			if (chkArrFile[0] == null) {
				alert("파일을 하나 이상 선택해 주세요.");
				return 0;
			}
			
			// 특정 문자(특수문자)를 보낼 수 없으므로 인코딩 해서 url값 보냄
			var enc = encodeURI("/webhard/multiFilesDown.webhard?chkArrFile="+chkArrFile);
			location.href = enc;
			
			
			
// 			$.ajax({
// 				url : "/webhard/multiFilesDown.webhard",
// 				type : "post",
// 				data : {"chkArrFile" : chkArrFile},
// 			}).done(function(result){
// // 				location.reload();
// 			})
			
		});
		
		// 새폴더 만들기
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
							// 특정 문자(특수문자)를 보낼 수 없으므로 인코딩 해서 url값 보냄
							var enc = encodeURI("/webhard/mkdirProcess.webhard?dirSeq=" +${dirSeq }+ "&newFolderName=" +newFolderName);
							location.href = enc;
						}
					}
					
				});
			}
		});
		
		// 체크된 폴더 및 파일 삭제
		$("#checkDel-btn").click(function(){
			var confirm_val = confirm("정말 삭제하시겠습니까?");
				
				// 확인 버튼 클릭 시
				if(confirm_val){
					// 폴더의 체크값 어레이 선언
					var chkArrFolder = new Array();
					// 파일의 체크값 어레이 선언
					var chkArrFile = new Array();
					
					// 체크된 폴더 리스트 값 담기
					$("input[class='form-check-input checkObj checkFolder']:checked").each(function(){
						chkArrFolder.push($(this).attr("value"));
					});					
					chkArrFolder.push(-1);
					
					// 체크된 파일 리스트 값 담기
					$("input[class='form-check-input checkObj checkFile']:checked").each(function(){
						chkArrFile.push($(this).attr("value"));
					});
					chkArrFile.push(-1);
					
					$.ajax({
						url : "/webhard/delCheckObject.webhard",
						type : "post",
						data : {"chkArrFolder" : chkArrFolder, "chkArrFile" : chkArrFile},
					}).done(function(result){
						location.reload();
					})
				}
		});
		
		// 파일 컴포넌트가 변경되었을경우 (파일을 첨부하였다면) form submit 하기
		document.getElementById("attfiles").onchange = function() {
		    document.getElementById("uploadForm").submit();
		};
		
		// 업로드 버튼 누를시 file 컴포넌트 누르는 것처럼 연결
		$('#upload-btn').on('click',function(){
			$('#attfiles').click();
		})
		
		// 내 최상위 디렉토리와 비교 후 부모폴더로 이동
		$('#parentFolder-btn').on('click',function(){
// 			// 접근 가능 최상위 디렉토리 리스트 만들기
// 			var topAccessDirList = [
// 				<c:forEach varStatus="i" items="${topAccessDirList}" var="list">
// 				${list}
// 				<c:if test="${!i.last}">,</c:if>
// 				</c:forEach>
// 			];
// 			// 현재 디렉토리가 최상위 디렉토리인지 확인
// 			for (var i = 0; i < topAccessDirList.length; i++) {
// 				if (${dirSeq } == topAccessDirList[i]) {
// 					alert("접근 가능한 최상위 폴더입니다.");
// 					return 0;
// 				}
// 			}
			// 현재 디렉토리의 부모 디렉토리로 이동
			location.href = "/webhard/goToParentDir.webhard?dirSeqChild="+${dirSeq };
		})
		
		// 하나 체크 후 이름변경 클릭 시
		$('#rename-btn').on('click',function(){
			var newFolderName = prompt('변경할 이름을 입력해 주세요.'); 
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
							// 폴더건 파일이건 해당 seq 번호
							var objectSeq;
							// 변경할 대상의 타입
							var dirType;
							
							// 폴더의 체크값 어레이 선언
							var chkArrFolder = new Array();
							// 파일의 체크값 어레이 선언
							var chkArrFile = new Array();
							
							// 체크된 폴더 리스트 값 담기
							$("input[class='form-check-input checkObj checkFolder']:checked").each(function(){
								chkArrFolder.push($(this).attr("value"));
							});					
							
							// 체크된 파일 리스트 값 담기
							$("input[class='form-check-input checkObj checkFile']:checked").each(function(){
								chkArrFile.push($(this).attr("value"));
							});
							
							// 체크된 값이 폴더라면
							if (chkArrFolder[0] != null) {
								objectSeq = chkArrFolder[0];
								dirType = "folder";
								
							// 체크된 값이 파일이라면
							}else if (chkArrFile[0] != null) {
								objectSeq = chkArrFile[0];
								dirType = "file";
							}
							// 특정 문자(특수문자)를 보낼 수 없으므로 인코딩 해서 url값 보냄
							var enc = encodeURI("/webhard/renameObjectProcess.webhard?objectSeq=" +objectSeq+ "&newFolderName=" +newFolderName+"&dirType=" +dirType);
							location.href = enc;
							
						}
					}
					
				});
			}
		});
		
		// 체크박스 개수를 판단해 컴포넌트 노출 제어
		function check_result(){
			// 폴더와 파일의 체크값 어레이 선언
			var chkArrObject = new Array();
			
			// 체크된 폴더 리스트 값 담기
			$("input[class='form-check-input checkObj checkFolder']:checked").each(function(){
				chkArrObject.push($(this).attr("value"));
			});					
			
			// 체크된 파일 리스트 값 담기
			$("input[class='form-check-input checkObj checkFile']:checked").each(function(){
				chkArrObject.push($(this).attr("value"));
			});
			// 체크가 하나도 안되어 있는 경우
			if (chkArrObject.length == 0) {
				$('#download-btn').hide();
				$('#checkDel-btn').hide();
				$('#rename-btn').hide();
				
			// 체크가 딱 하나만 되어있는 경우
			}else if (chkArrObject.length == 1) {
				$('#download-btn').show();
				$('#checkDel-btn').show();
				$('#rename-btn').show();
			
			// 체크가 두개 이상인 경우
			}else if (chkArrObject.length >= 2) {
				$('#download-btn').show();
				$('#checkDel-btn').show();
				$('#rename-btn').hide();
			}
		}
		
		// 최상위 디렉토리일 경우 상위 디렉토리 이동버튼 제거
		function topDirHide(){
			// 접근 가능 최상위 디렉토리 리스트 만들기
			var topAccessDirList = [
				<c:forEach varStatus="i" items="${topAccessDirList}" var="list">
				${list}
				<c:if test="${!i.last}">,</c:if>
				</c:forEach>
			];
			// 현재 디렉토리가 최상위 디렉토리인지 확인
			for (var i = 0; i < topAccessDirList.length; i++) {
				// 맞다면 버튼 숨기기
				if (${dirSeq } == topAccessDirList[i]) {
					$('#parentFolder-btn').hide();
				}
			}
		}
		
		// 검색버튼 클릭 시
		$('#search-btn').on('click',function(){
			alert("준비 중입니다.");
		});
		
		
		/////////////////////////////////
		
		// 드래그 앤 드롭 테스트
		$(function () {
			var obj = $(".panel-body");

			obj.on('dragenter', function (e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '2px solid #5272A0');
			});

			obj.on('dragleave', function (e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '0px dotted #8296C2');
			});

			obj.on('dragover', function (e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '2px dotted #8296C2');
			});

			obj.on('drop', function (e) {
			e.preventDefault();
			$(this).css('border', '2px dotted #8296C2');

			var attfiles = e.originalEvent.dataTransfer.files;
			if(attfiles.length < 1)
				return;

			F_FileMultiUpload(attfiles, obj);
			});

		});
		
	
		// 파일 멀티 업로드
		function F_FileMultiUpload(attfiles, obj) {
			if(confirm(attfiles.length + "개의 파일을 업로드 하시겠습니까?\n(파일만 업로드 가능합니다)") ) {
				var data = new FormData();
				
				data.append('dirSeq', ${dirSeq});
				for (var i = 0; i < attfiles.length; i++) {
					data.append('attfiles', attfiles[i]);
				}
				
				
				var url = "/webhard/uploadFile.webhard";
				$.ajax({
					url: url,
					method: 'post',
					data: data,
					dataType: 'json',
					processData: false,
					contentType: false,
					success: function(res) {
						F_FileMultiUpload_Callback(res.attfiles);
					}
				});
				setTimeout("location.reload()",500);
			}
		};

// 		// 파일 멀티 업로드 Callback
// 		function F_FileMultiUpload_Callback(attfiles) {
// 			for(var i=0; i < attfiles.length; i++){
// 				console.log(attfiles[i].file_nm + " - " + attfiles[i].file_size);
// 			}
			
// 		}
		
		
		
	</script>
</body>
</html>