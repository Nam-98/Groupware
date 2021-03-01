package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.Company_holidayDTO;
import kh.gw.dto.ScheduleDTO;
import kh.gw.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private ScheduleService sservice;

	@Autowired
	private HttpSession session;

	//------------- 일정관리 들어오기
	@RequestMapping("enterSchedule.schedule")
	public String enterSchedule() throws Exception{
		return "/schedule/mainschedule";
	}

	//------------ 연간일정 들어오기
	@RequestMapping("yearSchedule.schedule")
	public String yearSchedule(HttpServletRequest request, Model m, ScheduleDTO dto) throws Exception{
		String id = (String)session.getAttribute("id");
		String year = request.getParameter("year");
		
		
		List<ScheduleDTO> list = sservice.yearSchedule(year);
		List<Company_holidayDTO> hlist = sservice.holidaySchedule();
		
		
		sservice.addhDateStr3(hlist);
		sservice.addDateStr3(list);

		System.out.println(hlist.get(0).getComp_hd_date_str());
		System.out.println(hlist.get(0).getComp_hd_name());
		System.out.println(hlist.get(1).getComp_hd_date_str());
		
		m.addAttribute("list", list);
		m.addAttribute("year", year);
		m.addAttribute("hlist", hlist);

		return "/schedule/yearschedule";
	}

	//------------- 월간일정 들어오기
	@RequestMapping("monthSchedule.schedule")
	public String monthSchedule(HttpServletRequest request, Model m, ScheduleDTO dto) throws Exception{
		String id = (String)session.getAttribute("id");
		List<ScheduleDTO> list = sservice.listAllSchedule(id);

		sservice.addDateStr(list);

		m.addAttribute("list", list);

		List<Company_holidayDTO> hlist = sservice.holidaySchedule();

		sservice.addhDateStr(hlist);

		m.addAttribute("hlist", hlist);
		//		 System.out.println(hlist.get(0).getComp_hd_date_str());


		return "/schedule/monthschedule";
	}

	//------------- 주간일정 들어오기
	@RequestMapping("weekSchedule.schedule")
	public String weekSchedule(HttpServletRequest request, Model m) throws Exception{
		String id = (String)session.getAttribute("id");
		List<ScheduleDTO> list = sservice.listAllSchedule(id);

		sservice.addDateStr(list);

		m.addAttribute("list", list);

		List<Company_holidayDTO> hlist = sservice.holidaySchedule();

		sservice.addhDateStr(hlist);

		m.addAttribute("hlist", hlist);
		return "/schedule/weekschedule";
	}

	//------------- 일간일정 들어오기
	@RequestMapping("daySchedule.schedule")
	public String daySchedule(HttpServletRequest request, Model m, ScheduleDTO dto) throws Exception{
		 String id = (String)session.getAttribute("id");
		 List<ScheduleDTO> list = sservice.listAllSchedule(id);
		 
		 sservice.addDateStr(list);
		 
		 //scheduledto에 날짜만 저장된 컬럼 2개를 만듬.
		 for(ScheduleDTO i : list) {
		 i.setSch_end_date_converter(sservice.dateconverter(i.getSch_end_date_sc()));
		 i.setSch_start_date_converter(sservice.dateconverter(i.getSch_start_date_sc()));
		 }	
		 
		 List<Company_holidayDTO> hlist = sservice.holidaySchedule();
		 sservice.addhDateStr(hlist);
		 
		 m.addAttribute("hlist", hlist);
		 m.addAttribute("list", list);
		 
		return "/schedule/dayschedule";
	}

	//------------- 일정추가 페이지 들어가기
	@RequestMapping("addSchedulePage.schedule")
	public String addSchedulePage() throws Exception{
		return "/schedule/addschedule";
	}

	//------------ 일정추가하기 made by 이 상 형
	@RequestMapping("addSchedule.schedule")
	public String addSchedule(HttpServletRequest request, ScheduleDTO dto, int condition, int condition2, int condition3, int condition4) throws Exception{

		dto.setSch_start_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getSch_start_date_sc()));
		dto.setSch_end_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getSch_end_date_sc()));

		//long 형 변수에 dto에서 불러온 시작날짜(date형) 값 대입
		long sch_start_date = dto.getSch_start_date().getTime();
		long sch_end_date = dto.getSch_end_date().getTime();

		//long 형 변수에 가져올 시간 값을 초단위로 바꾼 값을 더한다.
		sch_start_date = sch_start_date + ((3600 * condition) + (60 * condition2)) * 1000;
		sch_end_date = sch_end_date + ((3600 * condition3) + (60 * condition4)) * 1000;

		//long 형 변수를 date 형으로 변환
		Date plusStartDate = new Date(sch_start_date);
		Date plusEndDate = new Date(sch_end_date);

		//date 형 변수를 string 형으로 변환해 값 출력하기
		dto.setSch_start_date(plusStartDate);
		dto.setSch_end_date(plusEndDate);

		int result = sservice.insertSchedule(dto);
		
		return "/schedule/addscheduleview";
		


	}

	//------------- 일정 리스트 페이지 들어가기
	@RequestMapping("scheduleList.schedule")
	public String scheduleList() throws Exception{
		return "/schedule/schedulelist";
	}

	//------------- 일정 상세
	@RequestMapping("scheduleView.schedule")
	public String scheduleView(Model m, HttpServletRequest request, ScheduleDTO dto) throws Exception{
		dto.setSch_seq(Integer.parseInt(request.getParameter("sch_seq")));
		
		ScheduleDTO dtos = sservice.scheduleView(dto.getSch_seq());
		sservice.addDateStr2(dtos);
		 
		m.addAttribute("dtos", dtos);


		return "/schedule/scheduleView";
	}

	//------------- 일정 삭제하기
	@RequestMapping("scheduleDelete.schedule")
	public String scheduleDelete(HttpServletRequest request, ScheduleDTO dto) throws Exception{
		dto.setSch_seq(Integer.parseInt(request.getParameter("sch_seq")));
		int result = sservice.scheduleDelete(dto.getSch_seq());

		return "redirect:/schedule/monthSchedule.schedule?cpage="+session.getAttribute("cpage");
	}
	// ----------- 일정 수정 전
	@RequestMapping("scheduleModifyBefore.schedule")
	public String scheduleModifyBefore(HttpServletRequest request, Model m, ScheduleDTO dto) throws Exception{
		dto.setSch_seq(Integer.parseInt(request.getParameter("sch_seq")));
//		int sch_seq = Integer.parseInt(request.getParameter("sch_seq"));
		ScheduleDTO sdto = sservice.scheduleModifyBefore(dto.getSch_seq());

		m.addAttribute("sdto", sdto);
		
		return "/schedule/schedulemodifybeforeview";
	}

	// ----------- 일정 수정하기
	@RequestMapping("scheduleModify.schedule")
	public String scheduleModify(HttpServletRequest request, ScheduleDTO dto) throws Exception{
		dto.setSch_seq(Integer.parseInt(request.getParameter("sch_seq")));
		
		System.out.println(dto.getSch_seq());
		
		dto.setSch_start_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getSch_start_date_sc()));
		dto.setSch_end_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getSch_end_date_sc()));
		
		int result = sservice.scheduleModify(dto);
		System.out.println("글수정 성공유무 ::"+result);
		return "redirect:/schedule/scheduleView.schedule?sch_seq=" + dto.getSch_seq();
	}

	//메인 일정 추가하기
	@RequestMapping("mainAddSchedule.schedule")
	public String mainAddSchedule(ScheduleDTO dto) throws Exception{

		return "/schedule/mainaddschedule";
	}

	//------------- 휴가 상세
	@RequestMapping("holidayScheduleView.schedule")
	public String holidayScheduleView(Model m, HttpServletRequest request, Company_holidayDTO dto) throws Exception{
		dto.setComp_hd_seq(Integer.parseInt(request.getParameter("comp_hd_seq")));
		System.out.println(dto.getComp_hd_seq());

		Company_holidayDTO chdto = sservice.holidayScheduleView(dto.getComp_hd_seq());
		sservice.addhDateStr2(chdto);

		m.addAttribute("chdto", chdto);

		return "/schedule/holidayscheduleview";
	}
	
	


	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
