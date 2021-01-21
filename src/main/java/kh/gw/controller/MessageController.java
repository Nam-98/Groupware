package kh.gw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.service.MemberService;
import kh.gw.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService mservice;
	
	@Autowired
	private MemberService memservice;
	
	//쪽지 보내기에서 조직도 불러오기
	@RequestMapping("writeMsg.message")
	public String writeMsg(Model m) throws Exception{
		List<MemberDTO> mlist = memservice.listMem();//멤버를 불러옴
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		m.addAttribute("mlist", mlist);
		m.addAttribute("dlist", dlist);
		return "/message/sendMessage";
	}
	
	//조직도 직원 클릭시 해당 정보 쪽지에 넣기
	@RequestMapping("msgMemInfo.message")
	public String msgMemInfo(HttpServletRequest request, Model m) throws Exception{
		String id = request.getParameter("id");
		MemberDTO dto = memservice.getMemInfo(id);
		List<MemberDTO> mlist = memservice.listMem();
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		m.addAttribute("dto", dto);
		m.addAttribute("mlist", mlist);
		m.addAttribute("dlist", dlist);
		return "/message/sendMessage";
	}
	
}
