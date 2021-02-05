<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
   <!-- VENDOR CSS -->
   <link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
   <link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
   <link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
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
   <script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
   <script src="/assets/vendor/chartist/js/chartist.min.js"></script>
   <script src="/assets/scripts/klorofil-common.js"></script>
   <!-- Calendar -->
   <link href='/resources/lib/fullcalendar/main.css' rel='stylesheet' />
    <script src='/resources/lib/fullcalendar/main.js'></script>
</head>
<style>

</style>
<body>
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
               <h3 class="page-title">근태관리</h3>
               <div class="panel panel-headline demo-icons">
                  <!-- pannel 내부의 제목 작성 div-->
                  <div class="panel-heading">
                  <h3 class="panel-title">출 퇴 근 체 크</h3>
                  </div>
                  <div class="panel-body">
                  <span id="currentTimeSpan"></span>
                  <div class="">
                     ${attendanceValue.status }
                     <c:if test='${attendanceValue.status != "-"}'>
                        ${attendanceValue.hour }시
                        ${attendanceValue.minute }분
                     </c:if>

                  </div>
                  <div class="">
                     ${leaveWorkValue.status }
                     <c:if test='${leaveWorkValue.status != "-"}'>
                     ${leaveWorkValue.hour }시
                     ${leaveWorkValue.minute }분
                     </c:if>
                  </div>
                  <input type="button" value="출근하기" id="attendanceBtn" class="btn btn-gray btn-xs"> 
                  <input type="button" value="퇴근하기" id="leaveWorkBtn" class="btn btn-gray btn-xs">
</div>               
</div>
               <div class="panel panel-headline demo-icons">
                  <div class="panel-heading">
                  <h3 class="panel-title">월 별 근 태 현 황</h3>
                  </div>
                  <div class="panel-body">
                     <div id='calendar'></div>
                  </div>
               </div>
               
            </div>
         </div>
         <!-- END MAIN CONTENT -->
      </div>
      <!-- END MAIN -->
      <div class="clearfix"></div>
      <footer>
<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
      </footer>
   </div>
   <!-- END WRAPPER -->
   
   
   
   <script>
      
      var tnaStatus;
      if (("${attendanceValue.status }" == "-") && ("${leaveWorkValue.status }" == "-")) {
         tnaStatus = 0;
         document.getElementById("attendanceBtn").className = "btn btn-default btn-xs";
      }else if (("${attendanceValue.status }" != "-") && ("${leaveWorkValue.status }" == "-")) {
         tnaStatus = 1;
         document.getElementById("attendanceBtn").className = "btn btn-gray btn-xs";
         document.getElementById("leaveWorkBtn").className = "btn btn-default btn-xs";
      }else {
         tnaStatus = 2;
         document.getElementById("attendanceBtn").className = "btn btn-gray btn-xs";
         if ("${leaveWorkValue.status }" == "조퇴"){
        	 document.getElementById("leaveWorkBtn").className = "btn btn-warning btn-xs";
         }else if ("${leaveWorkValue.status }" == "퇴근"){
        	 document.getElementById("leaveWorkBtn").className = "btn btn-success btn-xs";
         }else{
        	 document.getElementById("leaveWorkBtn").className = "btn btn-danger btn-xs";
         }
         
         
      }
      // 0 : 출근 X 퇴근 X
      // 1 : 촐근 O 퇴근 X
      // 2 : 출근 O 퇴근 O
   
      // 출근버튼클릭
      $("#attendanceBtn").on("click", function() {
         if (tnaStatus == 0) {
            location.href = "/tna/attendanceInput.tna";   
         }
      })

      // 퇴근버튼클릭
      $("#leaveWorkBtn").on("click", function() {
         if (tnaStatus != 0) {
            location.href = "/tna/leaveWorkInput.tna";
         }
      })

      
      // 시간출력함수
      function printTime() {
         // 출력할 컴포넌트 아이디 지정
         var clock = document.getElementById("currentTimeSpan");
         // 현재날짜
         var now = new Date();
         // 요일출력 배열
         var week = ['일', '월', '화', '수', '목', '금', '토'];
         
         // 01월 02월 과 같이 깔끔하지 않은 형태 다듬기 위한 변수
         var printMonth = now.getMonth()+1;
         var printDate = now.getDate();
         
         // 시,분,초 10보다 작을경우 0 붙이기
         if (now.getHours() < 10) {
            printHours = "0" + now.getHours();
         }else {
            printHours = now.getHours();
         }
         if (now.getMinutes() < 10) {
            printMinutes = "0" + now.getMinutes();
         }else {
            printMinutes = now.getMinutes();
         }
         if (now.getSeconds() < 10) {
            printSeconds = "0" + now.getSeconds();
         }else {
            printSeconds = now.getSeconds();
         }
         
         var nowTime = now.getFullYear() + "년 " + printMonth + "월 " + printDate + "일 " + week[now.getDay()] + "요일 " + printHours + ":"  + printMinutes + ":" + printSeconds + "";
         
         clock.innerHTML = nowTime;
         setTimeout("printTime()",1000);
      }
      
      // 페이지 로드와 동시에 실행
      window.onload = function() {
         printTime();
      }
   </script>
   <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	headerToolbar: {
				left: 'title',
				center: '',
				right: 'today prev,next'
			},
// 			height: 100%,
			locale: 'ko',
			themeSystem: 'Cerulean',
			businessHours: true,
			eventClick: function(arg) {
				arg.jsEvent.preventDefault();
				
				if (arg.event.url) {
					if (confirm("정정 신청하시겠습니까?")) {
						var popupWidth = 800;
						var popupHeight = 600;
						var popupX = (window.screen.width / 2) - (popupWidth / 2);
						// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
						var popupY = (window.screen.height / 2) - (popupHeight / 2) - 50;
						// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
						
						var options='top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no, location=no';
						window.open(arg.event.url,"popup",options);
					}
				}
	        },
			events: [
				<c:forEach varStatus="i" var="list" items="${tnaCalendarList}">
					{
						title: '${list.TNA_START_STATUS_NAME}',
						start: '${list.TNA_START_TIME}',
						url: "/tna/tnaFixRequestPage.tna?tna_seq=${list.TNA_SEQ}&tna_status=start"
						<c:if test='${list.TNA_START_STATUS_NAME == "지각"}'>
							,color: '#e4cb10'
						</c:if>
						
					},
					{
						title: '${list.TNA_END_STATUS_NAME}',
						start: '${list.TNA_END_TIME}',
						url: "/tna/tnaFixRequestPage.tna?tna_seq=${list.TNA_SEQ}&tna_status=end"
						<c:if test='${list.TNA_END_STATUS_NAME == "조퇴"}'>
							,color: '#e4cb10'
						</c:if>
						<c:if test='${list.TNA_END_STATUS_NAME == "야근"}'>
							,color: '#18640f'
						</c:if>
					}
					<c:if test="${!i.last}">
					,
					</c:if>
				</c:forEach>
//         	  	{
//                   title: '출근',
//                   start: '2021-01-25T08:57:33'
//                 },
//                 {
//                   title: '퇴근',
//                   start: '2021-01-25T18:32:27'
//                 }
          	],
          	// default color
          	eventColor: '#41B314'
        });
        calendar.render();
      });

   </script>
   <script>
   // 메뉴바 축소시 캘린더 크기 조정
   $(".navbar-btn").on("click",function(){
	   $(".fc-col-header ").css({
		   "width": "100%"
       });
	   $(".fc-daygrid-body").css({
		   "width": "100%"
       });
	   $(".fc-scrollgrid-sync-table").css({
		   "width": "100%"
       });
   });
   </script>
</body>
</html>