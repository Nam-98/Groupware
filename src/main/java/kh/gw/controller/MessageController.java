package kh.gw.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.dto.MessageDTO;
import kh.gw.service.MemberService;
import kh.gw.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService mservice;
	
	@Autowired
	private MemberService memservice;
	
	@Autowired
	private HttpSession session;
	
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
		String my = (String)session.getAttribute("id");
		Map<String,Object> myInfo = memservice.getMyInfo(my);//현재 로그인 한 사람 정보 불러오기
		MemberDTO dto = memservice.getMemInfo(id);//조직도에서 선택된 아이디 정보
		List<MemberDTO> mlist = memservice.listMem(); //조직도 전체 리스트 가져옴
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		m.addAttribute("myInfo", myInfo);
		m.addAttribute("dto", dto);
		m.addAttribute("mlist", mlist);
		m.addAttribute("dlist", dlist);
		return "/message/sendMessage";
	}
	
	//보낸 메세지 DB에 저장
	@RequestMapping("msgProc.message")
	public String msgProc(HttpServletRequest request, Model m) throws Exception{
		String msg_sender = (String)session.getAttribute("id");
		String msg_receiver = request.getParameter("receiveId");
		String msg_title = request.getParameter("title");
		String msg_contents = request.getParameter("contents");
		String msg_sender_name = request.getParameter("sender");
		String msg_receiver_name = request.getParameter("receiver");
		MessageDTO mdto = new MessageDTO(0,msg_sender,msg_receiver,null,null,msg_title,msg_contents,msg_sender_name,msg_receiver_name);
		int result = mservice.msgProc(mdto);
		m.addAttribute("result", result);
		return "/message/alertMessage";
		
	}
	
	//수신함 리스트 이동
	@RequestMapping("msgInBoxList.message")
	public String msgInBoxList(Model m, HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<MessageDTO> mlist = mservice.msgInBoxList(id);
		String navi = mservice.inBoxGetNavi(cpage,id);
		m.addAttribute("mlist", mlist);
		m.addAttribute("navi", navi);
		return "/message/inBox";
	}
	
	//쪽지 상세페이지 보기(수신함)
	@RequestMapping("msgReceiveView.message")
	public String msgReceiveView(HttpServletRequest request, Model m) throws Exception{
		int msg_seq= Integer.parseInt(request.getParameter("msg_seq"));
		int readDate = mservice.readDate(msg_seq);
		System.out.println("결과===="+readDate);
		MessageDTO mdto = mservice.msgView(msg_seq);
		m.addAttribute("mdto", mdto);
		return "/message/msgReceiveView"; 
	}
	
	//쪽지 상세보기에서 삭제 버튼 클릭 시
	@RequestMapping("msgDelete.message")
	public String msgDelete(HttpServletRequest request, Model m) throws Exception{
		int msg_seq= Integer.parseInt(request.getParameter("msg_seq"));
		int delResult = mservice.msgDelete(msg_seq);
		return "redirect:/message/msgInBoxList.message";
	}
	
	//쪽지 상세페이지에서 답장하기 버튼
	@RequestMapping("msgReply.message")
	public String msgReply(HttpServletRequest request, Model m) throws Exception{
		String msg_sender = request.getParameter("msg_sender");
		String msg_receiver = request.getParameter("msg_receiver");
		List<MemberDTO> mlist = memservice.listMem(); //조직도 전체 리스트 가져옴
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		m.addAttribute("msg_sender", msg_sender);
		m.addAttribute("msg_receiver", msg_receiver);
		m.addAttribute("mlist", mlist);
		m.addAttribute("dlist", dlist);
		return "/message/replyMessage";
	}
	
	// error
		@ExceptionHandler
		public String exceptionalHandler(Exception e) {
			e.printStackTrace();
			return "error";
		}
	
}
