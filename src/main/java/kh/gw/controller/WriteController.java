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

	//------------- 시스템 공지사항 리스트 보여주기
	@RequestMapping("systemNoticeList.write")
	public String systemNoticeList(Model m, HttpServletRequest request) throws Exception{
		String cpage = request.getParameter("cpage");
		List<WriteDTO>list = wservice.noticeByCpage(Integer.parseInt(cpage),"02");
		String navi = wservice.systemNoticeGetNavi(Integer.parseInt(cpage),"02");

		m.addAttribute("list", list);
		m.addAttribute("navi", navi);

		return "/write/systemnotice";
	}

	//--------------시스템 공지사항 제목 눌렀을때 시스템 공지사항 상세로 가기
	@RequestMapping("systemNoticeView.write")
	public String systemNoticeView(Model m, HttpServletRequest request, WriteDTO dto) throws Exception{
		dto.setWrite_seq(Integer.parseInt(request.getParameter("write_seq")));
		WriteDTO dtos = wservice.noticeView(dto.getWrite_seq());

		int result = wservice.addViewCount(dto.getWrite_seq()); // 조회수+1

		m.addAttribute("dtos", dtos);
		return "/write/systemnoticeview";
	}
	//--------------시스템 공지사항 검색하기
	@RequestMapping("systemNoticeSearch.write")
	public String systemNoticeSearch(Model m, HttpServletRequest request, WriteDTO dto) throws Exception{
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<WriteDTO>list = wservice.noticeSearch(cpage,condition,"02",keyword);
		String navi = wservice.systemNoticeSearchNavi(cpage,condition,"02",keyword);
		m.addAttribute("list",list);
		m.addAttribute("navi", navi);
		m.addAttribute("keyword",keyword);

		return "/write/systemnoticesearchlist";
	}

	//-------------- 회사 게시판 list
	@RequestMapping("boardList.write")
	public String boardList(Model m, HttpServletRequest request) throws Exception{
		String cpage = request.getParameter("cpage");
		List<WriteDTO>list = wservice.noticeByCpage(Integer.parseInt(cpage),"03");
		String navi = wservice.noticeGetNavi(Integer.parseInt(cpage),"03");

		m.addAttribute("list", list);
		m.addAttribute("navi", navi);

		return "/write/boardlist";
	}

	//------------ 회사 게시판 제목 눌렀을 때 상세 게시판
	@RequestMapping("boardView.write")
	public String boardView(Model m, HttpServletRequest request, WriteDTO dto) throws Exception{
		dto.setWrite_seq(Integer.parseInt(request.getParameter("write_seq")));
		WriteDTO dtos = wservice.noticeView(dto.getWrite_seq());

		int result = wservice.addViewCount(dto.getWrite_seq()); // 조회수+1

		m.addAttribute("dtos", dtos);
		return "/write/boardview";
	}
	//----------- 회사 게시판 글 찾기
	@RequestMapping("boardSearch.write")
	public String boardSearch(Model m, HttpServletRequest request, WriteDTO dto) throws Exception{
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		List<WriteDTO>list = wservice.noticeSearch(cpage,condition,"03",keyword);
		String navi = wservice.boardSearchNavi(cpage,condition,"03",keyword);
		m.addAttribute("list",list);
		m.addAttribute("navi", navi);
		m.addAttribute("keyword",keyword);

		return "/write/boardsearchlist";
	}
	
	//------------ 회사 게시글 글쓰기 페이지 전환
	@RequestMapping("boardWrite.write")
	public String boardWrite() throws Exception{
		return "/write/boardwrite";
	}
	
	//----------- 회사 게시글 글쓰기
	@RequestMapping("insertBoardWrite.write")
	public String insertBoardWrite(WriteDTO dto) throws Exception{
		int result = wservice.insertBoardWrite(dto);
		return "redirect:/write/boardList.write?cpage=1";
	}	
}
