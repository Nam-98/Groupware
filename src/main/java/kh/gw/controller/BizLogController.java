package kh.gw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.BizLogDTO;
import kh.gw.dto.BizLog_signDTO;
import kh.gw.dto.Break_typeDTO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.service.BizLogService;
import kh.gw.service.MemberService;

@Controller
@RequestMapping("/bizlog")
public class BizLogController {
	@Autowired
	private BizLogService bservice;
	
	@RequestMapping("/toMainPage.bizlog")
	public String toMainPage() {
		return "/bizlog/bizMainPage";
	}
	
	@RequestMapping("/toWriteView.bizlog")
	public String toWriteView(Model model) throws Exception {
		
		//결재선 선택용 member list 보내기
		List<MemberDTO> mlist = bservice.getMyDeptMem();//멤버를 불러옴
		model.addAttribute("mlist", mlist);
		model.addAttribute("docsType", bservice.getDocsType());
		return "/bizlog/bizlogWriteView";
	}
	
	@RequestMapping("/writeBizlog.bizlog")
	public String writeBizlog(BizLogDTO dto, BizLog_signDTO sign) throws Exception {
		int writeResult = bservice.writeBizlog(dto);
		if(writeResult==-1) {return "error";}
		int signResult = bservice.setInitAppSign(sign.getBiz_signDTOList());
		if(signResult==-1) {return "error";}
		return "redirect:/bizlog/toMainPage.bizlog";
	}
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
