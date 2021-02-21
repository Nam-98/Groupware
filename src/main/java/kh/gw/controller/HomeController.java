package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.MessageDTO;
import kh.gw.dto.Project_kanbanDTO;
import kh.gw.dto.ScheduleDTO;
import kh.gw.dto.WriteDTO;
import kh.gw.dto.Write_commentsDTO;
import kh.gw.service.ApprovalService;
import kh.gw.service.MessageService;
import kh.gw.service.ProjectService;
import kh.gw.service.ScheduleService;
import kh.gw.service.TnAService;
import kh.gw.service.WriteService;


@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private WriteService wservice;
	
	@Autowired
	private ApprovalService aservice;
	
	@Autowired
	private MessageService mservice;
	
	@Autowired
	private TnAService tservice;
	
	@Autowired
	private ScheduleService sservice;


	@Autowired
	private ProjectService pservice;
	

	@RequestMapping("/")
	public String home(Model model) throws Exception{
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			String result = mservice.msgCount(id);
			//model.addAttribute("isWork", tservice.isGoLeave(id));

			
			// 출근시간 조회
			Map<String, Object> attendanceValue = tservice.getAttendanceTime(id);
			// 퇴근시간 조회
			Map<String, Object> leaveWorkValue = tservice.getLeaveWorkTime(id);
			model.addAttribute("attendanceValue", attendanceValue);
			model.addAttribute("leaveWorkValue", leaveWorkValue);
			
			
			//(양혜림)프로젝트관리
			//담당 칸반 갯수?
			List<Project_kanbanDTO> pkdtoList = pservice.getProKanInfoById(id);
			//완성도 계산
			List<Map<String,Object>> HLMap = pservice.proPercent(pkdtoList);

			model.addAttribute("map",HLMap);
			//프로젝트의 진행률(각?)
			
			//(김나린)
			HashMap<String, Object> knrAppResult = aservice.knrMainTobeSignList();
			if(((int)knrAppResult.get("error"))==-1) {
				System.out.println("MainPage의 app서비스 가져오는 중 에러 발생");return "error";
			}else if(((int)knrAppResult.get("error"))==-2) {
				System.out.println("가져온 리스트가 없음");
			}
			//승인요청중인리스트 & 갯수
			model.addAttribute("knrToBeList", knrAppResult.get("resultList"));
			model.addAttribute("knrToBeCount",  knrAppResult.get("toBeSignCount"));
			//상신 문서 리스트 - 인자값으로 넣는 숫자는 가져올 목록의 갯수로, 원하는대로 변경하여 사용하시면 됩니다.
			model.addAttribute("knrWriteList",aservice.getMainWriteList(5));

			//(최재준)
			//월간일정완성되면 달력에 띄울수 있도록리스트 받아주기
			List<ScheduleDTO> list = sservice.listAllSchedule(id);
			sservice.addDateStr(list);
			model.addAttribute("list", list);
			
			//공지사항 리스트 최근 3개
			int cpage = 1;
			
			List<WriteDTO>wlist = wservice.noticePopupList(cpage,"00");
			wservice.addDateStr(wlist);
			model.addAttribute("wlist", wlist);
			
			
			//(김근수)
			//수신쪽지 리스트 최신 5?
			List<MessageDTO> kgsMsgList = mservice.kgsMsgList(id,cpage);
			model.addAttribute("kgsMsgList",kgsMsgList);
			//안읽은 총 갯수
			String kgsMsgCount = mservice.msgCount(id);
			model.addAttribute("kgsMsgCount", kgsMsgCount);
			
			return "/main/mainpage";
		} 
			return "home";
		}
	
}
