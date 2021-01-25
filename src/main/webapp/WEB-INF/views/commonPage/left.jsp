<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--         <div class="sidebar-scroll"> -->
<!--             <nav> -->
<!--             <ul id="myUL" class="nav"> -->
<!--                 <li><a href="/" class=""><i class="lnr lnr-home"></i> <span>MainPage</span></a></li> -->
<!--                 <li> -->
<!--                     <a href="#subPagesApp1" data-toggle="collapse" class="collapsed"><i class="fas fa-file-signature"></i> <span>전자결재</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                     <div id="subPagesApp1" class="collapse "> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="/approval/toAppWriteView.approval" class="">결재서류작성</a></li> -->
<!--                             <li> -->
<!--                                 <a href="#subPagesApp2" data-toggle="collapse" class="collapsed"><i class="fas fa-archive"></i> <span>결재문서함</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                                 <div id="subPagesApp2" class="collapse "> -->
<!--                                     <ul class="nav"> -->
<!--                                         <li><a href="#" class="">개인문서함</a></li> -->
<!--                                         <li><a href="#" class="">협조문서함</a></li> -->
<!--                                         <li><a href="#" class="">참조문서함</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="#subPagesMsg1" data-toggle="collapse" class="collapsed"> <i class="fas fa-envelope"></i> <span>쪽지함</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                     <div id="subPagesMsg1" class="collapse "> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="#" class="">쪽지보내기(조직도검색)</a></li> -->
<!--                             <li> -->
<!--                                 <a href="#subPagesMsg2" data-toggle="collapse" class="collapsed"> <i class="fas fa-mail-bulk"></i> <span>보관함</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                                 <div id="subPagesMsg2" class="collapse "> -->
<!--                                     <ul class="nav"> -->
<!--                                         <li><a href="#" class="">수신함</a></li> -->
<!--                                         <li><a href="#" class="">발신함</a></li> -->
<!--                                         <li><a href="#" class="">보관함</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="#subPagesScd1" data-toggle="collapse" class="collapsed"> <i class="fas fa-calendar-alt"></i> <span>일정관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                     <div id="subPagesScd1" class="collapse "> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="#" class="">일정추가하기</a></li> -->
<!--                             <li> -->
<!--                                 <a href="#subPagesScd2" data-toggle="collapse" class="collapsed"> <i class="fas fa-calendar-check"></i> <span>일정보기</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                                 <div id="subPagesScd2" class="collapse "> -->
<!--                                     <ul class="nav"> -->
<!--                                         <li><a href="#" class="">일간일정</a></li> -->
<!--                                         <li><a href="#" class="">주간일정</a></li> -->
<!--                                         <li><a href="#" class="">월간일정</a></li> -->
<!--                                         <li><a href="#" class="">연간일정</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="#subPagesTna" data-toggle="collapse" class="collapsed"><i class="fas fa-clock"></i> <span>근태관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                     <div id="subPagesTna" class="collapse "> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="#" class="">출퇴근체크</a></li> -->
<!--                             <li><a href="#" class="">나의 근태내역</a></li> -->
<!--                             <li><a href="#" class="">근태조정신청</a></li> -->
<!--                             <li><a href="#" class="">근태조정내역</a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
<!--                 <li><a href="/member/orgnizationChart.member" class=""><i class="fas fa-sitemap"></i> <span>조직도</span></a></li> -->
<!--                 <li> -->
<!--                     <a href="#subPagesPjt" data-toggle="collapse" class="collapsed"> <i class="fab fa-trello"></i> <span>프로젝트관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                     <div id="subPagesPjt" class="collapse "> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="/project/addProject.project" class="">프로젝트 추가</a></li> -->
<!--                             <li><a href="/project/enterProjectList.project?cpage=1" class="">프로젝트 보기</a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="#subPagesCmt1" data-toggle="collapse" class="collapsed">  <i class="fas fa-users"></i> <span>커뮤니티</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                     <div id="subPagesCmt1" class="collapse "> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="#" class="">회사소개</a></li> -->
<!--                             <li> -->
<!--                                 <a href="#subPagesCmt2" data-toggle="collapse" class="collapsed"> <i class="fas fa-bell"></i> <span>공지사항</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                                 <div id="subPagesCmt2" class="collapse "> -->
<!--                                     <ul class="nav"> -->
<!--                                         <li><a href="#" class="/write/noticeList.write?cpage=1">회사공지사항</a></li> -->
<!--                                         <li><a href="#" class="/write/systemNoticeList.write?cpage=1">시스템공지사항</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="#subPagesCmt3" data-toggle="collapse" class="collapsed"> <i class="fas fa-comments"></i> <span>게시판</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                                 <div id="subPagesCmt3" class="collapse "> -->
<!--                                     <ul class="nav"> -->
<!--                                         <li><a href="#" class="#">회사게시판</a></li> -->
<!--                                         <li><a href="#" class="#">갤러리게시판</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="#subPagesMyp" data-toggle="collapse" class="collapsed"><i class="fas fa-id-card"></i> <span>마이페이지</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a> -->
<!--                     <div id="subPagesMyp" class="collapse "> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="/member/enterMyPage.member" class="">개인정보수정</a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
<!--             </ul> -->
<!--             </nav> -->
<!--         </div> -->
<style>
.left-logo {
	width: 260px;
	height: 70px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: black;
}

.left-left {
}
/* Remove default bullets */
ul, #myUL {
	list-style-type: none;
}

/* Remove margins and padding from the parent ul */
#myUL {
	margin: 0;
	padding: 0;
	position: absolute;
	 top: 70px;
    left: 0;
	
}

/* Style the caret/arrow */
.caret {
	cursor: pointer;
	user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret::before {
	content: "\25B6";
	color: black;
	display: inline-block;
	margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down::before {
	transform: rotate(90deg);
}

/* Hide the nested list */
.nested {
	display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active {
	display: block;
}
li>a{
    color: black;
   text-decoration: none;
    }
span>a{
    color: black;
   text-decoration: none;
    }
</style>
</head>
<body>
	<div class="leftcontainer">
		<div class="left-logo"></div>
		<div class="left-left">
		<ul id="myUL">
			<li><span class="caret">전자결재</span>
				<ul class="nested">
					<li>결재서류작성</li>
					<li><span class="caret">결재문서함</span>
						<ul class="nested">
							<li>개인문서함</li>
							<li>협조문서함</li>
							<li>참조문서함</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">쪽지함</span>
				<ul class="nested">
					<li>쪽지보내기(조직도검색)</li>
					<li><span class="caret">보관함</span>
						<ul class="nested">
							<li>수신함</li>
							<li>발신함</li>
							<li>보관함</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">일정관리</span>
				<ul class="nested">
					<li>일정추가하기</li>
					<li><span class="caret">일정보기</span>
						<ul class="nested">
							<li>일간일정</li>
							<li>주간일정</li>
							<li>월간일정</li>
							<li>연간일정</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">출퇴근/근태관리</span>
				<ul class="nested">
					<li>출퇴근체크</li>
					<li>나의근태내역</li>
					<li>근태조정신청</li>
					<li>근태조정내역</li>
				</ul></li>
			<li><span class="caret"><a href="/member/orgnizationChart.member">조직도</a></span></li>
			<li><span class="caret">프로젝트관리</span>
				<ul class="nested">
					<li>프로젝트추가</li>
					<li><a href="/project/enterProjectList.project?cpage=1">프로젝트보기</a></li>
				</ul></li>
			<li><span class="caret">커뮤니티</span>
				<ul class="nested">
					<li>회사소개</li>
					<li><span class="caret">공지사항</span>
						<ul class="nested">
							<li><a href="/write/noticeList.write?cpage=1">회사공지사항</a></li>
							<li><a href="/write/systemNoticeList.write?cpage=1">시스템공지사항</a></li>
						</ul></li>
					<li><span class="caret">게시판</span>
						<ul class="nested">
							<li><a href="/write/boardList.write?cpage=1">회사게시판</a></li>
							<li>갤러리게시판</li>
						</ul></li>
				</ul></li>
			<li><span class="caret">마이페이지</span>
				<ul class="nested">
					<li><a href="/member/enterMyPage.member">개인정보수정</a></li>
				</ul></li>
		</ul>
	</div>
	</div>
</body>
<script>
	var toggler = document.getElementsByClassName("caret");
	var i;

	for (i = 0; i < toggler.length; i++) {
		  toggler[i].addEventListener("click", function() {
		    this.parentElement.querySelector(".nested").classList.toggle("active");
		    this.classList.toggle("caret-down");
		  });
		}
</script>
</html>

