package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;
import kh.gw.service.MemberService;
import kh.gw.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService pservice;

	@Autowired
	private MemberService mservice;
	
	@Autowired
	private HttpSession session;

	//프로젝트 리스트 가져오기
	@RequestMapping("enterProjectList.project")
	public String enterProjectList(HttpServletRequest request, Model model) throws Exception{
		String cpage = request.getParameter("cpage");
		
		//게시판형식으로 바꾸기
		//List<ProjectDTO> listProject = pservice.getList();
		List<ProjectDTO> listProject = pservice.listByCpage(Integer.parseInt(cpage));
		String navi = pservice.getListNavi(Integer.parseInt(cpage));
		
		//날짜 형식 바꾸기
		pservice.addDateStr(listProject);
		
		model.addAttribute("listProject", listProject);
		model.addAttribute("navi",navi);
		return "project/projectListView";
	}

	//프로젝트 추가하기
	@RequestMapping("addProject.project")
	public String addProject(Model model) throws Exception{
		return "project/addProjectView";
	}

	//프로젝트 추가 과정 수행
	@RequestMapping("addProjectProc.project")
	public String addProjectProc(ProjectDTO dto, Model model) throws Exception{
		dto.setPro_end_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getPro_end_date_str()));
		dto.setPro_start_date(new SimpleDateFormat("yyyy-MM-dd").parse(dto.getPro_start_date_str()));
		//sequence 선점하기
		int pro_seq = pservice.getSeqNum();
		dto.setPro_seq(pro_seq);
		//st.project insert 메서드
		int result = pservice.addProjectProc(dto);

		if(result >0) {
			int result2 = pservice.addProjectKanban(dto);
			return"project/addProjectSuccessView";
		}else return "error";
	}

	//프로젝트상세페이지
	@RequestMapping("projectDetail.project")
	public String projectDetail(HttpServletRequest request,ProjectDTO dto, Model model) throws Exception{
		int pro_seq = Integer.parseInt(request.getParameter("pro_seq"));

		//프로젝트 관련 정보 select
		ProjectDTO pdto = pservice.getProInfo(pro_seq);
		List<Project_kanbanDTO> pkdtoList = pservice.getProKanInfo(pro_seq);
		pservice.addDateStr(pdto);
		
		//시간경과율 구하기
		Date date = new Date();
		long proTerm = pservice.datediff(pdto.getPro_end_date(),pdto.getPro_start_date());
		long proToday= pservice.datediff(date,pdto.getPro_start_date());
		double timeRate = Math.round(((double)proToday/(double)proTerm)*100);
		if(proToday<0) {timeRate=0;}
		else if(proToday>=proTerm) {timeRate=100;}

		//칸반 진행률 구하기
		//pkdtoList크기구하기
		int pkdtoListSize = pkdtoList.size();
		//pkdtoList 진행중, 완료, 중지 칸반갯수 구하기
		List<Integer> list = new ArrayList<>();
		list.add(pservice.getpkdtoListCode(pkdtoList, 0)); //진행상태없음
		list.add(pservice.getpkdtoListCode(pkdtoList, 1)); //시작전
		list.add(pservice.getpkdtoListCode(pkdtoList, 2)); //진행중
		list.add(pservice.getpkdtoListCode(pkdtoList, 3)); //완료
		list.add(pservice.getpkdtoListCode(pkdtoList, 4)); //중지
		double projectRate = Math.round((double)((list.get(2)*0.5)+list.get(3))/(double)(pkdtoListSize-list.get(4))*100);

		model.addAttribute("pdto", pdto);
		model.addAttribute("pkdtoList", pkdtoList);
		model.addAttribute("proTerm", proTerm);
		model.addAttribute("proToday", proToday);
		model.addAttribute("timeRate", timeRate);
		model.addAttribute("list",list);
		model.addAttribute("projectRate", projectRate);
		
		//프로젝트 관련 정보 select
		List<MemberDTO> mdtoList = mservice.listMem();
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("pkdtoList", pkdtoList);
		model.addAttribute("mdtoList", mdtoList);
		
		return "project/projectDetailView";
	}

	//프로젝트 삭제
	@RequestMapping("deleteProject.project")
	public String deleteProject(HttpServletRequest request)throws Exception{
		int pro_seq = Integer.parseInt(request.getParameter("pro_seq"));
		int result = pservice.deleteProject(pro_seq);
		if(result>0) {
		return "project/delProjectSuccessView";}
		else return "error";
	}
	
	//pm검색하는 팝업창 띄우기
	@RequestMapping("enterPopup.project")
	public String enterPopup(Model model) throws Exception{
		List<MemberDTO> mlist = mservice.listMem();//멤버를 불러옴
		List<DepartmentDTO> dlist = mservice.listDept(); //부서명 가져옴
		 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         int a =0;
         for(DepartmentDTO dtod : dlist) {
        	 if(dtod.getDept_code_parent() == -1) {
        		 dtod.setDept_code_parent(100000000);
        	 }
            Map<String,Object> map = new HashMap<>();
            map.put("departmentName",dtod.getDept_name());
            map.put("name","");
            map.put("position","");
            map.put("memId","");
            map.put("reportsTo", dtod.getDept_code_parent());
            map.put("departmentID", dtod.getDept_code());
            list.add(map);
         }
         
         for(MemberDTO dtom : mlist) {
            Map<String,Object> map = new HashMap<>();
            map.put("departmentName","");
            map.put("name",dtom.getName());
            map.put("position",dtom.getPosition_name());
            map.put("reportsTo",dtom.getDept_code());
            map.put("departmentID", 100+a);
            map.put("memId",dtom.getId());
            list.add(map);
            a++;
         }
         model.addAttribute("list", list);
         
         return "project/projectPopupView";
	}
	
	//프로젝트 검색
	@RequestMapping("projectSearch.project")
	public String projectSearch(HttpServletRequest request, Model model) throws Exception{
		String cpage = request.getParameter("cpage");
		String choice = request.getParameter("choice");
		String search = request.getParameter("search");
		
		List<ProjectDTO> list = pservice.projectSearch(Integer.parseInt(cpage),search,choice);
		String navi = pservice.projectSearchNavi(Integer.parseInt(cpage),search,choice);
		
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", search);
		return "project/projectSearchResult";
	}
	
	//------------------------------------------------------------------------칸반 관련 메서드
	//칸반페이지 띄우기
	@RequestMapping("gokanban.project")
	public String gokanban(HttpServletRequest request, Model model) throws Exception{
		int pro_seq = Integer.parseInt(request.getParameter("pro_seq"));

		//프로젝트 관련 정보 select
		ProjectDTO pdto = pservice.getProInfo(pro_seq);
		List<Project_kanbanDTO> pkdtoList = pservice.getProKanInfo(pro_seq);
		List<MemberDTO> mdtoList = mservice.listMem();
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("pkdtoList", pkdtoList);
		model.addAttribute("mdtoList", mdtoList);
		
		return "project/kanbanView";
	}
	
	//칸반 눌렀을때 
	@RequestMapping("fixkanbanPop.project")
	public String fixkanbanPop(HttpServletRequest request, Model model, Project_kanbanDTO dto) throws Exception{
		int pro_kb_seq = Integer.parseInt(request.getParameter("itemId"));
		dto = pservice.getKanbanInfo(pro_kb_seq);
		model.addAttribute("dto",dto);
		return "project/projectKanbanPopupView";
	}
	
	//칸반 옮겼을때
	@RequestMapping("kanbanMoved.project")
	public String kanbanMoved(HttpServletRequest request, Project_kanbanDTO dto) throws Exception{
		String referer = request.getHeader("REFERER");
		dto.setPro_kb_seq(Integer.parseInt(request.getParameter("itemId")));
		dto.setPro_kb_process_code(Integer.parseInt(request.getParameter("newDatafield")));
		
		int result = pservice.kanbanMoved(dto);
		if( result >0) {
		return "redirect:" + referer;}else return "error";
	}
	
	//칸반 내용 수정
	@RequestMapping("fixKanbanInfo.project")
	public String fixKanbanInfo(HttpServletRequest request, Project_kanbanDTO dto) throws Exception{
		int result = pservice.fixKanbanInfo(dto);
		if( result >0) {
			return "project/fixKanbanSuccessView";}else return "error";
	}
	
	//칸반 삭제
	@RequestMapping("deleteKanban.project")
	public String deleteKanban(HttpServletRequest request) throws Exception{
		int pro_kb_seq = Integer.parseInt(request.getParameter("pro_kb_seq"));
		int result = pservice.deleteKanban(pro_kb_seq);
		if( result >0) {
			return "project/fixKanbanSuccessView";}else return "error";
	}
	
	//칸반 삭제(버튼 눌렀을 때)
	@RequestMapping("deleteKanbanTemplate.project")
	public String deleteKanbanTemplate(HttpServletRequest request) throws Exception{
		String referer = request.getHeader("REFERER");
		int pro_kb_seq = Integer.parseInt(request.getParameter("pro_kb_seq"));
		int result = pservice.deleteKanban(pro_kb_seq);
		if( result >0) {
			return "redirect:" + referer;}else return "error";
	}
	
	//칸반 추가
	@RequestMapping("addKanban.project")
	public String addKanban(HttpServletRequest request, Project_kanbanDTO dto) throws Exception{
		String referer = request.getHeader("REFERER");
		dto.setPro_kb_process_code(Integer.parseInt(request.getParameter("code")));
		dto.setPro_seq(Integer.parseInt(request.getParameter("pro_seq")));
		dto.setPro_kb_manager((String) session.getAttribute("id"));
		int result = pservice.addKanban(dto);
		if( result >0) {
			return "redirect:" + referer;}else return "error";
	}
	
	//칸반 초기화
	@RequestMapping("destroyKanban.project")
	public String destroyKanban(HttpServletRequest request, ProjectDTO dto) throws Exception{
		String referer = request.getHeader("REFERER");
		int result = pservice.destroyKanban(dto);
		if( result >0) {
			int result2 = pservice.addProjectKanban(dto);
			return "redirect:" + referer;}else return "error";
	}
	//------------------------------------------------------------------------칸반 관련 메서드 끝
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
