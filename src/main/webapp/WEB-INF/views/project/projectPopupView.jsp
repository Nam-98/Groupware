<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당자(ID) 검색</title>
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
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- jqxtree  -->
<!--tree  -->
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.energyblue.css"
	type="text/css" />
<script type="text/javascript"
	src="/resources/lib/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/resources/lib/jqwidgets/jqxdata.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxdatatable.js"></script>
<script type="text/javascript"
	src="/resources/lib/jqwidgets/jqxtreegrid.js"></script>
<script type="text/javascript" src="/resources/lib/scripts/demos.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            var employees = [
            
               <c:forEach varStatus="i" items="${list}" var="dto">
               {"departmentID": ${dto.departmentID}, 
            	   "ReportsTo": ${dto.reportsTo},
                  "departmentName": "${dto.departmentName}",
                  "name": "${dto.name}", 
                  "position": "${dto.position}",
                  "memId":"${dto.memId}"
               }
               <c:if test= "${!i.last}">,</c:if>
         </c:forEach>
               ];
            // prepare the data
            var source =
            {
                dataType: "json",
                dataFields: [
                    { name: 'departmentID', type: 'number' },
                    { name: 'ReportsTo', type: 'number' },
                    { name: 'departmentName', type: 'string' },
                    { name: 'name', type: 'string' },
                    { name: 'position', type: 'string' },
                    { name: 'memId', type: 'string' }
                ],
                hierarchy:
                {
                    keyDataField: { name: 'departmentID' },
                    parentDataField: { name: 'ReportsTo' }
                },
                id: 'departmentID',
                localData: employees
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            // create Tree Grid
            $("#treeGrid").jqxTreeGrid(
            {
                width: 240,
                source: dataAdapter,
                enableHover: false,
                showHeader: false,
                showToolbar: true,
                sortable: true,
                renderToolbar: function (toolbar) {
                    var container = $("<div style='margin: 5px; height: 50px;'></div>");
                    var span = $("<span style='float: left; margin-top: 5px; margin-right: 4px;'>검색:</span>");
                    var input = $("<input class='jqx-input jqx-widget-content jqx-rc-all' id='searchField' type='text' placeholder='미구현' style='height: 23px; float: left; width: 180px;' />");
                    toolbar.append(container);
                    container.append(span);
                    container.append(input);
                },
                ready: function () {
                	$('#treeGrid').jqxTreeGrid({height:"390px"});
                	$('#treeGrid').jqxTreeGrid({scrollBarSize: 0}); 
                	$("#treeGrid").jqxTreeGrid('expandAll');
                	$("#treeGrid").jqxTreeGrid('sortBy', 'departmentName', 'asc');
                },
                columns: [
                { text: '부서', align: 'center' ,dataField: 'departmentName', width: 100 },
                  { text: '성명',align: 'center', dataField: 'name', width: 70 },
                  { text: '직급',align: 'center', dataField: 'position', width: 70 }
                ]
            });
        });
    </script>
</head>
<style>
.top-vacant {
	width: 100%;
	height: 20px;
	/* 	background-color: yellow; */
}

.panel-body {
	text-align: center;
}

.table table-sm {
	width: 100%;
}

.profilBox>img {
	width: 100%;
	height: 100%;
}

.profilBox {
	width: 100px;
	height: 150px;
	text-align: center;
}

.demo-icons li {
	margin-bottom: 0px;
	text-align: left;
}

.jqx-grid-table .jqx-grid-cell {
	border-width: 0px 0px 1px 0px;
}

.jqx-scrollbar {
	display: none;
}

.jqx-cell {
	cursor: pointer;
}
</style>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<div class="panel panel-headline demo-icons">
					<div class="panel-heading">
						<h3 class="panel-title">담당자(ID) 검색</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<div id="treeGrid"></div>
							</div>
							<div class="col-md-8">
								<div class="orgInfo well">
									<div class="profilBox d-none d-lg-block">
										<img class="profileImg img-thumbnail" id="profileImage" alt="${dto.id}"
											src="/resources/profileImage/${dto.id}.png">
									</div>
									<br>
									<div class="bodyContents">
										<table class="table table-sm">
											<tbody>
												<tr>
													<th scope="row">이 름</th>
													<td>${dto.name}</td>
												</tr>
												<tr>
													<th scope="row">연 락 처</th>
													<td>${dto.contact}</td>
												</tr>
												<tr>
													<th scope="row">부 서</th>
													<td>${dto.dept_name}</td>
												</tr>
												<tr>
													<th scope="row">직 위</th>
													<td>${dto.position_name}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<input type="hidden" id="pmName" readonly value="${dto.name}"><input
								type="hidden" id="pmId" readonly value="${dto.id}">
							<button id="returnButton" class="btn btn-sm btn-primary">선택</button>
						</div>

					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
	</div>
</body>

<script>
	$('#returnButton').click(function() {
		var returnValueName = document.getElementById('pmName').value;
		var returnValueId = document.getElementById('pmId').value;
		var returnValue = {
			key1 : returnValueName,
			key2 : returnValueId
		};

		window.opener.getReturnValue(JSON.stringify(returnValue));
		window.close();
	});
</script>
<script>
$("#treeGrid").on('rowSelect', function (event) {
    // event arguments
    var args = event.args;
    // row data
    var rowData = args.row;
    // row key
    var rowKey = args.key;
    
    if(rowData.name!=""){
    	location.href="/member/orgProMemInfo.member?id="+rowData.memId+"&rowKey="+rowKey;
    }
    
    console.log(args);
    console.log(rowData);
    console.log(rowKey);
});
</script>

<script>
	if("${dto.id}"==""){		
		$("#profileImage").attr("src", "/resources/profileImage/default.png");
	}
</script>

</html>