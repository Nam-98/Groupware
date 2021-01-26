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
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript"
	src="/resources/lib/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxsortable.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxkanban.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxdata.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            var fields = [
                     { name: "id", type: "string" },
                     { name: "status", map: "state", type: "string" },
                     { name: "text", map: "label", type: "string" },
                     { name: "tags", type: "string" },
                     { name: "color", map: "hex", type: "string" },
                     { name: "resourceId", type: "string" }
            ];
            var source =
             {
                 localData: [
                	 
                	 <c:forEach varStatus="i" items="${pkdtoList}" var="dto">
                	 { id: "${dto.pro_kb_seq}", state: "${dto.pro_kb_process_code}", label: "${dto.pro_kb_title}", tags: "${dto.pro_kb_details}", hex: "#5dc3f0", resourceId: "${dto.pro_kb_manager}"}
                	 
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

            $('#kanban').jqxKanban({
            	width:'100%',
                resources: resourcesAdapterFunc(),
                source: dataAdapter,
                columns: [
                    { text: "진행사항없음", dataField: "0" },
                    { text: "시작 전", dataField: "1" },
                    { text: "진행 중", dataField: "2" },
                    { text: "완   료", dataField: "3" },
                    { text: "중   지", dataField: "4" }
                    
                ]
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
					<div class="row">
						<div class="col-lg-10 d-none d-lg-block"></div>
						<div class="col-lg-2 col-12">
							<!-- Single button -->
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									Action <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul>
							</div>
							<button type="button" id="addProject" class="btn btn-warning">추가</button>
						</div>
					</div>
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
	</div>
</body>

<!--칸반 클릭 시 이벤트-->
<script>
$('#kanban').on('itemAttrClicked', function (event) {
    var args = event.args;//attribute랑 item 이랑 itemId뽑힘
    var itemId = args.itemId;
    var attribute = args.attribute; // template, colorStatus, content, keyword, text, avatar
    
    var options='top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
	window.open("/project/fixkanbanPop.project?itemId="+itemId,"popup",options);
});
</script>

</html>