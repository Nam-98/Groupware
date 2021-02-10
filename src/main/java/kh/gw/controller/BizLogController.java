package kh.gw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.ApprovalDTO;
import kh.gw.dto.Approval_signDTO;
import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.BizLog_periodDTO;
import kh.gw.dto.BreakDTO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.service.ApprovalService;
import kh.gw.service.BizLogService;
import kh.gw.service.MemberService;

@Controller
@RequestMapping("/bizlog")
public class BizLogController {
	@Autowired
	private BizLogService bservice;
	@Autowired
	private ApprovalService aservice;
	@RequestMapping("/toMainPage.bizlog")
	public String toMainPage() {
		return "bizlog/bizMainPage";
	}
	
	@RequestMapping("/toWriteView.bizlog")
	public String toWriteView(Model model) throws Exception {
		
		//결재선 선택용 member list 보내기
		List<MemberDTO> mlist = bservice.getMyDeptMem();//멤버를 불러옴
		model.addAttribute("mlist", mlist);
		model.addAttribute("docsType", bservice.getDocsType());
		return "bizlog/bizWriteView";
	}
	
	@RequestMapping("/writeBizlog.bizlog")
	public String writeBizlog(ApprovalDTO dto, Approval_signDTO approval_signDTOList, Model model, BizLog_periodDTO period) throws Exception {
		//글작성
		int appSeq = aservice.writeApp(dto);
		if(appSeq<=0) {return "error";}

		aservice.setInitAppSign(approval_signDTOList, appSeq);
		return "redirect:/bizlog/toMainPage.bizlog";
	}
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
