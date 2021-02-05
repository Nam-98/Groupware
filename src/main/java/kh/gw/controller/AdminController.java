package kh.gw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nexacro.uiadapter17.spring.core.annotation.ParamDataSet;
import com.nexacro.uiadapter17.spring.core.data.NexacroResult;

import kh.gw.dto.MemberDTO;
import kh.gw.service.DepartmentService;
import kh.gw.service.MemberService;
import kh.gw.service.PositionService;

@Controller
@RequestMapping("/nex")
public class AdminController {
	@Autowired
	private MemberService mser;

	@Autowired
	private PositionService pser;
	
	@Autowired
	private DepartmentService dser;
	
	//페이지 이동
	@RequestMapping("/admin.nexacro")
	public String homeAdmin() {
		return "redirect:/nex/index.html";
	}
	
	//회원목록 로드
	@RequestMapping("/loadMemList.nexacro")
	public NexacroResult loadMem() throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out",mser.listMem());
		return nr;
	}
	
	//position테이블 로드
	@RequestMapping("loadPoList.nexacro")
	public NexacroResult loadPo() throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out",pser.listPo());
		return nr;
	}
	
	//dept테이블 로드
	@RequestMapping("loadDeptList.nexacro")
	public NexacroResult loadDept() throws Exception {
		System.out.println("들어오나요?");
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out",dser.listDept());
		return nr;
	}
	
	//회원등록
	@RequestMapping("insertMem.nexacro")
	public NexacroResult insertMem(@ParamDataSet(name = "ds_in") MemberDTO dto) throws Exception{
		System.out.println("id : " + dto.getId());
		System.out.println("name : " + dto.getName());
		System.out.println("gender : " + dto.getGender());
		System.out.println("contact : " + dto.getContact());
		System.out.println("is_married : " + dto.getIs_married());
		System.out.println("dept_code : " + dto.getDept_code());
		System.out.println("position_code : " + dto.getPosition_code());
		System.out.println("break_total_count : " + dto.getBreak_total_count());

		//mser.insertMem();
		return new NexacroResult();
	}
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
