<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<title>프로젝트 보기</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>
<!-- jqkanban -->
<meta name="description" content="jQuery Kanban Widget Editing" />
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxsortable.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxkanban.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="/resources/lib/scripts/demos.js"></script>

<style>
.jqx-kanban-item-color-status {
	width: 100%;
	height: 25px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	position: relative;
	margin-top: 0px;
	overflow: hidden;
	top: 0px;
}

.jqx-kanban-item {
	padding-top: 0px;
	padding-bottom: 0px;
}

.jqx-kanban-item-text {
	padding-top: 6px;
	padding-bottom: 6px;
}

.jqx-kanban-item-avatar {
	top: 9px;
}

.jqx-kanban-template-icon {
	position: absolute;
	right: 3px;
	top: 12px;
}
</style>
<script type="text/javascript">
        $(document).ready(function () {
            var fields = [
                     { name: "id", type: "string" },
                     { name: "status", map: "state", type: "string" },
                     { name: "text", map: "label", type: "string" },
                     /* { name: "tags", type: "string" }, */
                     { name: "color", map: "hex", type: "string" },
                     { name: "resourceId", type: "string" }
            ];
            var source =
             {
                 localData: [
                	 
                	 <c:forEach varStatus="i" items="${pkdtoList}" var="dto">
                	 { id: "${dto.pro_kb_seq}", state: "${dto.pro_kb_process_code}", label: "${dto.pro_kb_title}", 
                		 /* tags: "${dto.pro_kb_details}", */ 
                		 hex: "#5dc3f0", resourceId: "${dto.pro_kb_manager}"}
                	 
                	 <c:if test= "${!i.last}">,</c:if>
                 </c:forEach>
                 ],
                 dataType: "array",
                 dataFields: fields
             };
            var dataAdapter = new $.jqx.dataAdapter(source);
            var resourcesAdapterFunc = function () {
                var resourcesSource =
                {
                    localData: [
                    	
                    	
                    	<c:forEach varStatus="i" items="${mdtoList}" var="dto">
                   	 { id: "${dto.id}", name: "${dto.name}", image: "/resources/profileImage/${dto.id}.png"}
                   	 
                   	 <c:if test= "${!i.last}">,</c:if>
                    </c:forEach>
                    ],
                    dataType: "array",
                    dataFields: [
                         { name: "id", type: "string" },
                         { name: "name", type: "string" },
                         { name: "image", type: "string" }
                    ]
                };
                var resourcesDataAdapter = new $.jqx.dataAdapter(resourcesSource);
                return resourcesDataAdapter;
            }
            var getIconClassName = function () {
                switch (theme) {
                case "darkblue":
                case "black":
                case "shinyblack":
                case "ui-le-frog":
                case "metrodark":
                case "orange":
                case "darkblue":
                case "highcontrast":
                case "ui-sunny":
                case "ui-darkness":
                    return "jqx-icon-plus-alt-white ";
            }
            return "jqx-icon-plus-alt";
            }
            $('#kanban').jqxKanban({
            	width:'100%',
            	template: "<div class='jqx-kanban-item' id=''>"
                    + "<div class='jqx-kanban-item-color-status'></div>"
                    + "<div style='display: none;' class='jqx-kanban-item-avatar'></div>"
                    + "<div class='jqx-icon jqx-icon-close jqx-kanban-item-template-content jqx-kanban-template-icon'></div>"
                    + "<div class='jqx-kanban-item-text'></div>"
                    + "<div style='display: none;' class='jqx-kanban-item-footer'></div>"
            	+ "</div>",
                resources: resourcesAdapterFunc(),
                source: dataAdapter,
             // render items.
                itemRenderer: function (item, data, resource) {
                    $(item).find(".jqx-kanban-item-color-status").html("<span style='line-height: 23px; margin-left: 5px;'>" + resource.name + "</span><img style=' width : 20px; height : 20px; line-height: 23px; margin-left: 5px;' src=" + resource.image + ">");
                    $(item).find(".jqx-kanban-item-text").css('background', item.color);
                    item.on('dblclick', function (event) {
                    	var options='top=10, left=10, width=800, height=630, status=no, menubar=no, toolbar=no, resizable=no';
                        window.open("/project/fixkanbanPop.project?itemId="+data.id,"popup",options);
                    	
                    });
                },
                columns: [
                    { text: "진행사항없음", iconClassName: getIconClassName(), dataField: "0" },
                    { text: "시작 전", iconClassName: getIconClassName(), dataField: "1" },
                    { text: "진행 중", iconClassName: getIconClassName(), dataField: "2" },
                    { text: "완   료", iconClassName: getIconClassName(), dataField: "3" },
                    { text: "중   지", iconClassName: getIconClassName(), dataField: "4" }
                ],
                 // render column headers.
                columnRenderer: function (element, collapsedElement, column) {
                    var columnItems = $("#kanban").jqxKanban('getColumnItems', column.dataField).length;
                    // update header's status.
                    element.find(".jqx-kanban-column-header-status").html(" (" + columnItems + "/" + column.maxItems + ")");
                    // update collapsed header's status.
                    collapsedElement.find(".jqx-kanban-column-header-status").html(" (" + columnItems + "/" + column.maxItems + ")");
                } 
                
            });
            $('#kanban').on('columnAttrClicked', function (event) {
                var args = event.args;
                if (args.attribute == "button") {
                    args.cancelToggle = true;
                    if (!args.column.collapsed) {
                        location.href = "/project/addKanban.project?code="+args.column.dataField+"&pro_seq=${pdto.pro_seq}";
                    }
                }
            });
        });
    </script>
</head>
<style>
* {
	border: 0px solid black;
}

.top-vacant {
	width: 100%;
	height: 20px;
	/* 	background-color: yellow; */
}
.profilBox {
	text-align: center;
}
</style>
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
					<h3 class="page-title">프로젝트 : ${pdto.pro_title}</h3>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">프 로 젝 트 정 보</h3>
							<div class = "right">
					<input type="button" id="deletepro" class="btn btn-sm btn-danger" value ="삭제">
					<input type="button"  id="back" class="btn btn-sm btn-info" value="목록으로">
					</div>
						</div>
						<div class="panel-body">
							<table class="table table-sm">
								<tbody>
									<tr>
										<th scope="row">프로젝트명</th>
										<td>${pdto.pro_title}</td>
									</tr>
									<tr>
										<th scope="row">담 당 자(PM)</th>
										<td>${pdto.pro_id}</td>
									</tr>
									<tr>
										<th scope="row">일 자 (전체 : ${proTerm} 일)</th>
										<td>${pdto.pro_start_date_str}&nbsp&nbsp~&nbsp&nbsp${pdto.pro_end_date_str}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">칸 반 보 드 보 기</h3>
							<div class = "right">
								<input type="button" id="destroyKanban" class="btn btn-sm btn-info" value="초기화">
							</div>
						</div>
						<div class="panel-body">
							<div id="kanban"></div>
						</div>
					</div>

					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">프 로 젝 트 전 체 진 행 률</h3>
						</div>
						<div class="panel-body">
							<div class="well"><h4>시간경과율</h4><hr>
							
								<div class="progress">
									<div
										class="progress-bar progress-bar-primary progress-bar-striped active"
										role="progressbar" aria-valuenow="${timeRate}"
										aria-valuemin="0" aria-valuemax="100"
										style="width: ${timeRate}%"></div>
								</div>
								<table class="table">
								<thead>
									<tr class="table-secondary">
										<th scope="col">시간 경과율</th>
										<th scope="col">${timeRate} %</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">계산식</th>
										<td>{(마감일-오늘) / (전체 기간)} * 100</td>
									</tr>
								</tbody>
							</table>
							</div>

							<div class="well"><h4>과제진행률</h4><hr>
								<div class="progress">
									<div
										class="progress-bar progress-bar-primary progress-bar-striped active"
										role="progressbar" aria-valuenow="${projectRate}"
										aria-valuemin="0" aria-valuemax="100"
										style="width: ${projectRate}%"></div>
								</div>
								
								<table class="table">
								<thead>
									<tr class="table-secondary">
										<th scope="col">과제 진행률</th>
										<th scope="col">${projectRate} %</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">계산식</th>
										<td>{ ( 완료 <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> ) + 0.5 * ( 진행중 <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> ) / ( 전체 <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> - 중지 <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> ) } * 100</td>
									</tr>
								</tbody>
							</table>
							<br>
								<table class="table table-sm">
								<thead>
									<tr class="table-secondary">
										<th scope="col">진행상태</th>
										<th scope="col">갯수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">진행상태없음</td>
										<td>${list.get(0)}
									</tr>
									<tr>
										<td scope="row">시작 전</td>
										<td>${list.get(1)}
									</tr>
									<tr>
										<td scope="row">진행 중</td>
										<td>${list.get(2)}
									</tr>																		
									<tr>
										<td scope="row">완 료</td>
										<td>${list.get(3)}
									</tr>
									<tr>
										<td scope="row">중 지</td>
										<td>${list.get(4)}
									</tr>
								</tbody>
							</table>
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
	<script>
	$('#deletepro').on("click", function() {
		var confirmflag = confirm("주의! 프로젝트가 삭제됩니다.");

	      if(confirmflag){
	    		location.href = "/project/deleteProject.project?pro_seq=${pdto.pro_seq}";
	      }else{
				return;
	      }
	});
	
		$("#back").on("click", function() {
			location.href = "/project/enterProjectList.project?cpage=1";
		});
	</script>
<!-- 칸반 이동 시 이벤트  -->
<script>
$('#kanban').on('itemMoved', function (event) {
    var args = event.args;
    var itemId = args.itemId;
    var newColumn = args.newColumn;
    var newDatafield = newColumn.dataField;
    location.href = "/project/kanbanMoved.project?itemId="+itemId+"&newDatafield="+newDatafield;
    
});
</script>
<!--칸반(x) 클릭 시 이벤트-->
<script>
$('#kanban').on('itemAttrClicked', function (event) {
    var args = event.args;//attribute랑 item 이랑 itemId뽑힘
    var itemId = args.itemId;
    
    if(args.attribute=="template"){
    	location.href= "/project/deleteKanbanTemplate.project?pro_kb_seq="+itemId;
    }

});
</script>
<!-- 칸반 초기화 -->
<script>
$('#destroyKanban').on("click", function() {
	var confirmflag = confirm("주의! 칸반보드가 초기상태로 돌아갑니다.");

      if(confirmflag){
    		location.href = "/project/destroyKanban.project?pro_seq=${pdto.pro_seq}&pro_id=${pdto.pro_id}";
      }else{
			return;
      }
});
</script>
</body>
</html>
