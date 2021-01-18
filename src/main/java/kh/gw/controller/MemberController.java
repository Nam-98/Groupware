package kh.gw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.gw.dto.MemberDTO;
import kh.gw.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("login.member")
	public String login(MemberDTO dto, Model model) throws Exception{
		//아이디가 존재하면 1, 존재하지 않으면 0
		int result = mservice.loginCheck(dto);
		
		if(result==1) {
			MemberDTO dtos = mservice.getMemInfo(dto.getId());
			session.setAttribute("id",dto.getId());
			session.setAttribute("accessLevel",dtos.getAccess_level_code());
			System.out.println("로그인 성공");
			System.out.println("id : " + dtos.getId());
			System.out.println("accessLevel : " + dtos.getAccess_level_code());
			return "/main/mainpage";
		}else {
			System.out.println("로그인 실패");
			//return "redirect:/";
			return "/main/loginFailView";
		}
	}
}
