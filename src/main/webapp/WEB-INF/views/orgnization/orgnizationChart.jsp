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
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>
    <!--tree  -->
    <link rel="stylesheet" href="/resources/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
     <link rel="stylesheet" href="/resources/lib/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
    <script type="text/javascript" src="/resources/lib/scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxdatatable.js"></script>
    <script type="text/javascript" src="/resources/lib/jqwidgets/jqxtreegrid.js"></script>
    <script type="text/javascript" src="/resources/lib/scripts/demos.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var employees = [
               /* { "EmployeeID": 1, "FirstName": "Nancy", "LastName": "Davolio", "ReportsTo": 2, "Country": "USA", "Title": "Sales Representative", "HireDate": "1992-05-01 00:00:00", "BirthDate": "1948-12-08 00:00:00", "City": "Seattle", "Address": "507 - 20th Ave. E.Apt. 2A" }, 
               { "EmployeeID": 2, "FirstName": "Andrew", "LastName": "Fuller", "ReportsTo": null, "Country": "USA", "Title": "Vice President, Sales", "HireDate": "1992-08-14 00:00:00", "BirthDate": "1952-02-19 00:00:00", "City": "Tacoma", "Address": "908 W. Capital Way" }, 
               { "EmployeeID": 3, "FirstName": "Janet", "LastName": "Leverling", "ReportsTo": 2, "Country": "USA", "Title": "Sales Representative", "HireDate": "1992-04-01 00:00:00", "BirthDate": "1963-08-30 00:00:00", "City": "Kirkland", "Address": "722 Moss Bay Blvd." }, { "EmployeeID": 4, "FirstName": "Margaret", "LastName": "Peacock", "ReportsTo": 2, "Country": "USA", "Title": "Sales Representative", "HireDate": "1993-05-03 00:00:00", "BirthDate": "1937-09-19 00:00:00", "City": "Redmond", "Address": "4110 Old Redmond Rd." }, { "EmployeeID": 5, "FirstName": "Steven", "LastName": "Buchanan", "ReportsTo": 2, "Country": "UK", "Title": "Sales Manager", "HireDate": "1993-10-17 00:00:00", "BirthDate": "1955-03-04 00:00:00", "City": "London", "Address": "14 Garrett Hill" }, { "EmployeeID": 6, "FirstName": "Michael", "LastName": "Suyama", "ReportsTo": 5, "Country": "UK", "Title": "Sales Representative", "HireDate": "1993-10-17 00:00:00", "BirthDate": "1963-07-02 00:00:00", "City": "London", "Address": "Coventry House Miner Rd." }, { "EmployeeID": 7, "FirstName": "Robert", "LastName": "King", "ReportsTo": 5, "Country": "UK", "Title": "Sales Representative", "HireDate": "1994-01-02 00:00:00", "BirthDate": "1960-05-29 00:00:00", "City": "London", "Address": "Edgeham Hollow Winchester Way" }, { "EmployeeID": 8, "FirstName": "Laura", "LastName": "Callahan", "ReportsTo": 2, "Country": "USA", "Title": "Inside Sales Coordinator", "HireDate": "1994-03-05 00:00:00", "BirthDate": "1958-01-09 00:00:00", "City": "Seattle", "Address": "4726 - 11th Ave. N.E." }, { "EmployeeID": 9, "FirstName": "Anne", "LastName": "Dodsworth", "ReportsTo": 5, "Country": "UK", "Title": "Sales Representative", "HireDate": "1994-11-15 00:00:00", "BirthDate": "1966-01-27 00:00:00", "City": "London", "Address": "7 Houndstooth Rd." } */
                  
               <c:forEach varStatus="i" items="${list}" var="dto">
               {"departmentID": ${dto.departmentID}, 
            	   "ReportsTo": ${dto.reportsTo},
                  "departmentName": "${dto.departmentName}",
                  "name": "${dto.name}", 
                  "position": "${dto.position}"
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
                width: 450,
                source: dataAdapter,
                theme: 'energyblue',
                ready: function () {
                    //$("#treeGrid").jqxTreeGrid('expandRow', 0);
                   
                },
                columns: [
                { text: '부서', dataField: 'departmentName', width: 150 },
                  { text: '성명', dataField: 'name', width: 150 },
                  { text: '직급', dataField: 'position', width: 150 }
                ]
            });
        });
    </script>
</head>
<body class='default'>
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
               <div class="maincontainer">

    <div id="treeGrid">
    </div>
                      <div class="orgInfo" style="border: 1px solid black;">
                     <div class="panel panel-headline demo-icons">

                        <div class="panel-heading">
                           <h3 class="panel-title">개 인 정 보</h3>
                        </div>
                        <div class="panel-body">
                           <div class="col-lg-2 col-12">
                              <div class="bodyContents loginInfo">

                                 <div class="top-vacant d-none d-lg-block"></div>
                                 <div class="top-vacant d-none d-lg-block"></div>
                                 <div class="profilBox d-none d-lg-block">
                                    <img class="profileImg img-thumbnail" alt="${dto.id}"
                                       src="/resources/profileImage/${dto.id}.png">

                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-10 col-12">
                              <div class="bodyContents">
                                 <div class="row">
                                    <div class="col-lg-10 d-none d-lg-block"></div>
                                    <div class="col-lg-2 col-12">
                                       <button type="button" id="askFix" class="btn btn-warning">쪽지
                                          보내기</button>
                                    </div>
                                 </div>
                                 <div class="top-vacant d-none d-lg-block"></div>
                                 <div class="card-body">
                                    <table class="table table-sm">
                                       <thead>
                                          <tr class="table-secondary">
                                             <th scope="col">항 목</th>
                                             <th scope="col">내 용</th>
                                             <th scope="col">항 목</th>
                                             <th scope="col">내 용</th>
                                          </tr>
                                       </thead>
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
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <div class="maincontainer row">
                        <div class="col-lg-12 col-12">
                           <div class="bodyContents">

                              <div class="panel panel-headline demo-icons">
                                 <div class="panel-heading">
                                    <h3 class="panel-title">사 원 정 보</h3>
                                 </div>
                                 <div class="panel-body">
                                    <table class="table table-sm">
                                       <thead>
                                          <tr class="table-secondary">
                                             <th scope="col">항 목</th>
                                             <th scope="col">내 용</th>
                                             <th scope="col">항 목</th>
                                             <th scope="col">내 용</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <th scope="row">부 서</th>
                                             <td>${dto.dept_name}</td>
                                             <th scope="row">직 위</th>
                                             <td>${dto.position_name}</td>
                                          </tr>
                                          <tr>
                                             <th scope="row">입 사 일</th>
                                             <td>${dto.reg_date}</td>
                                             <th scope="row">퇴 사 일</th>
                                             <td>${dto.retire_date}</td>
                                          </tr>
                                          <tr>
                                             <th scope="row">휴 가 일 수</th>
                                             <td>${dto.break_use_count}일/${dto.break_total_count}
                                                일</td>
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
         <!-- END MAIN CONTENT -->
      </div>
      <!-- END MAIN -->
      <div class="clearfix"></div>
      <jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
   </div>
   <!-- END WRAPPER -->
   
</body>
</html>