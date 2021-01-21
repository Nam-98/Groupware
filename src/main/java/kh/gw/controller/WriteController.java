package kh.gw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.WriteDTO;
import kh.gw.service.WriteService;

@Controller
@RequestMapping("/write")
public class WriteController {
	
	@Autowired
	private WriteService wservice;
	
	@Autowired
	private HttpSession session;
	
	//-------------커뮤니티 들어오기
	@RequestMapping("enterCommunity.write")
	public String enterCommunity() throws Exception{
		return "/write/community";
	}
	
	//-------------공지사항 목록 보여주기
	@RequestMapping("noticeList.write")
	public String noticeList(Model m, HttpServletRequest request) throws Exception{
		String cpage = request.getParameter("cpage");
		List<WriteDTO>list = wservice.noticeByCpage(Integer.parseInt(cpage),"01");
		String navi = wservice.noticeGetNavi(Integer.parseInt(cpage),"01");
		
		m.addAttribute("list", list);
		m.addAttribute("navi", navi);
		
		return "/write/noticelist";
	}
	
	//--------------제목 눌렀을때 공지사항 상세로 가기
	@RequestMapping("noticeView.write")
	public String noticeView(Model m, HttpServletRequest request, WriteDTO dto) throws Exception{
		dto.setWrite_seq(Integer.parseInt(request.getParameter("write_seq")));
		WriteDTO dtos = wservice.noticeView(dto.getWrite_seq());
		
		int result = wservice.addViewCount(dto.getWrite_seq()); // 조회수+1
		
		m.addAttribute("dtos", dtos);
		return "/write/noticeview";
	}
	
	//-------------- 공지사항 검색하기
	@RequestMapping("noticeSearch.write")
	public String noticeSearch(Model m, HttpServletRequest request, WriteDTO dto) throws Exception{
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<WriteDTO>list = wservice.noticeSearch(cpage,condition,"01",keyword);
		String navi = wservice.noticeSearchNavi(cpage,condition,"01",keyword);
		m.addAttribute("list",list);
		m.addAttribute("navi", navi);
		m.addAttribute("keyword",keyword);
		
		return "/write/noticesearchlist";
	}
}
