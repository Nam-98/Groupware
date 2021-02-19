package kh.gw.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.nexacro.uiadapter17.spring.core.annotation.ParamDataSet;
import com.nexacro.uiadapter17.spring.core.annotation.ParamVariable;
import com.nexacro.uiadapter17.spring.core.data.NexacroResult;
import com.nexacro17.xapi.data.DataSet;

import kh.gw.dto.Approval_typeDTO;
import kh.gw.dto.Break_typeDTO;
import kh.gw.dto.Company_holidayDTO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.dto.TnA_StandardTimeDTO;
import kh.gw.dto.WriteDTO;
import kh.gw.service.ApprovalService;
import kh.gw.service.BreakService;
import kh.gw.service.DepartmentService;
import kh.gw.service.MemberService;
import kh.gw.service.PositionService;
import kh.gw.service.TnAService;
import kh.gw.service.ScheduleService;
import kh.gw.service.WriteService;


@Controller
@RequestMapping("/nex")
public class AdminController {
	@Autowired
	private MemberService mser;

	@Autowired
	private PositionService pser;
	
	@Autowired
	private DepartmentService dser;
	
	@Autowired
	private ApprovalService aservice;
	
	@Autowired
	private WriteService wser;
	
	@Autowired
	private TnAService tservice;
	
	@Autowired
	private BreakService bser;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private ScheduleService sser;
	
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
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out",dser.listDept());
		return nr;
	}
	
	//회원등록
	@RequestMapping("insertMem.nexacro")
	public NexacroResult insertMem(@ParamDataSet(name = "ds_in") MemberDTO dto) throws Exception{
		mser.insertMem(dto);
		return new NexacroResult();
	}
	
	//회원수정
	@RequestMapping("updateMemList.nexacro")
	public NexacroResult updateMemList(@ParamDataSet(name = "in_memList") List<MemberDTO> list) throws Exception{
		mser.updateMemList(list);
		return new NexacroResult();
	}
	
	//프로필사진등록
	@RequestMapping("insertProfile.nexacro")
	public String insertProfile(HttpServletRequest request, MultipartFile profilePic) throws Exception {
		String id = request.getParameter("id");
		System.out.println(id);
		mser.insertProfile(profilePic, id);
		return "redirect:/";
	}
	
	//공지사항 글 작성
	@RequestMapping("insertWrite.nexacro")
	public NexacroResult insertWrite(@ParamDataSet(name = "ds_in") WriteDTO dto) throws Exception{
		String id = (String)session.getAttribute("id");
		dto.setWrite_id(id);
		wser.insertWrite(dto);
		return new NexacroResult();
	}
	
	//write 테이블 로드
		@RequestMapping("loadWrList.nexacro")
		public NexacroResult loadWr() throws Exception {
			NexacroResult nr = new NexacroResult();
			nr.addDataSet("ds_out",wser.listWr());
			return nr;
		}
		
	//공지사항 수정
	@RequestMapping("updateWrList.nexacro")
	public NexacroResult updateWrList(@ParamDataSet(name = "in_WrList") List<WriteDTO> list) throws Exception{
		wser.updateWrList(list);
		return new NexacroResult();
	}
	
	//공지사항 삭제
	@RequestMapping("deleteWrList.nexacro")
	public NexacroResult updateWrList(@ParamDataSet(name = "in_WrDelete") WriteDTO dto) throws Exception{
		wser.deleteWrList(dto);
		return new NexacroResult();
	}
		
	//전자결재 종류 관리 페이지로 이동
	@RequestMapping("/nxAppTypeLoad.nexacro")
	public NexacroResult nxAppTypeLoad() throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out", aservice.nxAllDocsType());
		return nr;
	}
	//전자결재 template 수정용 summertnote.jsp로 감.
	//21.02.15기준으로 해당 webBrowser의 url이 Server::가 아닌 http://localhost/로 되어있기에 나중에 deploy시 수정 요망
	@RequestMapping("/nxToSummernote.nexacro")
	public String nxToSummernote() {
		return "approval/nxTemplateEdit";
	}
	
	//전자결재 문서종류 업데이트
	@RequestMapping("/nxAppTypeUpdate.nexacro")
	public NexacroResult nxAppTypeUpdate(@ParamDataSet(name="ds_in")Approval_typeDTO dto) throws Exception {
		int result = aservice.nxCuDocsType(dto);
		NexacroResult nr = new NexacroResult();
		nr.setErrorCode(result);
		return nr;
	}
	
	//근태조정신청 list
	@RequestMapping("/tnaHistory.nexacro")
	public NexacroResult tnaHistory() throws Exception{
		NexacroResult nr = new NexacroResult();
		List<Map<String, Object>> tnaHistory = tservice.tnaHistory();
		nr.addDataSet("ds_out",tnaHistory);
		return nr;
	}
	
	//근태조정신청 승인
	@RequestMapping("/tnaHistoryApproval.nexacro")
	public NexacroResult tnaHistoryApproval(@ParamVariable(name="statusCode")int statusCode,@ParamVariable(name="objSeq")int objSeq,@ParamVariable(name="finalChange")int finalChange,@ParamVariable(name="tnaSeq")int tnaSeq,@ParamVariable(name="objStatus")String objStatus) throws Exception {
		NexacroResult nr = new NexacroResult();
		//tna테이블 출퇴근구분을 통해서 출근구분코드 혹은 퇴근구분코드 변경(tnaSeq,objStatus,finalChange)
		//tna_objection테이블 처리상태 변경(objSeq,statusCode)
		
		if(objStatus.contentEquals("start")) {
			int tnaApproval = tservice.tnaStartApp(tnaSeq,finalChange);
			int objApproval = tservice.objApproval(objSeq,statusCode);
			System.out.println("Stna결과 : " + tnaApproval);
			System.out.println("Stna결과 : " + objApproval);
		}else {
			int tnaApproval = tservice.tnaEndApp(tnaSeq,finalChange);
			int objApproval = tservice.objApproval(objSeq,statusCode);
			System.out.println("Etna결과 : " + tnaApproval);
			System.out.println("Etna결과 : " + objApproval);
			
		};
		return nr;
	}
	
	//근태조정신청 반려
	@RequestMapping("/tnaHistoryReturn.nexacro")
	public NexacroResult tnaHistoryReturn(@ParamVariable(name="statusCode")int statusCode,@ParamVariable(name="objSeq")int objSeq) throws Exception{
		NexacroResult nr = new NexacroResult();
		int objApproval = tservice.objApproval(objSeq,statusCode);
		System.out.println("반려결과 : " + objApproval);
		return nr;
	}

	//breaktype테이블 로드
	@RequestMapping("loadBreakType.nexacro")
	public NexacroResult loadBreakType() throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out",bser.getAllType());
		return nr;
	}

	//breaktype테이블 수정/삭제/추가
	@RequestMapping("updateBreakType.nexacro")
	public NexacroResult updateBreakType(@ParamDataSet(name = "in_break")  DataSet ds) throws Exception{
		
		for (int i = 0; i < ds.getRemovedRowCount(); i++) {
           int break_code = (int) ds.getRemovedData(i, "break_code");
           bser.deleteBreakType(break_code);
           System.out.println("지우는 code :" + break_code);
         }
		
        for (int i = 0; i < ds.getRowCount(); i++) {
            int rowType = ds.getRowType(i);
            if (rowType == DataSet.ROW_TYPE_INSERTED) {
            	Break_typeDTO dto = new Break_typeDTO();
            	dto.setBreak_name((String)ds.getString(i, "break_name"));
                dto.setBreak_discount(ds.getDouble(i, "break_discount"));
            	System.out.println("넣은 휴무 이름 : " + dto.getBreak_name());
            	System.out.println(dto.getBreak_discount());
                System.out.println(dto.getBreak_name());
            	bser.insertBreakType(dto);
            }else if (rowType == DataSet.ROW_TYPE_UPDATED) {
            	Break_typeDTO dto = new Break_typeDTO();
            	 dto.setBreak_code(Integer.parseInt((String)ds.getSavedData(i,"break_code")));
                 dto.setBreak_name((String)ds.getSavedData(i, "break_name"));
                 dto.setBreak_discount(ds.getDouble(i, "break_discount"));
                 System.out.println(dto.getBreak_code());
                 System.out.println(dto.getBreak_discount());
                 System.out.println(dto.getBreak_name());
              bser.updateBreakType(dto);
            }

        }
		return new NexacroResult();
	}
	
	@RequestMapping("loadComHd.nexacro")
	public NexacroResult loadComHd() throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out",sser.loadComHd());
		return nr;
	}
	
	@RequestMapping("inserthol.nexacro")
	public NexacroResult inserthol(@ParamDataSet(name = "ds_in") Company_holidayDTO dto) throws Exception{
		sser.inserthol(dto);
		return new NexacroResult();
	}
	
	@RequestMapping("updateComhd.nexacro")
	public NexacroResult updateComhd(@ParamDataSet(name = "in_holiday") DataSet ds) throws Exception{
		for (int i = 0; i < ds.getRemovedRowCount(); i++) {
	           int comp_hd_seq = (int) ds.getRemovedData(i, "comp_hd_seq");
	           sser.deleteComhd(comp_hd_seq);
	           System.out.println("지우는 code :" + comp_hd_seq);
	         }
			
	        for (int i = 0; i < ds.getRowCount(); i++) {
	            int rowType = ds.getRowType(i);
	            if (rowType == DataSet.ROW_TYPE_UPDATED) {
	            	Company_holidayDTO dto = new Company_holidayDTO();
	            	 dto.setComp_hd_seq(Integer.parseInt((String)ds.getSavedData(i,"comp_hd_seq")));
	                 dto.setComp_hd_name((String)ds.getSavedData(i, "comp_hd_name"));
	                 dto.setComp_hd_date(ds.getDateTime(i, "comp_hd_date"));
	                 System.out.println(dto.getComp_hd_name());
	                 System.out.println(dto.getComp_hd_seq());
	                 System.out.println(dto.getComp_hd_date());
	              sser.updateComhd(dto);
	            }
	        }
			return new NexacroResult();
	}
	
	//전자결재 문서관리에 모든 문서 리스트 넣기
	@RequestMapping("/nxAppAllList.nexacro")
	public NexacroResult nxAppAllList() throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("list_approval", aservice.nxAppAllList());
		nr.addDataSet("list_approval_type",aservice.nxAllDocsType());
		nr.addDataSet("list_approval_status",aservice.nxAppStatusList());
		return nr;
	}
	@RequestMapping("/nxAppTypeDelete.nexacro")
	public NexacroResult nxAppTypeDelete(@ParamVariable(name="app_seq")int app_type_code) throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.setErrorCode(aservice.nxDelDocsType(app_type_code));
		return nr;
	}
	@RequestMapping("/nxDeptAdd.nexacro")
	public NexacroResult nxDeptAdd(@ParamDataSet(name="ds_in")DepartmentDTO dto) {
		NexacroResult nr = new NexacroResult();
		nr.setErrorCode(dser.nxDeptAdd(dto));
		return nr;
	}
	@RequestMapping("/nxDeptUdt.nexacro")
	public NexacroResult nxDeptUdt(@ParamDataSet(name="ds_in")DepartmentDTO dto) {
		NexacroResult nr = new NexacroResult();
		nr.setErrorCode(dser.nxDeptUdt(dto));
		return nr;
	}
	@RequestMapping("/nxDeptDel.nexacro")
	public NexacroResult nxDeptDel(@ParamVariable(name="dept_code")int dept_code) {
		NexacroResult nr = new NexacroResult();
		nr.setErrorCode(dser.nxDeptDel(dept_code));
		return nr;
	}
	
	//holidaylist테이블 로드
	@RequestMapping("/loadHolidayList.nexacro")
	public NexacroResult loadHolidayList(@ParamVariable(name="argu0")String id) throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out",bser.loadHolidayList(id));
		return nr;
	}
	
	@RequestMapping("returnHome.nexacro")
	public String returnHome() throws Exception {
		return "redirect:/";
	}
	
	//출퇴근 기준 시간 가져오기
	@RequestMapping("/tnaStandardTime.nexacro")
	public NexacroResult tnaStandardTime() throws Exception{
		NexacroResult nr = new NexacroResult();
		TnA_StandardTimeDTO sdto = tservice.tnaStandardTime();
		nr.addDataSet("ds_out",sdto);
		
		return nr;
	}
	
	//출퇴근 기준 시간 변경
	@RequestMapping("/tnaUpdateTime.nexacro")
	public NexacroResult tnaUpdateTime(@ParamVariable(name="att_time")String att_time,@ParamVariable(name="lea_time")String lea_time,@ParamVariable(name="nig_time")String nig_time) throws Exception{
		NexacroResult nr = new NexacroResult();
		int result = tservice.tnaUpdateTime(att_time,lea_time,nig_time);
		System.out.println(result);
		
		return nr;
	}

	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}

}
