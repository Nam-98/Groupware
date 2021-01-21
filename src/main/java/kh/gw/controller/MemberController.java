package kh.gw.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nexacro.uiadapter17.spring.core.data.NexacroResult;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private HttpSession session;
	
	//로그인 기능
	@RequestMapping("login.member")
	public String login(MemberDTO dto, Model model) throws Exception{
		//아이디가 존재하면 1, 존재하지 않으면 0
		int result = mservice.loginCheck(dto);
		
		if(result==1) {
			//id로 정보 받아오기
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
	
	//로그아웃
	@RequestMapping("logout.member")
	public String logout() throws Exception {
		session.invalidate();
		return "home";
	}
	
	//마이페이지로 가기
		@RequestMapping("enterMyPage.member")
		public String enterMyPage(Model model) throws Exception {
			MemberDTO dtos = mservice.getMemInfo((String) session.getAttribute("id"));
			model.addAttribute("dto",dtos);
			return "/mypage/myInfo";
		}
		
	//조직도 불러오기
		@RequestMapping("orgnizationChart.member")
		public String orgnizationChart(Model m) throws Exception{
			List<MemberDTO> mlist = mservice.listMem();//멤버를 불러옴
			List<DepartmentDTO> dlist = mservice.listDept(); //부서명 가져옴
			for(MemberDTO dto:mlist) {
				System.out.println(dto.getDept_code());
			}
			m.addAttribute("mlist", mlist);
			m.addAttribute("dlist", dlist);
			return "orgnizationChart";
		}
	
	//조직도 직원 클릭시 정보 불러오기
		@RequestMapping("orgMemInfo.member")
		public String orgMemInfo(HttpServletRequest request, Model m) throws Exception{
			String id = request.getParameter("id");
			MemberDTO dto = mservice.getMemInfo(id);
			List<MemberDTO> mlist = mservice.listMem();
			List<DepartmentDTO> dlist = mservice.listDept(); //부서명 가져옴
			m.addAttribute("dto", dto);
			m.addAttribute("mlist", mlist);
			m.addAttribute("dlist", dlist);
			return "orgnizationChart";
		}
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
