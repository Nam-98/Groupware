package kh.gw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	//-------------공지사항 목록 보여주기
	@RequestMapping("noticeList.write")
	public String noticeView(Model m, HttpServletRequest request) throws Exception{
		String cpage = request.getParameter("cpage");
		List<WriteDTO>list = wservice.noticeByCpage(Integer.parseInt(cpage),"01");
		String navi = wservice.noticeGetNavi(Integer.parseInt(cpage),"01");
		
		m.addAttribute("list",list);
		m.addAttribute("navi",navi);
		
		return "/write/noticelist";
	}
}
