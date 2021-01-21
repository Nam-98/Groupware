package kh.gw.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.service.TnAService;

@Controller
@RequestMapping("/tna")
public class TnAController {
	
	@Autowired
	private TnAService tservice;
	
	@Autowired
	private HttpSession session;


	@RequestMapping("tnaCheckPage.tna")
	public String tnaCheckPage() {
		return "/tna/user/tnaCheck";
	}

	@RequestMapping("attendanceInput.tna")
	public String attendanceInput(HttpServletRequest request) throws ParseException {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		// 이전 페이지 주소값
		String referer = request.getHeader("REFERER");
		
		int result = tservice.attendanceInput(sessionId);
		return "redirect:" + referer;
	}
	@RequestMapping("leaveWorkInput.tna")
	public String leaveWorkInput(HttpServletRequest request) throws ParseException {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		// 이전 페이지 주소값
		String referer = request.getHeader("REFERER");
		
		int result = tservice.leaveWorkInput(sessionId);
		return "redirect:" + referer;
	}

}
