package kh.gw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.ProjectDTO;
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
}
