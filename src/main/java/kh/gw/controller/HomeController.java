package kh.gw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.Project_kanbanDTO;
import kh.gw.dto.ScheduleDTO;
import kh.gw.service.ApprovalService;
import kh.gw.service.MessageService;
import kh.gw.service.ProjectService;
import kh.gw.service.ScheduleService;

@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ApprovalService aservice;
	
	@Autowired
	private MessageService mservice;
	
//	@Autowired
//	private TnAService tservice;


	@Autowired
	private ProjectService pservice;
	

	@RequestMapping("/")
	public String home(Model model) throws Exception{
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			//model.addAttribute("isWork", tservice.isGoLeave(id));
			String result = mservice.msgCount(id);
			
			//(양혜림)프로젝트관리
			//담당 칸반 갯수?
			List<Project_kanbanDTO> pkdtoList = pservice.getProKanInfoById(id);
			//완성도 계산
			List<Map<String,Object>> HLMap = pservice.proPercent(pkdtoList);

			model.addAttribute("map",HLMap);
			//프로젝트의 진행률(각?)
			
			//(김나린)
			HashMap<String, Object> knrAppResult = aservice.knrMainTobeSignList();
			if(((int)knrAppResult.get("error"))==-1) {System.out.println("MainPage의 app서비스 가져오는 중 에러 발생");return "error";}
			//승인요청중인리스트 & 갯수
			model.addAttribute("knrToBeList", knrAppResult.get("resultList"));
			model.addAttribute("knrToBeCount",  knrAppResult.get("toBeSignCount"));
			//상신 문서 리스트 - 인자값으로 넣는 숫자는 가져올 목록의 갯수로, 원하는대로 변경하여 사용하시면 됩니다.
			model.addAttribute("knrWriteList",aservice.getMainWriteList(3));

			//(최재준)
			//월간일정완성되면 달력에 띄울수 있도록리스트 받아주기
			//공지사항 리스트 최근 3개
	        
			//(김근수)
			//수신쪽지 리스트 최신 5?
			//안읽은 총 갯수
			
			
			
			
			model.addAttribute("result", result);
			return "/main/mainpage";
		} 
			return "home";
		}
	
}
