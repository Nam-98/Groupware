package kh.gw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;

	@RequestMapping("/")
	public String home() {
		if (session.getAttribute("id") != null) {
			return "/main/mainpage";
		} else
			return "home";
	}
	
}
