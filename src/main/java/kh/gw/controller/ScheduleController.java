package kh.gw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private ScheduleService sservice;
	
	//-------------일정관리 들어오기
	@RequestMapping("enterSchedule.schedule")
	public String enterSchedule() throws Exception{
		return "/schedule/mainschedule";
	}
	
	@RequestMapping("monthSchedule.schedule")
	public String yearSchedule() throws Exception{
		return "/schedule/monthschedule";
	}
	
	@RequestMapping("addSchedulePage.schedule")
	public String addSchedulePage() throws Exception{
		return "/schedule/addschedule";
	}
	@RequestMapping("scheduleList.schedule")
	public String scheduleList() throws Exception{
		return "/schedule/schedulelist";
	}
}
