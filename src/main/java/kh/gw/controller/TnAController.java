package kh.gw.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.gw.service.TnAService;

@Controller
@RequestMapping("/tna")
public class TnAController {
	
	@Autowired
	private TnAService tservice;
	
	@Autowired
	private HttpSession session;


	@RequestMapping("tnaCheckPage.tna")
	public String tnaCheckPage(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		
		// 출근시간 조회
		Map<String, Object> attendanceValue = tservice.getAttendanceTime(sessionId);
		// 퇴근시간 조회
		Map<String, Object> leaveWorkValue = tservice.getLeaveWorkTime(sessionId);
		
		
		model.addAttribute("attendanceValue", attendanceValue);
		model.addAttribute("leaveWorkValue", leaveWorkValue);
		
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
