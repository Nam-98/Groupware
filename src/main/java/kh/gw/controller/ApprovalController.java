package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.gw.dto.ApprovalDTO;
import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.Break_typeDTO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.service.ApprovalService;
import kh.gw.service.BreakService;
import kh.gw.service.MemberService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private ApprovalService aservice;
	@Autowired
	private MemberService mservice;
	@Autowired
	private BreakService bservice;
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
		//결재선 선택용 자료 보내기
		List<MemberDTO> mlist = mservice.listMem();//멤버를 불러옴
		List<DepartmentDTO> dlist = mservice.listDept(); //부서명 가져옴
		List<Approval_sign_typeDTO> adtList = aservice.allSignType();
		List<Break_typeDTO> btList = bservice.getAllType();
		model.addAttribute("mlist", mlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("adtList", adtList);
		model.addAttribute("breakType", btList);
		return "approval/appWriteView";
	}
	
	@RequestMapping(value="/writeApproval.approval", produces = "application/json; charset=urf8")
	public void writeApproval (ApprovalDTO dto, List<String signList) {
		Gson gson = new Gson();
		JsonObject list = gson.fromJson(sign_id_Json, JsonObject.class);
		
		System.out.println(list);
		System.out.println(dto.getApp_title());
		System.out.println(dto.getApp_archive());
	}
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
