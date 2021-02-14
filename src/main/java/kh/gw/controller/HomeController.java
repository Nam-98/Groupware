package kh.gw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.ScheduleDTO;
import kh.gw.service.MessageService;
import kh.gw.service.ScheduleService;


@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MessageService mservice;
	
//	@Autowired
//	private TnAService tservice;
	
	@Autowired
	private ScheduleService sservice;

	@RequestMapping("/")
	public String home(Model model) throws Exception{
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			//model.addAttribute("isWork", tservice.isGoLeave(id));
			String result = mservice.msgCount(id);
			
			//(양혜림)프로젝트관리
			//담당 프로젝트 갯수? 칸반 갯수?
			//프로젝트의 진행률(각?)
			
			//(김나린)
			//승인요청중인리스트 & 갯수
			//상신 문서 리스트
			
			//(최재준)
			//월간일정완성되면 달력에 띄울수 있도록리스트 받아주기
			//공지사항 리스트 최근 3개
			List<ScheduleDTO> list = sservice.listAllSchedule(id);
			 
			sservice.addDateStr(list);
			 
			model.addAttribute("list", list);
			//(김근수)
			//수신쪽지 리스트 최신 5?
			//안읽은 총 갯수
			
			
			
			
			model.addAttribute("result", result);
			return "/main/mainpage";
		} 
			return "home";
		}
	
}
