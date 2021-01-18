package kh.gw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.service.BreakService;

@Controller
@RequestMapping("/break")
public class BreakController {
	@Autowired
	private BreakService bservice;
}
