package kh.gw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.dto.MessageDTO;
import kh.gw.dto.Message_attached_filesDTO;
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
	
	@RequestMapping("writeMsg.message")
	public String writeMsg(Model m) throws Exception{
		String my = (String)session.getAttribute("id");
		Map<String,Object> myInfo = memservice.getMyInfo(my);//현재 로그인 한 사람 정보 불러오기
		m.addAttribute("myInfo", myInfo);
		return "/message/sendMessage";
	}
	
	//쪽지 보내기에서popup 조직도 불러오기
	@RequestMapping("msgPopup.message")
	public String msgPopup(Model m) throws Exception{
		List<MemberDTO> mlist = memservice.listMem();//멤버를 불러옴
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         int a =0;
         for(DepartmentDTO dto : dlist) {
        	 if(dto.getDept_code_parent() == -1) {
        		 dto.setDept_code_parent(100000000);
        	 }
            Map<String,Object> map = new HashMap<>();
            map.put("departmentName",dto.getDept_name());
            map.put("name","");
            map.put("position","");
            map.put("memId","");
            map.put("reportsTo", dto.getDept_code_parent());
            map.put("departmentID", dto.getDept_code());
            list.add(map);
         }
         
         for(MemberDTO dto : mlist) {
            Map<String,Object> map = new HashMap<>();
            map.put("departmentName","");
            map.put("name",dto.getName());
            map.put("position",dto.getPosition_name());
            map.put("reportsTo",dto.getDept_code());
            map.put("departmentID", 100+a);
            map.put("memId",dto.getId());
            list.add(map);
            a++;
         }
         m.addAttribute("list", list);
         m.addAttribute("rowKey",107);
		return "/message/msgPopupView";
	}
	
	//조직도 직원 클릭시 해당 정보 쪽지에 넣기
	@RequestMapping("msgMemInfo.message")
	public String msgMemInfo(HttpServletRequest request, Model m) throws Exception{
		String id = request.getParameter("id");
		String rowKey = request.getParameter("rowKey");
		MemberDTO dto = memservice.getMemInfo(id);
		List<MemberDTO> mlist = memservice.listMem();
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		
         List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         int a =0;
         for(DepartmentDTO dtod : dlist) {
        	 if(dtod.getDept_code_parent() == -1) {
        		 dtod.setDept_code_parent(100000000);
        	 }
            Map<String,Object> map = new HashMap<>();
            map.put("departmentName",dtod.getDept_name());
            map.put("name","");
            map.put("position","");
            map.put("memId","");
            map.put("reportsTo", dtod.getDept_code_parent());
            map.put("departmentID", dtod.getDept_code());
            list.add(map);
         }
         
         for(MemberDTO dtom : mlist) {
            Map<String,Object> map = new HashMap<>();
            map.put("departmentName","");
            map.put("name",dtom.getName());
            map.put("position",dtom.getPosition_name());
            map.put("reportsTo",dtom.getDept_code());
            map.put("departmentID", 100+a);
            map.put("memId",dtom.getId());
            list.add(map);
            a++;
         }
		
		m.addAttribute("dto", dto);
         m.addAttribute("list", list);
         m.addAttribute("rowKey",Integer.parseInt(rowKey));
		return "/message/msgPopupView";
	}
	
	//보낸 메세지 DB에 저장
	@RequestMapping("msgProc.message")
	public String msgProc(MessageDTO mdto, Model m) throws Exception{
		mdto.setMsg_sender((String)session.getAttribute("id"));
		System.out.println("============"+mdto.getAttfiles());
		int result = mservice.msgProc(mdto);
		System.out.println("======결과값===="+result);
		
		m.addAttribute("result", result);
		return "redirect:/message/msgOutBoxList.message?cpage=1";
		
	}
	
	//첨부파일 다운로드
	@RequestMapping("attFilesDown.message")
	public void attFilesDown(Message_attached_filesDTO adto, HttpServletResponse resp) throws Exception{
		
		System.out.println("요청 파일 seq : " + adto.getMsg_seq());
		System.out.println("요청 파일 SavedName : " + adto.getMsg_saved_name());
		System.out.println("=========="+adto.getMsg_ori_name());
		
		String filePath = session.getServletContext().getRealPath("/resources/Message_attached_files");
		File targetFile = new File(filePath+"/"+adto.getMsg_saved_name());
		if(targetFile.exists() && targetFile.isFile()) {
			//파일이 존재하고 진짜 파일이 맞다면
			resp.setContentType("application/octet-stream; charset=utf8");
			resp.setContentLength((int)targetFile.length());//파일 크기
			resp.setHeader("Content-Disposition", "attachment;filename=\""+adto.getMsg_ori_name()+"\";");
			//파일 다운시 필요 정보
			
			FileInputStream fis = new FileInputStream(targetFile);
			//파일 통로(ram으로 보냄)
			ServletOutputStream sos = resp.getOutputStream();
			FileCopyUtils.copy(fis, sos);
			fis.close();
			
			sos.flush();
			sos.close();
		}
	}
	
	//수신함 리스트 이동
	@RequestMapping("msgInBoxList.message")
	public String msgInBoxList(Model m, HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<MessageDTO> mlist = mservice.msgInBoxCpage(id,cpage);
		String navi = mservice.inBoxGetNavi(cpage,id);
		m.addAttribute("mlist", mlist);
		m.addAttribute("navi", navi);
		return "/message/inBox";
	}
	
	//쪽지 상세페이지 보기(수신함)
	@RequestMapping("msgReceiveView.message")
	public String msgReceiveView(HttpServletRequest request, Model m) throws Exception{
		int msg_seq= Integer.parseInt(request.getParameter("msg_seq"));
		String msg_receive_date_str = request.getParameter("msg_receive_date_str");
		System.out.println("=====확인==="+msg_receive_date_str);
		int readDate = mservice.readDate(msg_seq,msg_receive_date_str);
		System.out.println(readDate);
		List<Message_attached_filesDTO> attlist = mservice.attFilesAll(msg_seq);
		MessageDTO mdto = mservice.msgView(msg_seq);
		m.addAttribute("mdto", mdto);
		m.addAttribute("attlist", attlist);
		return "/message/msgReceiveView"; 
	}
	
	//쪽지 삭제 (수신)
	@RequestMapping("msgDelete.message")
	public String msgDelete(HttpServletRequest request, Model m) throws Exception{
		int msg_seq= Integer.parseInt(request.getParameter("msg_seq"));
		int inDel = mservice.msgDelete(msg_seq);
		return "redirect:/message/msgInBoxList.message?cpage=1";
	}
	
	//쪽지 삭제(발신)
	@RequestMapping("msgOutBoxDel.message")
	public String msgOutBoxDel(HttpServletRequest request, Model m) throws Exception{
		int msg_seq= Integer.parseInt(request.getParameter("msg_seq"));
		int outDel = mservice.msgOutBoxDel(msg_seq);
		return "redirect:/message/msgOutBoxList.message?cpage=1";
	}
	
	//쪽지 상세페이지에서 답장하기 버튼
	@RequestMapping("msgReply.message")
	public String msgReply(HttpServletRequest request, Model m) throws Exception{
		String msg_sender_name = request.getParameter("msg_sender_name");
		String msg_receiver_name = request.getParameter("msg_receiver_name");
		String msg_receiver = request.getParameter("msg_receiver");
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));
		MessageDTO mdto = mservice.msgView(msg_seq);
		List<MemberDTO> mlist = memservice.listMem(); //조직도 전체 리스트 가져옴
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		m.addAttribute("msg_sender_name", msg_sender_name);
		m.addAttribute("msg_receiver_name", msg_receiver_name);
		m.addAttribute("msg_receiver", msg_receiver);
		m.addAttribute("dlist", dlist);
		m.addAttribute("mlist", mlist);
		m.addAttribute("mdto", mdto);
		return "/message/replyMessage";
	}
	
	//조직도에서 쪽지보내기 버튼 클릭시
	@RequestMapping("orgSendMessage.message")
	public String orgSendMessage(HttpServletRequest request, Model m) throws Exception{
		String my = (String)session.getAttribute("id");
		String msg_receiver_name = request.getParameter("msg_receiver_name");
		String msg_receiver = request.getParameter("msg_receiver");
		Map<String,Object> myInfo = memservice.getMyInfo(my);
		List<MemberDTO> mlist = memservice.listMem(); //조직도 전체 리스트 가져옴
		List<DepartmentDTO> dlist = memservice.listDept(); //부서명 가져옴
		m.addAttribute("msg_receiver_name", msg_receiver_name);
		m.addAttribute("msg_receiver", msg_receiver);
		m.addAttribute("mlist", mlist);
		m.addAttribute("dlist", dlist);
		m.addAttribute("myInfo", myInfo);
		return "/message/orgSendMessage";
	}
	
	//쪽지 발신함 list 불러오기
	@RequestMapping("msgOutBoxList.message")
	public String msgOutBoxList(HttpServletRequest request, Model m) throws Exception{
		String id = (String)session.getAttribute("id");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<MessageDTO> mlist = mservice.msgOutBoxCpage(id,cpage);
		String navi = mservice.outBoxGetNavi(cpage,id);
		m.addAttribute("mlist", mlist);
		m.addAttribute("navi", navi);
		return "/message/outBox";
	}
	
	//발신함 상세페이지 보기
	@RequestMapping("msgSenderView.message")
	public String msgSenderView(HttpServletRequest request, Model m) throws Exception{
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));
		MessageDTO mdto = mservice.msgView(msg_seq);
		List<Message_attached_filesDTO> attlist = mservice.attFilesAll(msg_seq);
		m.addAttribute("mdto", mdto);
		m.addAttribute("attlist", attlist);
		return "/message/msgSenderView";	
	}
	
	
	//list chk박스로 삭제(수신)
	@ResponseBody
	@RequestMapping(value="delMsgInList.message", method=RequestMethod.POST)
	public String delMsgInList(@RequestParam(value="chk[]") List<String> chkArr) throws Exception{
		String id = (String)session.getAttribute("id");
		String result = "0";
		int msg_seq = 0;
		if(id != null) {
			for(String i : chkArr) {
				msg_seq = Integer.parseInt(i);
				mservice.msgDelete(msg_seq);
			}
			
			result = "{\"result\":1}";
		}
		System.out.println("resultjava : "+result);
		return result;
	}
	
	//list chk박스로 삭제(발신)
	@ResponseBody
	@RequestMapping(value="delMsgOutList.message", method=RequestMethod.POST)
	public String delMsgOutList(@RequestParam(value="chk[]") List<String> chkArr) throws Exception{
		String id = (String)session.getAttribute("id");
		String result = "0";
		int msg_seq = 0;
		if(id != null) {
			for(String i : chkArr) {
				msg_seq = Integer.parseInt(i);
				mservice.msgOutBoxDel(msg_seq);
			}
			
			result = "{\"result\":1}";
			}
			System.out.println("resultjava : "+result);
			return result;
		}
		
	//list chk박스로 보관함(수신)
	@ResponseBody
	@RequestMapping(value="msgInCabinsert.message", method=RequestMethod.POST)
	public String msgInCabinsert(@RequestParam(value="chk[]") List<String> chkArr) throws Exception{
		String id = (String)session.getAttribute("id");
		String result = "0";
		int msg_seq = 0;
		if(id != null) {
			for(String i : chkArr) {
				msg_seq = Integer.parseInt(i);
				mservice.msgInCabinsert(id,msg_seq);
				mservice.msgCabCheck(msg_seq);
			}
			result = "{\"result\":1}";
		}
		return result;
	}
	
	//list chk박스로 보관함(발신)
		@ResponseBody
		@RequestMapping(value="msgOutCabinsert.message", method=RequestMethod.POST)
		public String msgOutCabinsert(@RequestParam(value="chk[]") List<String> chkArr) throws Exception{
			String id = (String)session.getAttribute("id");
			String result = "0";
			int msg_seq = 0;
			if(id != null) {
				for(String i : chkArr) {
					msg_seq = Integer.parseInt(i);
					mservice.msgOutCabinsert(id,msg_seq);
					mservice.msgCabCheck(msg_seq);
				}
				result = "{\"result\":1}";
			}
			return result;
		}
	
	//보관함 list 불러오기
	@RequestMapping("msgCabList.message")
	public String msgCabInList(HttpServletRequest request, Model m) throws Exception{
		String id = (String)session.getAttribute("id");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<Map<String,Object>> inList = mservice.msgCabInCpage(id,cpage);
		List<MessageDTO> outList = mservice.msgCabOutCpage(id,cpage);
		String inNavi = mservice.msgCabInNavi(cpage,id);
		String outNavi = mservice.msgCabOutNavi(cpage,id);
		m.addAttribute("inList", inList);
		m.addAttribute("outList", outList);
		m.addAttribute("inNavi", inNavi);
		m.addAttribute("outNavi", outNavi);
		return "message/storageBox";
	}
	
	//보관함 삭제
	@ResponseBody
	@RequestMapping(value="delMsgCabList.message", method=RequestMethod.POST)
	public String delMsgCabList(@RequestParam(value="chk[]") List<String> chkArr) throws Exception{
		String id = (String)session.getAttribute("id");
		String result = "0";
		int msg_seq = 0;
		if(id != null) {
			for(String i : chkArr) {
				msg_seq = Integer.parseInt(i);
				mservice.delMsgCabList(id,msg_seq);
			}
			result = "{\"result\":1}";
		}
		return result;
	}
	
	//보관함 상세페이지 보기
	@RequestMapping("msgCabView.message")
	public String msgCabView(HttpServletRequest request, Model m) throws Exception{
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));
		String msg_receive_date_str = request.getParameter("msg_receive_date_str");
		int readDate = mservice.readDate(msg_seq,msg_receive_date_str);
		MessageDTO mdto = mservice.msgView(msg_seq);
		List<Message_attached_filesDTO> attlist = mservice.attFilesAll(msg_seq);
		m.addAttribute("mdto", mdto);
		m.addAttribute("attlist", attlist);
		return "/message/msgCabView";	
	}
	
	//보관함 상세페이지 삭제 버튼
	@RequestMapping("delMsgCab.message")
	public String delMsgCab(HttpServletRequest request,Model m) throws Exception{
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));
		String id = (String)session.getAttribute("id");
		int del = mservice.delMsgCabList(id,msg_seq);
		return "redirect:/message/msgCabList.message?cpage=1";
	}
	
	
	//내게쓴쪽지함 list불러오기
	@RequestMapping("msgMyBoxList.message")
	public String msgMyBoxList(HttpServletRequest request, Model m) throws Exception{
		String id = (String)session.getAttribute("id");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<MessageDTO> mlist = mservice.msgMyBoxCpage(id,cpage);
		String navi = mservice.msgMyBoxGetNavi(cpage,id);
		m.addAttribute("mlist", mlist);
		m.addAttribute("navi", navi);
		return "/message/myBox";
		
	}
	
	//내게쓴쪽지 상세페이지 보기
	@RequestMapping("msgMyView.message")
	public String msgMyView(HttpServletRequest request, Model m) throws Exception{
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));
		String msg_receive_date_str = request.getParameter("msg_receive_date_str");
		int readDate = mservice.readDate(msg_seq,msg_receive_date_str);		
		MessageDTO mdto = mservice.msgView(msg_seq);
		List<Message_attached_filesDTO> attlist = mservice.attFilesAll(msg_seq);
		m.addAttribute("mdto", mdto);
		m.addAttribute("attlist", attlist);
		return "/message/msgMyView";	
	}
	
	//내게쓴쪽지함 상세페이지 삭제 버튼
	@RequestMapping("delMyMsg.message")
	public String delMyMsg(HttpServletRequest request,Model m) throws Exception{
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));
		int del = mservice.delMyMsg(msg_seq);
		return "redirect:/message/msgMyBoxList.message?cpage=1";
	}
	
	//내게쓴쪽지함 chk박스로 삭제
	@ResponseBody
	@RequestMapping(value="delMsgMyList.message", method=RequestMethod.POST)
	public String delMsgMyList(@RequestParam(value="chk[]") List<String> chkArr) throws Exception{
		String id = (String)session.getAttribute("id");
		String result = "0";
		int msg_seq = 0;
		if(id != null) {
			for(String i : chkArr) {
				msg_seq = Integer.parseInt(i);
				mservice.delMyMsg(msg_seq);
			}
			
			result = "{\"result\":1}";
			}
			System.out.println("resultjava : "+result);
			return result;
		}
	
//	//
//	@ResponseBody
//	@RequestMapping(value="msgCount.message", method=RequestMethod.POST)
//	public String msgCount(HttpServletRequest request) throws Exception{
//		String id = (String)session.getAttribute("id");
//		String result = mservice.msgCount(id);
//		return result;
//	}
	
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
