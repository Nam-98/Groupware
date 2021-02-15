<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 작성</title>
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
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

   	
	
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
.selectedOrder{display:none;}
#boldText{    font-weight: bolder;
    font-size: xx-large;}
.in-block{display:inline-block;} 
</style>

</head>
<body>
<form action="/bizlog/writeBizlog.bizlog" id="writeForm" method="post" enctype="multipart/form-data" >
		<div class="modal selectSign" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">결재자 선택</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-4">
						<div class="orgTree bg-light bg-gradient modalL">
						<h3 class="text-center">조직도</h3>
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
							<h3 class="text-center">결재 인원창</h3>
							<table class="table table-sm">
								<thead class='thead-light'>
									<tr>
										<th scope="col" style="display:none;">결재순서</th>
										<th scope="col">부서</th>
										<th scope="col">이름</th>
										<th scope="col">직위</th>
										<th scope="col">결재구분</th>
										<th scope="col">삭제</th>
									</tr>
								</thead>
								<tbody id="selectedContainer">
									<tr class="selectedBlock">
										<c:forEach items="${mlist}" var="i">
											<c:if test="${i.id == sessionScope.id}">
												<td class="selectedOrder">1</td>
												<td class="selectedDept">${i.dept_name }</td>
												<td class="selectedName">${i.name }</td>
												<td class="selectedPosi">${i.position_name }</td>
												<td class="selectTypeTd">결재자</td>
												<td></td>
												<input type="hidden" name="approval_signDTOList[0].app_sign_id" value="${sessionScope.id }" class="hId">
												<input type="hidden" name="approval_signDTOList[0].app_sign_order" value="1" class="hOrder">
												<input type="hidden" name="approval_signDTOList[0].app_sign_type_code" value="0" class="hSignType">
											</c:if>
										</c:forEach>
									</tr>
								</tbody>
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
					<h3 class="page-title">업무일지 작성</h3>
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">기본내용 작성</h3>
								<!--pannel의 최소화 및 닫기 버튼-->
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								</div>
							</div>
						<div class="panel-body">
								<table class="table">
									<thead>
										<tr>
											<th scope="row" class="align-middle">문서종류</th>
											<td colspan=3>
												<select class="form-control form-select-sm" id="docsType" name="app_type_code" style='width:auto;display:inline;'>
													<c:forEach items="${docsType}" var="dto">
														<option value="${dto.app_type_code}">${dto.app_type_name}</option>
													</c:forEach>
												</select>
												<button type=button id="addSign" class="btn btn-outline-dark btn-sm pull-right" data-bs-toggle="tooltip" data-bs-placement="right" title="결재자를 추가하려면 이 버튼을 누르세요">
												결재선 선택 <span class='badge badge-pill badge-primary' id="signCount">1</span>						
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row" class="align-middle">업무일</th>								
											<td>
												<input type=date name=biz_periodstart id=bizPerSrt style="display:none">
												<input type=date name=biz_periodend id=bizPerEnd style="display:none">
												<div class="in-block dateBox">
													<input type=date id="bizDate">
												</div>
												<div class="weekBox" style='display:none;'>
													<input type="week" id="sh_week">
												</div>
												<div class="monthBox" style='display:none;'>
													<input type=month id="sh_month">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="align-middle">
												<button type="button" class="btn btn-outline-secondary" id=addFileBlock>첨부파일</button>
											</th>
											<td colspan=3>
												<div class="fileContainer row"></div>
											</td>
										</tr>
										<tr>
											<td colspan="4"><input type="text" class="form-control form-control-sm" id="title"	placeholder="제목" name="app_title"></td>
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
								</div>

								<!-- pannel 내부의 내용 작성 div-->
								<div class="panel-body">
									<div class="row">
										<textarea class="summernote"></textarea>
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
	<script>
	//글 작성
	$("#appWrite").on("click",function(){
		//title입력 확인
		if($("#title").val()==''){alert("제목은 필수입력 사항입니다.");return;}
		//본문 입력 확인
		if ($('.summernote').summernote('isEmpty')) {
		  alert('본문내용은 필수 입력사항입니다.');return;
		}
		
		//contents 전송준비
		let contents = $(".summernote").summernote('code');
				
		//업무일지 기간 넣기
		let docsType = $("#docsType").val();
		let dStrt = new Date();
		let dEnd = new Date();

		if(docsType==7){
			//일일 업무일지
			if(document.getElementById("bizDate").value==''){alert("날짜를 선택해 주세요");return;}
			dStrt = document.getElementById("bizDate").value.split("-");
			dStrt = new Date(dStrt[0],dStrt[1]-1,dStrt[2]);//month는 0부터 시작하기 때문에 -1을 해줌
			//dStrt = getFormatDate($('#jqxdateStart').jqxDateTimeInput('getDate'));
			dEnd = dStrt;

		}else if(docsType==8){
			//주간 업무일지
			if(document.getElementById("sh_week").value==''){alert("날짜를 선택해 주세요");return;}
			let temp = document.getElementById("sh_week").value
			dStrt = getStartDateFromISOWeek(temp);
			//dStrt setting시에 하루 앞으로 당겨져 date가 지정되는 오류가 있어 하루 뒤의 date를 넣어줌
			dStrt.setDate(dStrt.getDate()+1);
			dEnd.setDate(dStrt.getDate()+6);

			
		}else{
			//월간 업무일지
			if(document.getElementById("sh_month").value==''){alert("날짜를 선택해 주세요");return;}
			var monthFull = document.getElementById("sh_month").value.split("-");
			let year = monthFull[0];
			let mon = monthFull[1];
			//input type date에 넣을 때 하루씩 앞으로 당겨지는 오류가 있어 하루 뒤의 date를 setting해준다.
			dStrt = new Date(year, mon-1, 2);
			dEnd = new Date(year, mon, 1);

		}

		//input type date에 담아 form을 통해 controller로 전송
		document.getElementById("bizPerSrt").value = dStrt.toISOString().substring(0, 10);
		document.getElementById("bizPerEnd").value = dEnd.toISOString().substring(0, 10);
		console.log(document.getElementById("bizPerSrt").value);
		console.log(document.getElementById("bizPerEnd").value);
		$("#contents").val(contents);
		$("#writeForm").submit();
		
	})
	</script>
	
		<script>
		
		//결재선 script 보조용 json, arr
		//맨 처음에 '나'를 default 결재자로 넣는다.
		let sign_info_Json = {};
		let sign_name_Json = [];
		<c:forEach items="${mlist}" var="i">
			<c:if test="${i.id == sessionScope.id}">
				sign_name_Json.push("${i.name}");
				sign_info_Json["${i.name}"] = ["${sessionScope.id}",0];
			</c:if>
		</c:forEach>
			
			//file block
			$("#addFileBlock").on("click",function(){
				let block = $(`<div class="input-group fileBlock" style='display:inline-flex; padding:2px;'><div class="custom-file col-sm-10" style='display:inline;'><input type="file" class="approvalFiles" name='attachedfiles'></div><div class="input-group-append col-sm-2" style='display:inline;'><button class="btn btn-danger btn-sm fileDel" type="button">삭제</button></div></div>`);
				$(".fileContainer").append(block);
			})
			$(".fileContainer").on("click",".fileDel",function(){
				$(this).closest(".fileBlock").remove();
			})

			
			</script>
			
			<script>
			//문서종류 변경 이벤트
			$("#docsType").on("change",function(){
				if(this.value==7){
					$(".dateBox").css("display","inline-block");
					$(".weekBox").css("display","none");
					$(".monthBox").css("display","none");
				}else if(this.value==8){
					$(".dateBox").css("display","none");
					$(".weekBox").css("display","inline-block");
					$(".monthBox").css("display","none");
				}else{
					$(".dateBox").css("display","none");
					$(".weekBox").css("display","none");
					$(".monthBox").css("display","inline-block");
				}
				
				$.ajax({
					url : "/approval/getTemplate.approval?app_docs_type="+this.value,
					method : 'POST',
					success : function(template){
						$('.summernote').summernote('code', template);
					}
				})
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
				if(Object.keys(sign_info_Json).length==0){index=1}else{index=Object.keys(sign_info_Json).length}
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
						sSt.append("결재자");
					
					signType.append(sSt);
				//form으로 보낼 데이터 작성	
				let hId = $("<input type=hidden name='approval_signDTOList["+index+"].app_sign_id' value='"+$(this).children(".modalId").val()+"' class='hId'>");
				let hOrder = $("<input type=hidden name='approval_signDTOList["+index+"].app_sign_order' value='"+(ordercount)+"' class='hOrder'>");
				let hSignType = $("<input type=hidden name='approval_signDTOList["+index+"].app_sign_type_code' value='"+0+"' class='hSignType'>");
				block.append(order);block.append(dept);block.append(name);block.append(posi);block.append(signType);block.append(del);block.append(hId);block.append(hOrder);block.append(hSignType);
				$("#selectedContainer").prepend(block);
				
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
			
			//order순서 재정립 함수
			let fnRenumbering = function(){
				let orderList = $(".selectedOrder");
				let horderList = $(".hOrder");
				let stList = $(".selectType");
				let ordercount = 1;
				for(var i = orderList.length-1; i>=0;i--){
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
		
		
		<script>
		// Date 객체를 받아 week number를 반환 
		// 참고: https://weeknumber.net/how-to/javascript 
		function getWeekFromISODate(dt) { 
			dt.setHours(0,0,0,0); 
			dt.setDate(dt.getDate() + 3 - (dt.getDay() + 6) % 7); 
			const week1 = new Date(dt.getFullYear(), 0, 4); 
			const weekNumber = 1 + Math.round(((dt.getTime() - week1.getTime())/ 86400000 - 3 + (week1.getDay() + 6) % 7) / 7); 
			return `${dt.getFullYear()}-W${weekNumber}`; } 

		// YYYY-W00 형태의 ISO 8601 week number를 받아 해당 주의 월요일 Date 객체를 반환 
		// https://stackoverflow.com/questions/16590500/javascript-calculate-date-from-week-number 
		function getStartDateFromISOWeek(ISOweek) { 
			const y = parseInt(ISOweek.substring(0, 4)); 
			const w = parseInt(ISOweek.substring(6, 8)); 
			const simpleDate = new Date(y, 0, 1 + (w - 1) * 7); 
			const dayOfWeek = simpleDate.getDay(); 
			const ISOweekStart = simpleDate; 
			if (dayOfWeek <= 4) { 
				ISOweekStart.setDate(simpleDate.getDate() - simpleDate.getDay() + 1);
			 } else { 
				ISOweekStart.setDate(simpleDate.getDate() + 8 - simpleDate.getDay()); 
			} 
			return ISOweekStart; 
		} 
		</script>

	<jsp:include page="/WEB-INF/views/commonPage/summernote-plugin.jsp" />


</body>
</html>