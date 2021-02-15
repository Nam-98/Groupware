package kh.gw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.service.WebhardService;

@Controller
@RequestMapping("/webhard")
public class WebhardController {
	
	@Autowired
	private WebhardService whservice;
	@Autowired
	private HttpSession session;
	
	// 웹하드 접속
	@RequestMapping("webhardMain.webhard")
	public String webhardMain(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		
		// 최초 웹하드 접속시 개인 폴더 생성
		whservice.personalMkdir(sessionId);
		
		return "/webhard/webhardMain";
	}
	
}
