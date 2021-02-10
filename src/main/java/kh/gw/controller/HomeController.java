package kh.gw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.service.MessageService;


@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MessageService mservice;
	
//	@Autowired
//	private TnAService tservice;

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
			//
			
			//(이상형)
			
			model.addAttribute("result", result);
			return "/main/mainpage";
		} 
			return "home";
		}
	
}
