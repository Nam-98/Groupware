package kh.gw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tna")
public class TnAController {
	
	
	@RequestMapping("/tnaNexacro.tna")
	public String tnaNexacro() {
		return "redirect:/nex/index.html";
	}

}
