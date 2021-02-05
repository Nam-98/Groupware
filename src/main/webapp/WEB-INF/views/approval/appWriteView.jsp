<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 작성</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
	<!-- VENDOR CSS -->
	<!--<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">-->
	<link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
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
	<!--<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>-->
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
     <!-- jqwidget -->
     <link rel="stylesheet" href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
   <!--  <script type="text/javascript" src="/resources/lib/scripts/jquery-1.11.1.min.js"></script> -->
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxtooltip.js"></script>
   	<script type="text/javascript" src="/resources/lib/jqwidgets/globalization/globalize.js"></script>
<style type="text/css">
/* Remove default bullets */
ul, #myUL1 {
	list-style-type: none;
}

/* Remove margins and padding from the parent ul */
#myUL1 {
	margin: 0;
	padding: 0;
	width: 200px;
	height: 100%;
}

/* Style the caret/arrow */
.caret1 {
	cursor: pointer;
	user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret1::before {
	content: "\25B6";
	color: black;
	display: inline-block;
	margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down1::before {
	transform: rotate(90deg);
}

/* Hide the nested list */
.nested1 {
	display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active1 {
	display: block;
}
.table>thead>tr>th{vertical-align: middle;}
th{width:50px;}
.table>thead>tr>th{border-bottom:none;}
.jqxdate{margin-top:7px;}
</style>
</head>
<body>
<form action="/approval/writeApproval.approval" id="writeForm" method="post" enctype="multipart/form-data" >
		<div class="modal selectSign" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btnClose close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">결재자 선택</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-4">
						<div class="orgTree bg-light bg-gradient modalL">
						<h3 class="text-left">조직도</h3>
							<ul id="myUL1">
								<c:forEach items="${dlist }" var="i">
									<li><span class="caret1">${i.dept_name}</span>
										<ul class="nested1">
											<c:forEach items="${mlist}" var="j">
												<c:if
													test="${j.dept_code == i.dept_code && j.id != sessionScope.id}">
													<li class="modalLi">${j.name}${j.position_name} <input
														type=hidden class="modalPosi" value="${j.position_name}">
														<input type=hidden class="modalName" value="${j.name}">
														<input type=hidden class="modalId" value="${j.id}">
													</li>
												</c:if>
											</c:forEach>
										</ul></li>
								</c:forEach>
							</ul>
						</div>
						</div>
						<div class="col-sm-8">
						<div class="modalR">
							<h3 class="text-right">상세창</h3>
							<table class="table table-sm">
								<thead class='thead-light'>
									<tr>
										<th scope="col">결재순서</th>
										<th scope="col">부서</th>
										<th scope="col">이름</th>
										<th scope="col">직위</th>
										<th scope="col">결재구분</th>
										<th scope="col">삭제</th>
									</tr>
								</thead>
								<tbody id="selectedContainer"></tbody>
							</table>
						</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btnClose" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
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
					<h3 class="page-title">전자결재 문서 작성</h3>
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">기본내용 작성</h3>
						</div>
						<div class="panel-body">
								<table class="table">
									<thead>
										<tr>
											<th scope="row" class="align-middle">문서종류</th>
											<td>
												<select class="form-control form-select-sm" id="docsType" name="app_type_code" style='width:auto;display:inline;'>
													<c:forEach items="${docsType}" var="dto">
														<option value="${dto.app_type_code}">${dto.app_type_name}</option>
													</c:forEach>
												</select>
												<select class="form-control form-select-sm" id="breakType" name="break_code" style='width:auto;display:none;'>
													<c:forEach items="${breakType}" var="dto">
														<option value="${dto.break_code}">${dto.break_name}</option>
													</c:forEach>
												</select>
												<button type=button id="addSign" class="btn btn-outline-dark btn-sm pull-right" data-bs-toggle="tooltip" data-bs-placement="right" title="결재자를 추가하려면 이 버튼을 누르세요">
												결재자 / 참조자 선택 <span class='badge badge-pill badge-primary' id="signCount">0</span>						
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row">보존기간</th>
											<td>
												<div class="form-check form-check-inline">
													 <label class="radio-inline"><input class="form-check-input" type="radio" name="app_archive" value="1" checked>1년 </label>
													 <label class="radio-inline"><input class="form-check-input" type="radio" name="app_archive" value="2" >2년 </label>
													 <label class="radio-inline"><input class="form-check-input" type="radio" name="app_archive" value="3" >3년 </label>
													 <label class="radio-inline"><input class="form-check-input" type="radio" name="app_archive" value="5" >5년 </label>
													 <label class="radio-inline"><input class="form-check-input" type="radio" name="app_archive" value="10" >10년 </label>

												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="align-middle">
												<button type="button" class="btn btn-outline-secondary" id=addFileBlock>첨부파일</button>
											</th>
											<td>
												<div class="fileContainer row"></div>
											</td>
										</tr>
										<tr>
											<td colspan="2"><input type="text" class="form-control form-control-sm" id="title"	placeholder="제목" name="app_title"></td>
										</tr>
										<tr>
									</thead>
								</table>
							</div>
					</div>
					<div class="panel">
								<!-- pannel 내부의 제목 작성 div-->
								<div class="panel-heading">
									<h3 class="panel-title detInfo">상세내용 작성</h3>
									<h3 class="panel-title breakInfo" style="display:none">휴가내용 작성</h3>
								</div>

								<!-- pannel 내부의 내용 작성 div-->
								<div class="panel-body">
									
									<div class=breakInfo style="display:none" >
									<div class="row">
										<div class="col-md-2 col-sm-6"><h5>휴가 시작일</h5></div>
										<div class="col-md-3 col-sm-6">
											<div id='jqxdateStart' class='jqxdate'></div>
											<input type=hidden id=breakSrt name='strStartDate'> 
										</div>
										<div class="col-md-2 col-sm-6"><h5>휴가 종료일</h5></div>
										<div class="col-md-3 col-sm-6"><div id='jqxdateEnd'class='jqxdate'></div>
										<input type=hidden id=breakEnd name='strEndDate'>
										</div>
										<div class="col-md-2 col-sm-6"><button type=button id='setDate'>종료일 자동설정</button></div>
									</div>
									
								</div>
									<div class="row">
										<textarea class="summernote"  ></textarea>
										<input type=hidden name="app_contents" id="contents">
									</div>						
								<!-- pannel footer작성(선택) -->
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-12 text-right">
											<button type="button" class="btn btn-primary" id="appWrite">작성하기</button>

										</div>
									</div>
								</div>
							</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
	</div>
	<!-- END WRAPPER -->

	</form>
	
	<!-- /.modal -->
		<script>
			let sign_info_Json = {};
			let sign_name_Json = [];
			
			//휴가관련 내용
			$("#jqxdateStart").jqxDateTimeInput({ width: '200px', height: '20px' });
			$("#jqxdateEnd").jqxDateTimeInput({ width: '200px', height: '20px' });
			// 종료일 자동설정
	          $("#setDate").click(function () {
	        	  var date = $('#jqxdateStart').jqxDateTimeInput('getDate');
	              $('#jqxdateEnd').jqxDateTimeInput('setDate', date);
	          });

			//글 작성
			$("#appWrite").on("click",function(){
				//결재자 확인
				let signCount = 0;
				if(Object.keys(sign_info_Json).length==0){alert("결재자는 1명 이상이어야 합니다.");return;}
				for(var i=0; i<Object.keys(sign_info_Json).length;i++){
					if(sign_info_Json[sign_name_Json[i]][1]==0){
						signCount++;
					}
				}
				if(signCount==0){
					alert("결재자는 1명 이상이어야 합니다.");
					return;
				}
				//title입력 확인
				if($("#title").val()==''){alert("제목은 필수입력 사항입니다.");return;}
				//본문 입력 확인
				if ($('.summernote').summernote('isEmpty')) {
				  alert('본문내용은 필수 입력사항입니다.');return;
				}
				//휴가계일 때 날짜정보 전송
				if($("#docsType").val()==3){
					$("#breakSrt").val(getFormatDate($('#jqxdateStart').jqxDateTimeInput('getDate')));
					$("#breakEnd").val(getFormatDate($('#jqxdateEnd').jqxDateTimeInput('getDate')));
				}
				
				//contents 전송준비
				$("#contents").val($(".summernote").summernote('code'));
				$("#sign_info_Json").val(JSON.stringify(sign_info_Json));
				$("#writeForm").submit();
				
			})
			//file block
			$("#addFileBlock").on("click",function(){
				let block = $(`<div class="input-group fileBlock" style='display:inline-flex; padding:2px;'><div class="custom-file col-sm-10" style='display:inline;'><input type="file" class="approvalFiles" name='attachedfiles'></div><div class="input-group-append col-sm-2" style='display:inline;'><button class="btn btn-danger btn-sm fileDel" type="button">삭제</button></div></div>`);
				$(".fileContainer").append(block);
			})
			$(".fileContainer").on("click",".fileDel",function(){
				$(this).closest(".fileBlock").remove();
			})
			//summernote 관련 스크립트 
			$(document).ready(function() {
				//여기 아래 부분
				$('.summernote').summernote({
					height : 300, // 에디터 높이
					minHeight : 300, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					toolbar: [
							// [groupName, [list of button]]
							['fontname', ['fontname']],
							['fontsize', ['fontsize']],
							['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
							['color', ['forecolor','color']],
							['table', ['table']],
							['para', ['ul', 'ol', 'paragraph']],
							['height', ['height']],
							['insert',['picture','link','video']],
							['view', ['fullscreen', 'help']]
						  	],
						fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
						fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
				});
				var HTMLstring = `상기와 같은 내용으로 휴가를 신청합니다.`;
				$('#breakEditor').summernote('pasteHTML', HTMLstring);
			});
			//문서종류 변경 이벤트
			$("#docsType").on("change",function(){
				if(this.value==3){
					$("#breakType").css("display","inline");
					$(".breakInfo").css("display","inline");
					$(".detInfo").css("display","none");
				}else{
					$("#breakType").css("display","none");
					$(".breakInfo").css("display","none");
					$(".detInfo").css("display","inline");
				}
			})
			//결재라인 관련 스크립트
			
			////모달창 열기
			$("#addSign").on("click", function() {
				$(".selectSign").show();
			})
			////모달창 닫기
			$(".btnClose").on("click", function() {
				let count = $(".selectedBlock").length;
				$("#signCount").html(count)
				$(".selectSign").hide();
			})
			
			////모달창 내부 조직도 관련 script
			var toggler = document.getElementsByClassName("caret1");
			var i;
	
			for (i = 0; i < toggler.length; i++) {
				toggler[i].addEventListener("click", function() {
					this.parentElement.querySelector(".nested1").classList.toggle("active1");
					this.classList.toggle("caret-down1");
				});
			}
			
			//sign_type의 객체를 arr형태로 저장
			let sign_type_arr = new Array();
			<c:forEach items="${adtList}" var="item" varStatus="i">
				let arr${i.count}= ["${item.app_sign_type_code}","${item.app_sign_type_name}"];
				sign_type_arr.push(arr${i.count});	
			</c:forEach>
			////조직도에서 인원 클릭시 추가 
			$(".modalLi").on("click",function(){
				//이미 같은 사람이 추가되어 있는지 확인
				let list = $(".selectedName");
				let sName = $(this).children(".modalName").val();
				for(var i=0; i<list.length;i++){
					if(sName==list.eq(i).text()){
						alert("결재라인에 같은 사람을 올릴 수 없습니다.");
						return;
					}
	
				}
	
				//왼쪽 상세창에 추가
				let index;
				if(Object.keys(sign_info_Json).length==0){index=0}else{index=Object.keys(sign_info_Json).length}
				let sDept = $(this).parent().parent().children(".caret1").html();
				let sPosi = $(this).children(".modalPosi").val();
				let block = $("<tr class=selectedBlock>");
				let dept = $("<td class='selectedDept'>");
					dept.append(sDept);
				let posi = $("<td class='selectedPosi'>");
					 posi.append(sPosi);
				let name = $("<td class='selectedName'>");
					name.append(sName);
				let del = $("<td class='selectedDel'>");
					del.append($("<i class='far fa-minus-square'></i>"))
				let order = $("<td class='selectedOrder'>");
					let ordercount = index+1;
					order.append(ordercount);
				let signType = $("<td class='selectTypeTd'>")
					let sSt = $("<select class='form-control form-select-sm selectType'>");
					for(var i=0; i<sign_type_arr.length;i++){
						let opt = $("<option value='"+sign_type_arr[i][0]+"'>"+sign_type_arr[i][1]+"</option>");
						sSt.append(opt);
					}
					signType.append(sSt);
				//form으로 보낼 데이터 작성	
				let hId = $("<input type=hidden name='approval_signDTOList["+index+"].app_sign_id' value='"+$(this).children(".modalId").val()+"' class='hId'>");
				let hOrder = $("<input type=hidden name='approval_signDTOList["+index+"].app_sign_order' value='"+(ordercount)+"' class='hOrder'>");
				let hSignType = $("<input type=hidden name='approval_signDTOList["+index+"].app_sign_type_code' value='"+0+"' class='hSignType'>");
				block.append(order);block.append(dept);block.append(name);block.append(posi);block.append(signType);block.append(del);block.append(hId);block.append(hOrder);block.append(hSignType);
				$("#selectedContainer").append(block);
				
				// json저장 형식 => 이름 : [id (이름으로 아이디를 찾을 수 있게):결재자(defualt값이 결재자임)]
				sign_name_Json.push(sName);
				sign_info_Json[sName] = [$(this).children(".modalId").val(),0];
				
				fnRenumbering();
	
			})
			////조직도 상세 내부에서 인원 삭제
			$("#selectedContainer").on("click",".selectedDel",function(){
				
				//삭제 대상 이름 가져오기
				let name = $(this).closest(".selectedBlock").children(".selectedName").text();
				//json 데이터 삭제
				const idx = sign_name_Json.indexOf(name);
				sign_name_Json.splice(idx,1);
				delete sign_info_Json[name];
				
				//block삭제
				$(this).closest(".selectedBlock").remove();

				//form 으로 보낼 데이터 가공
				let orderList = $(".selectedOrder");
				let horderList = $(".hOrder");
				let hidList = $(".hId");
				let hsignTypeList = $(".hSignType")
				//배열 index값 수정
				for(var i = 0; i<orderList.length;i++){
					horderList[i].name = "approval_signDTOList["+i+"].app_sign_order";
					hidList[i].name = "approval_signDTOList["+i+"].app_sign_id";
					hsignTypeList[i].name = "approval_signDTOList["+i+"].app_sign_type_code";
				}
				//order값 수정
				fnRenumbering();
				})
				
			////결재구분 변경
			$("#selectedContainer").on("change",".selectType",function(){
				let sName = $(this).closest(".selectedBlock").children(".selectedName").text();
				let changed = $(this).closest(".selectType").val();
				sign_info_Json[sName][1] = changed;
				$(this).closest(".hSignType").val(changed);
				if(changed==1){
					let order = $(this).closest(".selectedBlock").children(".selectedOrder");
					order.text('참조');
					console.log($(this).closest(".selectedBlock").children(".hSignType"));
					$(this).closest(".selectedBlock").children(".hSignType").val(1)
					$(this).closest(".selectedBlock").children(".hOrder").val(-1);
				}else if(changed==2){
					$(this).closest(".selectedBlock").children(".hSignType").val(2)
				}
				
				//order재정립
				fnRenumbering();
				
			});
			
			//order순서 재정립 함수
			let fnRenumbering = function(obj){
				let orderList = $(".selectedOrder");
				let horderList = $(".hOrder");
				let stList = $(".selectType");
				let ordercount = 1;
				for(var i = 0; i<orderList.length;i++){
					//결재구분이 '참조'인 사람을 제외하고 order를 정리한다. 
					if(orderList[i].innerText=='참조'){continue;}
					if(stList[i].value==2){
						if(stList[i-1].value==2 && stList[i-1].value!=null){
							ordercount--;
						}
					}
						horderList[i].value = ordercount;
						orderList[i].innerText = ordercount;
						ordercount++;
					
				}
			}
			//날짜변환 yyyy-MM-dd
            function getFormatDate(date){
                var year = date.getFullYear();
                var month = (1 + date.getMonth());
                month = month >= 10 ? month : '0' + month;
                var day = date.getDate();
                day = day >= 10 ? day : '0' + day;
                return year + '-' + month + '-' + day;
            }
		</script>
</body>
</html>