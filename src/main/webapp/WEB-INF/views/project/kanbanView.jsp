<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title id='Description'>칸반보드 보기</title>
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
<script src="/assets/vendor/jquery/jquery.min.js"></script>
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
<script type="text/javascript"
	src="/resources/lib/scripts/jquery-1.11.1.min.js"></script>
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
                    	var options='top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no';
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
					<h3 class="page-title">My Project : ${pdto.pro_title}</h3>
					<div class="alert alert-warning alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>Notice!</strong>
						<br><br>
						<span class="glyphicon glyphicon-ok"
							aria-hidden="true"></span> <span class="sr-only">Check:</span>&nbsp
						상세 설명 및 내용 변경은 칸반 <strong>더블클릭</strong><br><br>
					</div>
					<div class="top-vacant d-none d-lg-block"></div>
							
							<button type="button" id="destroyKanban" class="btn btn-primary">초기화</button>
							<button id="back" class="btn btn-info">목록으로</button>
					<div class="top-vacant d-none d-lg-block"></div>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">칸 반 보 드 보 기</h3>
						</div>
						<div class="panel-body">
							<div id="kanban"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
				<!-- END MAIN CONTENT -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">
					&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme
						I Need</a>. All Rights Reserved.
				</p>
			</div>
		</footer>
		
	</div>
</body>
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
	location.href = "/project/destroyKanban.project?pro_seq=${pdto.pro_seq}&pro_id=${pdto.pro_id}";
});
$("#back").on("click", function() {
	location.href = "/project/enterProjectList.project?cpage=1";
});
</script>
</html>