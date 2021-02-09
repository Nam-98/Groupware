package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.ScheduleDTO;
import kh.gw.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private ScheduleService sservice;
	
	@Autowired
	private HttpSession session;
	
	//-------------일정관리 들어오기
	@RequestMapping("enterSchedule.schedule")
	public String enterSchedule() throws Exception{
		return "/schedule/mainschedule";
	}
	
	//-------------월간일정 들어오기
	@RequestMapping("monthSchedule.schedule")
	public String monthSchedule() throws Exception{
		return "/schedule/monthschedule";
	}
	
	//-------------주간일정 들어오기
	@RequestMapping("weekSchedule.schedule")
	public String weekSchedule() throws Exception{
		return "/schedule/weekschedule";
	}
	
	//-------------일간일정 들어오기
	@RequestMapping("daySchedule.schedule")
	public String daySchedule() throws Exception{
		return "/schedule/dayschedule";
	}
	
	//-------------일정추가 페이지 들어가기
	@RequestMapping("addSchedulePage.schedule")
	public String addSchedulePage() throws Exception{
		return "/schedule/addschedule";
	}
	
	//------------ 일정추가하기
	@RequestMapping("addSchedule.schedule")
	public String addSchedule(ScheduleDTO dto) throws Exception{
		dto.setSch_start_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getSch_start_date_sc()));
		dto.setSch_end_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getSch_end_date_sc()));
		System.out.println(dto.getSch_start_date());
		int result = sservice.insertSchedule(dto);
		return "/schedule/monthschedule"; // 수정해야함
	}
	
	//-------------일정 리스트 페이지 들어가기
	@RequestMapping("scheduleList.schedule")
	public String scheduleList() throws Exception{
		return "/schedule/schedulelist";
	}
	
	//-------------일정 리스트 만들기
	@RequestMapping("scheduleListProc.schedule")
	public String scheduleListProc(Model m, HttpServletRequest request, ScheduleDTO dto) throws Exception{
		String sessionId = (String)session.getAttribute("id");
		List<ScheduleDTO>list = sservice.scheduleListProc(dto.getSch_start_date());
		
		m.addAttribute("list",list);
		return "/schedule/schedulelist";
	}
	
	
}
