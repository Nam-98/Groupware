package kh.gw.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	// 출퇴근체크 페이지 접속
	public String tnaCheckPage(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		
		// 출근시간 조회
		Map<String, Object> attendanceValue = tservice.getAttendanceTime(sessionId);
		// 퇴근시간 조회
		Map<String, Object> leaveWorkValue = tservice.getLeaveWorkTime(sessionId);
		// 출퇴근시근 리스트 조회
		List<Map<String, Object>> tnaCalendarList = tservice.getTnaCalendarList(sessionId);
//		System.out.println(tnaCalendarList.get(0).get("TNA_SEQ"));
//		System.out.println(tnaCalendarList.get(0).get("TNA_ID"));
//		System.out.println(tnaCalendarList.get(0).get("TNA_START_TIME"));
//		System.out.println(tnaCalendarList.get(0).get("TNA_END_TIME"));
//		System.out.println(tnaCalendarList.get(0).get("TNA_STATUS_CODE"));
//		System.out.println(tnaCalendarList.get(0).get("TNA_STATUS_NAME"));
		
		model.addAttribute("attendanceValue", attendanceValue);
		model.addAttribute("leaveWorkValue", leaveWorkValue);
		model.addAttribute("tnaCalendarList", tnaCalendarList);
		
		return "/tna/user/tnaCheck";
	}

	@RequestMapping("attendanceInput.tna")
	// 출근버튼 눌렀을 경우
	public String attendanceInput(HttpServletRequest request) throws ParseException {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		// 이전 페이지 주소값
		String referer = request.getHeader("REFERER");
		
		int result = tservice.attendanceInput(sessionId);
		return "redirect:" + referer;
	}
	
	@RequestMapping("leaveWorkInput.tna")
	// 퇴근버튼 눌렀을 경우
	public String leaveWorkInput(HttpServletRequest request) throws ParseException {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		// 이전 페이지 주소값
		String referer = request.getHeader("REFERER");
		
		int result = tservice.leaveWorkInput(sessionId);
		return "redirect:" + referer;
	}
	
	@RequestMapping("tnaMyHistoryPage.tna")
	// 근퇴조정신청 페이지 접속
	public String tnaMyHistoryPage(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		
//		// 출근시간 조회
//		Map<String, Object> attendanceValue = tservice.getAttendanceTime(sessionId);
//		// 퇴근시간 조회
//		Map<String, Object> leaveWorkValue = tservice.getLeaveWorkTime(sessionId);
//		// 출퇴근시근 리스트 조회
//		List<Map<String, Object>> tnaCalendarList = tservice.getTnaCalendarList(sessionId);
		
//		model.addAttribute("tnaCalendarList", tnaCalendarList);
		
		return "/tna/user/tnaMyHistory";
	}
	
	@RequestMapping("tnaFixRequestPage.tna")
	// 근퇴조정신청 페이지 접속
	public String tnaFixRequestPage(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		
//		// 출근시간 조회
//		Map<String, Object> attendanceValue = tservice.getAttendanceTime(sessionId);
//		// 퇴근시간 조회
//		Map<String, Object> leaveWorkValue = tservice.getLeaveWorkTime(sessionId);
//		// 출퇴근시근 리스트 조회
//		List<Map<String, Object>> tnaCalendarList = tservice.getTnaCalendarList(sessionId);
		
//		model.addAttribute("tnaCalendarList", tnaCalendarList);
		
		return "/tna/user/tnaFixRequest";
	}
	
	@RequestMapping("tnaFixHistoryPage.tna")
	// 근퇴조정신청 페이지 접속
	public String tnaFixHistoryPage(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		
//		// 출근시간 조회
//		Map<String, Object> attendanceValue = tservice.getAttendanceTime(sessionId);
//		// 퇴근시간 조회
//		Map<String, Object> leaveWorkValue = tservice.getLeaveWorkTime(sessionId);
//		// 출퇴근시근 리스트 조회
//		List<Map<String, Object>> tnaCalendarList = tservice.getTnaCalendarList(sessionId);
		
//		model.addAttribute("tnaCalendarList", tnaCalendarList);
		
		return "/tna/user/tnaFixHistory";
	}
	
	

}
