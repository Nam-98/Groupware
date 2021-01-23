package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;
import kh.gw.dto.Project_kb_workerDTO;
import kh.gw.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService pservice;
	
	//프로젝트 리스트 가져오기
	@RequestMapping("enterProjectList.project")
	public String enterProjectList(Model model) throws Exception{
		List<ProjectDTO> listProject = pservice.getList();
		System.out.println(listProject.get(0).getPro_title());
		model.addAttribute("listProject", listProject);
		return "/project/projectListView";
	}
	
	//프로젝트 추가하기
	@RequestMapping("addProject.project")
	public String addProject(Model model) throws Exception{
		return "/project/addProjectView";
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
			//칸반5개 생성 메서드 ?? 담당자도 각각 지정할지 생각해보기
			int result2 = pservice.addProjectKanban(pro_seq);
			return"/project/addProjectSuccessView";
		}else return "error";
	}
	
	//프로젝트상세페이지
	@RequestMapping("projectDetail.project")
	public String projectDetail(HttpServletRequest request,ProjectDTO dto, Model model) throws Exception{
		int pro_seq = Integer.parseInt(request.getParameter("pro_seq"));
		
		//프로젝트 관련 정보 select
		ProjectDTO pdto = pservice.getProInfo(pro_seq);
		List<Project_kanbanDTO> pkdtoList = pservice.getProKanInfo(pro_seq);
		List<Project_kb_workerDTO> pkwdto = pservice.getProKWInfo(pro_seq);
		
		//프로젝트 일수 구하기
		Date date = new Date();
		long proTerm = pservice.datediff(pdto.getPro_end_date(),pdto.getPro_start_date());
		long proToday= pservice.datediff(date,pdto.getPro_start_date());
		double timeRate = ((double)proToday/(double)proTerm)*100;
		if(proToday<0) {return "error";}
		
		//칸반 진행률 구하기
		//pkdtoList크기구하기
		int pkdtoListSize = pkdtoList.size();
		System.out.println("전체 : " + pkdtoListSize);
		//pkdtoList 진행중, 완료, 중지 칸반갯수 구하기
		List<Integer> list = new ArrayList<>();
		list.add(pservice.getpkdtoListCode(pkdtoList, 0)); //진행상태없음
		list.add(pservice.getpkdtoListCode(pkdtoList, 1)); //시작전
		list.add(pservice.getpkdtoListCode(pkdtoList, 2)); //진행중
		list.add(pservice.getpkdtoListCode(pkdtoList, 3)); //완료
		list.add(pservice.getpkdtoListCode(pkdtoList, 4)); //중지
		
		double projectRate = (double)((list.get(2)*0.5)+list.get(3))/(double)(pkdtoListSize-list.get(4))*100;
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("pkdtoList", pkdtoList);
		model.addAttribute("pkwdto", pkwdto);
		model.addAttribute("proTerm", proTerm);
		model.addAttribute("proToday", proToday);
		model.addAttribute("timeRate", timeRate);
		model.addAttribute("list",list);
		model.addAttribute("projectRate", projectRate);
		
		return "/project/projectDetailView";
	}
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
