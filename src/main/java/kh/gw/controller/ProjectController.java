package kh.gw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.service.MemberService;
import kh.gw.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	private ProjectService pservice;
}
