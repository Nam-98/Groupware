<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://kit.fontawesome.com/b1e233372d.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<style type="text/css">
  .dropdown-menu > li > a {
           display: block;
            padding: 3px 20px;
            clear: both;
            font-weight: normal;
            line-height: 1.42857143;
            color: #333;
            white-space: nowrap;
  }

* {
	box-sizing: border-box;
	/*border: 1px solid black;*/
	margin: 0px;
	padding: 0px;
}

.wholecontainer {
	width: 1280px;
	height: 720px;
}

.right-side {
	width: 1020px;
	height: 720px;
	position: absolute;
	top: 0px;
	left: 260px;
}

.top-vacant {
	width: 1020px;
	height: 20px;
	background-color: yellow;
}

.page-name {
	width: 510px;
	height: 50px;
	float: left;
}
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

#orgTree {
	display: block;
}

.modalLi:hover {
	cursor: pointer;
	background-color: #adb5bd;
}

table {
	width: 100%;
}

.modalR {
	width: 60%
}

.modalL {
	width: 40%
}

i:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="wholecontainer">
		<div class="left-side">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<div class="right-side">
			<div class="top-vacant"></div>
			<div class="row">
				<div class="page-name col-6">
					<h3>전자결재 작성</h3>
				</div>
				<div class="col-6">
					<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
				</div>
			</div>
			<div class="maincontainer">
			<form action="/approval/writeApproval.approval" method="post">
				<table class="table">
					<thead>
						<tr>
							<th scope="row" class="align-middle">문서종류</th>
							<td>
								<select class="form-select form-select-sm" id="docsType" name="app_type_code" style='width:auto;display:inline;'>
									<c:forEach items="${docsType}" var="dto">
										<option value="${dto.app_type_code}">${dto.app_type_name}</option>
									</c:forEach>
								</select>
								<select class="form-select form-select-sm" id="breakType" name="app_type_code" style='width:auto;display:none;'>
									<c:forEach items="${breakType}" var="dto">
										<option value="${dto.break_code}">${dto.break_name}</option>
									</c:forEach>
								</select>
								<button type=button id=temp>출력</button>
								<button type=button id="addSign" class="btn btn-outline-dark btn-sm float-right" data-bs-toggle="tooltip" data-bs-placement="right" title="결재자를 추가하려면 이 버튼을 누르세요">
								결재자 / 참조자 선택 <span class='badge badge-pill badge-primary' id="signCount">0</span>						
								</button>
							</td>
						</tr>
						<tr>
							<th scope="row">보존기간</th>
							<td>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="1" checked>
								 	<label class="form-check-label" for="inlineRadio1">1년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="2">
								 	<label class="form-check-label" for="inlineRadio1">2년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="3">
								 	<label class="form-check-label" for="inlineRadio1">3년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="5">
								 	<label class="form-check-label" for="inlineRadio1">5년</label>
								</div>
								<div class="form-check form-check-inline">
								 	<input class="form-check-input" type="radio" name="app_archive" id="app_archive" value="10">
								 	<label class="form-check-label" for="inlineRadio1">10년</label>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="align-middle">
								<button type="button" class="btn btn-outline-secondary" id=addFileBlock>첨부파일</button>
							</th>
							<td>
								<div class="fileContainer"></div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="form-control form-control-sm" id="title"	placeholder="제목" name="app_title"></td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea id="summernote" name="contents"></textarea>
								<br> https://okky.kr/article/519068?note=1554650
							</td>
						</tr>
					</thead>
				</table>
			</form>
			</div>
		</div>
	</div>


	<!-- 결재자 선택 modal창 -->
	<div class="modal selectSign" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">결재자 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="orgTree bg-light bg-gradient float-left modalL">
					조직도, 검색창
						<ul id="myUL1">
							<c:forEach items="${dlist }" var="i">
								<li>
									<span class="caret1">${i.dept_name}</span>
									<ul class="nested1">
										<c:forEach items="${mlist}" var="j">
											<c:if test="${j.dept_code == i.dept_code && j.id != sessionScope.id}">
												<li class="modalLi">${j.name} ${j.position_name}
												<input type=hidden class="modalPosi" value="${j.position_name}">
												<input type=hidden class="modalName" value="${j.name}">
												<input type=hidden class="modalId" value="${j.id}">
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="float-right modalR">
						<h5 class="align-center">상세창</h5>
						<table class="table table-sm">
							<thead class='thead-light'>
								<tr>
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
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary footClose" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		//file block
		$("#addFileBlock").on("click",function(){
			let block = $(`<div class="input-group fileBlock"><div class="custom-file"><input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"><label class="custom-file-label" for="inputGroupFile04">첨부파일을 선택하세요</label></div><div class="input-group-append"><button class="btn btn-danger btn-sm fileDel" type="button">삭제</button></div></div>`);
			$(".fileContainer").append(block);
		})
		$(".fileContainer").on("click",".fileDel",function(){
			$(this).closest(".fileBlock").remove();
		})
		//summernote 관련 스크립트 
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
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
		});
		//문서종류 변경 이벤트
		$("#docsType").on("change",function(){
			if(this.value==3){
				$("#breakType").css("display","inline");
				// @param {String} HTML string
				var HTMLstring = `test`;
				$('#summernote').summernote('pasteHTML', HTMLstring);
			}else{
				$("#breakType").css("display","none");
			}
		})
		$("#temp").on("click",function(){
			console.log($('#summernote').summernote('code'));
		})
		//결재라인 관련 스크립트
		let sign_id_Json = {};
		////모달창 열기
		$("#addSign").on("click", function() {
			console.log("addSign클릭")
			$(".selectSign").show();
		})
		////모달창 닫기
		$(".btn-close").on("click", function() {
			let count = $(".selectedBlock").length;
			console.log(count);
			$("#signCount").html(count)
			$(".selectSign").hide();
		})
		$(".footClose").on("click", function() {
			let count = $(".selectedBlock").length;
			console.log(count);
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
		console.log(sign_type_arr);
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
			let signType = $("<select class='form-select form-select-sm selectType' aria-label='.form-select-sm example'  style='width:auto;'>");
				for(var i=0; i<sign_type_arr.length;i++){
					let opt = $("<option value='"+sign_type_arr[i][0]+"'>"+sign_type_arr[i][1]+"</option>");
					signType.append(opt);
				}
			block.append(dept);block.append(name);block.append(posi);block.append(signType);block.append(del);
			$("#selectedContainer").append(block);
			
			// json저장 형식 => 이름 : id (이름으로 아이디를 찾을 수 있게)
			sign_id_Json[sName] = $(this).children(".modalId").val();

		})
		////조직도 상세 내부에서 인원 삭제
		$("#selectedContainer").on("click",".selectedDel",function(){
			$(this).closest(".selectedBlock").remove();
			let name = $(this).closest(".selectedBlock").children(".selectedName").text();
			delete sign_id_Json[name];
			console.log(sign_id_Json);
			})
	</script>
</body>
</html>