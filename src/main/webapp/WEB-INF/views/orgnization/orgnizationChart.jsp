<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>
<!--tree  -->
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.energyblue.css"
	type="text/css" />
<link rel="stylesheet"
	href="/resources/lib/jqwidgets/styles/jqx.jqx-grid-cell-hover.css"
	type="text/css" />
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
                	$('#treeGrid').jqxTreeGrid({height:"500px"});
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
.profilBox>img {
	width: 100%;
	height: 100%;
}

.profilBox {
	width: 130px;
	height: 200px;
	text-align: center;
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
					<h3 class="page-title">조직도</h3>
					
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading"></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div id="treeGrid"></div>
								</div>
								
								<div class="col-md-9">
									<div class="">
											<br>
											<br>
											<br>
										<div class="panel panel-headline demo-icons">
											<div class="panel-heading">
												<h3 class="panel-title">사 원 정 보</h3>
												<div class="right">
													<input type="button" id="askFix"
														class="btn btn-sm btn-warning" value="쪽지보내기">
												</div>
											</div>
											<div class="panel-body">
										
												<div class="row">
													<div class="col-md-2 col-12">
														<div class="profilBox d-none d-lg-block">
															<img class="profileImg img-thumbnail" id="profileImage" alt="${dto.id}"
																src="/resources/profileImage/${dto.id}.png">
														</div>
													</div>
													<div class="col-md-10 col-12">
														<table class="table table-sm">
															<tbody>
																<tr>
																	<th scope="row">이 름</th>
																	<td>${dto.name}</td>
																	<th scope="row">생 년 월 일</th>
																	<td>${dto.birth}</td>
																</tr>
																<tr>
																	<th scope="row">연 락 처</th>
																	<td>${dto.contact}</td>
																	<th scope="row">성 별</th>
																	<td>${dto.gender}</td>
																</tr>
																<tr>
																	<th scope="row">주 소</th>
																	<td>${dto.address1}</td>
																	<th scope="row">상 세 주 소</th>
																	<td>${dto.address2}(${dto.zip_code})</td>
																</tr>
																<tr>
																	<th scope="row">결 혼 유 무</th>
																	<td>${dto.is_married}</td>
																	<th scope="row">입 사 일</th>
																	<td>${dto.reg_date}</td>
																</tr>
																<tr>
																	<th scope="row">부 서</th>
																	<td>${dto.dept_name}</td>
																	<th scope="row">직 위</th>
																	<td>${dto.position_name}</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
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
</body>
<script>
$("#treeGrid").on('rowSelect', function (event) {
    // event arguments
    var args = event.args;
    // row data
    var rowData = args.row;
    // row key
    var rowKey = args.key;
    
    if(rowData.name!=""){
    	location.href="/member/orgMemInfo.member?id="+rowData.memId+"&rowKey="+rowKey;

    }
    console.log(args);
    console.log(rowData);
    console.log(rowKey);
});
</script>

<script>
document.getElementById("askFix").onclick = function(){
	location.href="/message/orgSendMessage.message?msg_receiver_name=${dto.name} ${dto.position_name}&msg_receiver=${dto.id}";
}
</script>
<script>
if("${dto.id}"==""){		
	$("#profileImage").attr("src", "/resources/profileImage/default.png");
	$("#askFix").hide();
}
</script>
</html>