<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


        <div class="sidebar-scroll">
            <nav>
            <ul id="myUL" class="nav">
                <li><a href="/" class=""><i class="lnr lnr-home"></i> <span>MainPage</span></a></li>
                <li>
                    <a href="#subPagesApp1" data-toggle="collapse" class="collapsed"><i class="fas fa-file-signature"></i> <span>전자결재</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPagesApp1" class="collapse ">
                        <ul class="nav">
                            <li><a href="/approval/toAppWriteView.approval" class="">결재서류작성</a></li>
                            <li>
                                <a href="#subPagesApp2" data-toggle="collapse" class="collapsed"><i class="fas fa-archive"></i> <span>결재문서함</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPagesApp2" class="collapse ">
                                    <ul class="nav">
                                        <li><a href="/approval/toToBeSignListView.approval?cPage=1" class="">결재 진행중 문서함</a></li>
                                        <li><a href="/approval/toMySignListView.approval?cPage=1" class="">결재 완료 문서함</a></li>
                                        <li><a href="/approval/toCCListView.approval?cPage=1" class="">참조문서함</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                 <li><a href="/bizlog/toMainPage.bizlog" class="" id="bizlogHref"><i class="fas fa-pen-square"></i> <span>업무일지</span></a></li>         
                
                <li>
                    <a href="#subPagesMsg1" data-toggle="collapse" class="collapsed"> <i class="fas fa-envelope"></i> <span>쪽지함<span class="badge rounded-pill bg-danger" id="asdd1"></span></span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPagesMsg1" class="collapse ">
                        <ul class="nav">
                            <li><a href="/message/writeMsg.message" class="">쪽지보내기(조직도검색)</a></li>
                            <li>
                                <a href="#subPagesMsg2" data-toggle="collapse" class="collapsed"> <i class="fas fa-mail-bulk"></i> <span>보관함<span class="badge rounded-pill bg-danger" id="asdd2"></span></span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPagesMsg2" class="collapse ">
                                    <ul class="nav">
                                        <li><a href="/message/msgInBoxList.message?cpage=1" class="">수신함<span class="badge rounded-pill bg-danger" id="asdd3"></span></a></li>
                                        <li><a href="/message/msgOutBoxList.message?cpage=1" class="">발신함</a></li>
                                        <li><a href="/message/msgCabList.message?cpage=1" class="">보관함</a></li>
                                        <li><a href="/message/msgMyBoxList.message?cpage=1" class="">내게쓴쪽지함</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#subPagesScd1" data-toggle="collapse" class="collapsed"> <i class="fas fa-calendar-alt"></i> <span>일정관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPagesScd1" class="collapse ">
                        <ul class="nav">
                            <li><a href="/schedule/mainAddSchedule.schedule" class="">일정추가하기</a></li>
                            <li>
                                <a href="#subPagesScd2" data-toggle="collapse" class="collapsed"> <i class="fas fa-calendar-check"></i> <span>일정보기</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPagesScd2" class="collapse ">
                                    <ul class="nav">
                                        <li><a href="/schedule/daySchedule.schedule" class="">일간일정</a></li>
                                        <li><a href="/schedule/weekSchedule.schedule" class="">주간일정</a></li>
                                        <li><a href="/schedule/monthSchedule.schedule" class="">월간일정</a></li>
                                        <li><a href="/schedule/yearSchedule.schedule" class="">연간일정</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li><a href="javascript:void(0);" class="goWebhard"><i class="glyphicon glyphicon-cloud-download"></i> <span>웹하드</span></a></li>
                <li>
                    <a href="#subPagesTna" data-toggle="collapse" class="collapsed"><i class="fas fa-clock"></i> <span>근태관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPagesTna" class="collapse ">
                        <ul class="nav">
                            <li><a href="/tna/tnaCheckPage.tna" class="">출퇴근체크</a></li>
                            <li><a href="/tna/tnaMyHistoryPage.tna" class="">나의 근태내역</a></li>
                            <li><a href="/tna/tnaFixHistoryPage.tna" class="">근태조정내역</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="/member/orgnizationChart.member" class=""><i class="fas fa-sitemap"></i> <span>조직도</span></a></li>
                <li>
                    <a href="#subPagesPjt" data-toggle="collapse" class="collapsed"> <i class="fab fa-trello"></i> <span>프로젝트관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPagesPjt" class="collapse ">
                        <ul class="nav">
                            <li><a href="/project/addProject.project" class="">프로젝트 추가</a></li>
                            <li><a href="/project/enterProjectList.project?cpage=1" class="">프로젝트 보기</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#subPagesCmt1" data-toggle="collapse" class="collapsed">  <i class="fas fa-users"></i> <span>커뮤니티</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPagesCmt1" class="collapse ">
                        <ul class="nav">
                            <li><a href="/write/introCompany.write" class="">회사소개</a></li>
                            <li>
                                <a href="#subPagesCmt2" data-toggle="collapse" class="collapsed"> <i class="fas fa-bell"></i> <span>공지사항</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPagesCmt2" class="collapse ">
                                    <ul class="nav">
                                        <li><a href="/write/noticeList.write?cpage=1" class="">회사공지사항</a></li>
                                        <li><a href="/write/systemNoticeList.write?cpage=1" class="">시스템공지사항</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#subPagesCmt3" data-toggle="collapse" class="collapsed"> <i class="fas fa-comments"></i> <span>게시판</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPagesCmt3" class="collapse ">
                                    <ul class="nav">
                                        <li><a href="/write/boardList.write?cpage=1" class="#">회사게시판</a></li>
                                        <li><a href="/write/boardGalleryList.write?cpage=1" class="#">갤러리게시판</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                    <li><a href="/member/enterMyPage.member" class=""><i class="fas fa-user-cog"></i> <span>마이페이지</span></a></li>         
      </ul>
            </nav>
        </div>
        

     <script>
/* 		setInterval(function(){
				$.ajax({
					url : "/message/msgCount.message",
					type : "post",
				}).done(function(result){
						console.log("result123 : "+result);
					let json = JSON.parse(result);
						console.log(json);
						if(result != 0){
						document.getElementById("asdd1").innerHTML = result;
						document.getElementById("asdd2").innerHTML = result;
						document.getElementById("asdd3").innerHTML = result;}
					})
			}
		,5000); */
		window.addEventListener('DOMContentLoaded', function(){
			var aBiz = document.getElementById("bizlogHref");
			var today = new Date();
			var sYear = today.getFullYear();
			var sMonth = today.getMonth()+1;//달은 0부터 시작하기 때문에 +1을 함.(1월 == 0, 2월 == 1, 12월 == 11)
			aBiz.setAttribute("href", "/bizlog/toMainPage.bizlog?strDate="+sYear+"-"+sMonth);
		})
	</script> 
	
	<script>
		$('.goWebhard').on('click', function(){
			var url = "/webhard/webhardMain.webhard";
			var popupWidth = 1440;
			var popupHeight = 810;
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
			var popupY = (window.screen.height / 2) - (popupHeight / 2) - 50;
			// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
			
			var options='top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no, location=no';
			window.open(url,"popup",options);
		})
	</script>

