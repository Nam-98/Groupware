package kh.gw.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nexacro.uiadapter17.spring.core.annotation.ParamVariable;
import com.nexacro.uiadapter17.spring.core.data.NexacroResult;
import com.nexacro17.xapi.data.DataSet;

import kh.gw.dto.ApprovalDTO;
import kh.gw.dto.Approval_attached_filesDTO;
import kh.gw.dto.Approval_commentsDTO;
import kh.gw.dto.Approval_signDTO;
import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.BreakDTO;
import kh.gw.dto.Break_typeDTO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.service.ApprovalService;
import kh.gw.service.BreakService;
import kh.gw.service.DepartmentService;
import kh.gw.service.MemberService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private ApprovalService aservice;
	@Autowired
	private MemberService mservice;
	@Autowired
	private BreakService bservice;
	@Autowired
	private DepartmentService dservice;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toAppMainView.approval")
	public String toAppMainView (Model model) {
		model.addAttribute("writeList", aservice.getMainWriteList(5));
		model.addAttribute("toBeSignList", aservice.getMainTobeList());
		model.addAttribute("ccList", aservice.getMainCCList());
		return "approval/appMainView";
	}
	
	@RequestMapping("/toAppWriteView.approval")
	public String toAppWriteView (Model model) throws Exception {
		//전자문서 종류 가져오기
		model.addAttribute("docsType", aservice.appDocsType());
		//결재선 선택용 자료 보내기
		//List<MemberDTO> mlist = mservice.listMem();//멤버를 불러옴
		List<Map<String,Object>> mlist = mservice.getMembersForAppWrite();
		List<DepartmentDTO> dlist = dservice.listDept(); //부서명 가져옴
		List<Approval_sign_typeDTO> adtList = aservice.allSignType();
		List<Break_typeDTO> btList = bservice.getAllType();
		String treeData = aservice.makeOrganTreeData(mlist, dlist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("adtList", adtList);
		model.addAttribute("breakType", btList);
		model.addAttribute("treeData",treeData);
		return "approval/appWriteView";
	}
	
	@RequestMapping("/writeApproval.approval")
	public String writeApproval (ApprovalDTO dto, Approval_signDTO approval_signDTOList, Model model, BreakDTO bdto) throws Exception {	
		int appSeq = aservice.writeApp(dto);
		if(dto.getApp_type_code()==3) {
			bservice.insertBreak(bdto,dto,appSeq);
		}
		aservice.setInitAppSign(approval_signDTOList, appSeq);
		
		
		//앞에 approval/붙이면 approval/approval/toApp~ 로 가길래 아래와 같이 작성함. 
		return "redirect:toAppDetailView.approval?app_seq="+appSeq;
	}
	
	@RequestMapping("/toMySignListView.approval")
	public String toMySignListView (Model model, int cPage) throws Exception {
		List<ApprovalDTO> mySignedList = aservice.getMySignedList(cPage);
		String signedNavi = aservice.getNavi(cPage,"toMySignListView.approval","signed");
		model.addAttribute("signedList", mySignedList);
		model.addAttribute("signedNavi", signedNavi);
		return "approval/appMySignListView";
	}
	@RequestMapping("/toToBeSignListView.approval")
	public String toToBeSignListView (Model model, int cPage) throws Exception {
		List<ApprovalDTO> tobeSignList = aservice.getTobeSignList(cPage);
		String toBeNavi = aservice.getNavi(cPage, "toToBeSignListView.approval","tobe" );
		model.addAttribute("toBeSignList", tobeSignList);
		//model.addAttribute("isMyCheckTurnList", aservice.isMyCheckTurnList(tobeSignList));
		model.addAttribute("toBeNavi", toBeNavi);
		return "approval/appToBeSignListView";
	}
	@RequestMapping("/toAppDetailView.approval")
	public String toAppDetailView (Model model, int app_seq) throws Exception {
		model.addAttribute("mlist", mservice.listMem());
		model.addAttribute("app", aservice.getAppBySeq(app_seq));
		model.addAttribute("signs", aservice.getAppSignBySeq(app_seq));
		model.addAttribute("isMyCheckTurn", aservice.isMyCheckTurn(app_seq));
		model.addAttribute("files", aservice.getAppFileBySeq(app_seq));
		model.addAttribute("contents", aservice.getHtmlText(app_seq));
		model.addAttribute("app_seq", app_seq);
		model.addAttribute("cmts", aservice.getAppCmtBySeq(app_seq));
		return "approval/appDetailView";
	}
	@RequestMapping("/signApproval.approval")
	public String signApproval (String isAccept, int app_seq, Model model,int app_type_code) throws Exception {
		aservice.updateSign(app_seq, isAccept,app_type_code);
		return this.toAppDetailView(model, app_seq);
	}
	
    // 브라우저 정보 체크
    public String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Trident") > -1) {   // IE11 문자열 깨짐 방지
            return "Trident";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        } else if (header.indexOf("Safari") > -1) {
            return "Safari";
        }
        return "Firefox";
    }
    
	@RequestMapping(value="/dlAttachedFiles.approval", produces="application/text;charset=utf-8")
	public void dlAttachedFiles(Approval_attached_filesDTO dto, HttpServletRequest request, HttpServletResponse resp) throws Exception {
		String filePath = session.getServletContext().getRealPath("/resources/Approval_attached_files");
		File targetFile = new File(filePath+"/"+dto.getApp_saved_name());//경로 뒤에 download받고 싶은 file명을 붙이면 해당 file을 absolute path가 되며 이를 이용하여 java에서 객체로 받아올 수 있다.
		if(targetFile.exists() && targetFile.isFile()) {
			
			// 브라우저별 파일명 한글깨짐 해결 로직
			String browser = getBrowser(request);
			String encodedFilename = null;
			if (browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(dto.getApp_ori_name(), "UTF-8").replaceAll(
						"\\+", "%20");
			} else if (browser.equals("Firefox")) {
				encodedFilename = "\""
						+ new String(dto.getApp_ori_name().getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
				encodedFilename = "\""
						+ new String(dto.getApp_ori_name().getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
				StringBuffer sb = new StringBuffer();
				for (int j = 0; j < dto.getApp_ori_name().length(); j++) {
					char c = dto.getApp_ori_name().charAt(j);
					if (c > '~') {
						sb.append(URLEncoder.encode("" + c, "UTF-8"));
					} else {
						sb.append(c);
					}
				}
				encodedFilename = sb.toString();
			} else {
				throw new IOException("Not supported browser");
			}
			
			//resp의 defualt content type은 text/html이며 현재 우리가 보낼 file이 text/html이 아니므로 어떤 형태인지 설정해주어야 한다.  
			resp.setContentType("application/octet-steam; charset=utf8");
			resp.setContentLength((int)targetFile.length());
			resp.setHeader("Content-Disposition", "attachment; filename="+encodedFilename);//파일이 download될 때 해당 file의 name을 설정해준다. 
			FileInputStream fis = new FileInputStream(targetFile);
			ServletOutputStream sos = resp.getOutputStream();
			FileCopyUtils.copy(fis, sos);//param의 왼쪽을 오른쪽으로 copy해라. 
			fis.close();
			
			sos.flush();
			sos.close();
			//이렇게 되면 dispatcher에 resp가 가기도 전에 resp가 전송되므로 dispatcher는 아무런 행동도 하지 않는다. 
		}
	}
	@RequestMapping(value="/writeCmt.approval", method = RequestMethod.POST)
	@ResponseBody
	public Object writeCmt(Approval_commentsDTO dto,HttpServletRequest request) {
		int result = aservice.writeCmt(dto);
		if(result>0) {
		return "true";
		}
		return "false";
	}
	
	@RequestMapping(value="/delCmt.approval",method = RequestMethod.POST)
	@ResponseBody
	public Object delAppCmtBySeq(int app_cmt_seq,HttpServletRequest request) {
		int result = aservice.delAppCmtBySeq(app_cmt_seq);
		if(result>0) {
		return "true";
		}
		return "false";
	}
	
	@RequestMapping(value="/getTemplate.approval",method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public Object getTemplate(int app_docs_type) throws Exception {
		return aservice.getTemplate(app_docs_type);
	}
	
	@RequestMapping("/toCCListView.approval")
	public String toMyCCListView (Model model, int cPage) throws Exception {
		List<ApprovalDTO> mySignedList = aservice.getMyCCList(cPage);
		String signedNavi = aservice.getNavi(cPage,"toCCListView.approval","CC");
		model.addAttribute("signedList", mySignedList);
		model.addAttribute("signedNavi", signedNavi);
		return "approval/ccListView";
	}
	
	
	
	/////////////////////////////////////////넥사크로 part/////////////////////////////////////////
	@RequestMapping("/nxAppTypeLoad.approval")
	public NexacroResult nxAppTypeLoad() throws Exception {
		NexacroResult nr = new NexacroResult();
		nr.addDataSet("ds_out", aservice.nxAllDocsType());
		return nr;
	}
	@RequestMapping("/nxToSummernote.approval")
	public String nxToSummernote() {
		return "approval/nxTemplateEdit";
	}
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
