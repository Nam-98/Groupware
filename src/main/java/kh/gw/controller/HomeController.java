package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kh.gw.service.ApprovalService;
import kh.gw.service.TnAService;
import kh.gw.statics.CommonConfigurator;

@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
//	@Autowired
//	private TnAService tservice;

	@RequestMapping("/")
	public String home(Model model) {
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			//model.addAttribute("isWork", tservice.isGoLeave(id));	
			return "/main/mainpage";
		} else
			return "home";
	}
	
}
