package kh.gw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.service.ApprovalService;
import kh.gw.service.MemberService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private ApprovalService aservice;
	@Autowired
	private MemberService mservice;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toAppMainView.approval")
	public String toAppMainView () {
		return "approval/appMainView";
	}
	
	@RequestMapping("/toAppWriteView.approval")
	public String toAppWriteView (Model model) throws Exception {
		//전자문서 종류 가져오기
		model.addAttribute("docsType", aservice.allDocsType());
		//이름 보내기
		model.addAttribute("writer", mservice.getMemInfo((String) session.getAttribute("id")).getName());
		return "approval/appWriteView";
	}
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
