package kh.gw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dao.ApprovalDAO;
import kh.gw.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private ApprovalService aservice;
}
