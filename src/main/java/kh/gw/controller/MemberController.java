package kh.gw.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

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
			session.setAttribute("name", dtos.getName());
			session.setAttribute("position", dtos.getPosition_name());
			System.out.println("로그인 성공");
			System.out.println("id : " + dtos.getId());
			System.out.println("accessLevel : " + dtos.getAccess_level_code());
			return "redirect:/";
//			return "/main/mainpage";
		}else {
			System.out.println("로그인 실패");
			//return "redirect:/";
			return "main/loginFailView";
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
			return "mypage/myInfo";
		}
		
	//조직도 불러오기
		//조직도 불러오기
	      @RequestMapping("orgnizationChart.member")
	      public String orgnizationChart(Model m) throws Exception{
	         List<MemberDTO> mlist = mservice.listMem();//멤버를 불러옴
	         List<DepartmentDTO> dlist = mservice.listDept(); //부서명 가져옴
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
	         return "orgnization/orgnizationChart";
	      }
	
	//조직도 직원 클릭시 정보 불러오기
		@RequestMapping("orgMemInfo.member")
		public String orgMemInfo(HttpServletRequest request, Model m) throws Exception{
			String id = request.getParameter("id");
			String rowKey = request.getParameter("rowKey");
			MemberDTO dto = mservice.getMemInfo(id);
			List<MemberDTO> mlist = mservice.listMem();
			List<DepartmentDTO> dlist = mservice.listDept(); //부서명 가져옴
			
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
	         m.addAttribute("list", list);
	         m.addAttribute("rowKey",Integer.parseInt(rowKey));
			m.addAttribute("dto", dto);
			return "orgnization/orgnizationChart";
		}
		
		//프로젝트에서 조직도 직원 클릭시 정보 불러오기
		@RequestMapping("orgProMemInfo.member")
		public String orgProMemInfo(HttpServletRequest request, Model m) throws Exception{
			String id = request.getParameter("id");
			String rowKey = request.getParameter("rowKey");
			MemberDTO dto = mservice.getMemInfo(id);
			List<MemberDTO> mlist = mservice.listMem();
			List<DepartmentDTO> dlist = mservice.listDept(); //부서명 가져옴
			
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
			return "project/projectPopupView";
		}
		
	//비밀번호 변경 페이지 가기
	@RequestMapping("pwFix.member")
	public String pwFix(HttpServletRequest request, Model m) throws Exception{
		String id = (String)session.getAttribute("id");
		MemberDTO dtos = mservice.getMemInfo(id);
		m.addAttribute("dtos", dtos);
		return "mypage/pwFixView";
	}
	
	@RequestMapping("fixMyPw.member")
	public String fixMyPw(HttpServletRequest request, Model m) throws Exception{
		String id = (String)session.getAttribute("id");
		String newpw = request.getParameter("newpw");
		MemberDTO dto = mservice.getMemInfo(id);
		mservice.updatePw(id,newpw);
		m.addAttribute("dto",dto);
		return "mypage/pwFixSuccessView";
	}
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
