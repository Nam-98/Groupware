package kh.gw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.dto.Message_attached_filesDTO;
import kh.gw.dto.Webhard_dirDTO;
import kh.gw.dto.Webhard_filesDTO;
import kh.gw.service.WebhardService;

@Controller
@RequestMapping("/webhard")
public class WebhardController {
	
	@Autowired
	private WebhardService whservice;
	@Autowired
	private HttpSession session;
	
	// 웹하드 접속 (개인 디렉토리)
	@RequestMapping("webhardMain.webhard")
	public String webhardMain(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		// 접속할 디렉토리 번호
		String stringdirSeqGet = request.getParameter("dirSeq");
		// 개인/부서/공용 어느곳으로 접속할지 변수
		String status = request.getParameter("status");
		if (status == null) {
			status = "personal";
		}
		int dirSeq = 1;
		
		
		// 최초 웹하드 접속시 개인 폴더 생성
		whservice.personalMkdir(sessionId);

		
		if (stringdirSeqGet != null) {
			dirSeq = Integer.parseInt(stringdirSeqGet);
		}else {
			// 개인 디렉토리 접속
			if (status.contentEquals("personal")) {
				// 개인 최상위 디렉토리 정보값 가져옴
				Map<String,Object> info = whservice.getTopDirInfo(sessionId);
				// 개인 최상위 디렉토리 번호값 가져옴
				dirSeq = Integer.parseInt(String.valueOf(info.get("WH_DIR_SEQ")));
			// 부서 디렉토리 접속
			}else if (status.contentEquals("department")) {
				// 부서 최상위 디렉토리 정보값 가져옴
				Map<String,Object> info = whservice.getTopDepartmentDirInfo(sessionId);
				// 공용 최상위 디렉토리 번호값 가져옴
				dirSeq = Integer.parseInt(String.valueOf(info.get("WH_DIR_SEQ")));
			// 공용 디렉토리 접속
			}else if (status.contentEquals("common")) {
				// 공용 최상위 디렉토리 정보값 가져옴
				Map<String,Object> info = whservice.getTopCommonDirInfo(sessionId);
				// 공용 최상위 디렉토리 번호값 가져옴
				dirSeq = Integer.parseInt(String.valueOf(info.get("WH_DIR_SEQ")));
			}

		}
//		// 폴더 리스트 가져오기
		List<Webhard_dirDTO> dirFolderList = whservice.getDirFolderList(dirSeq);
		// 파일 리스트 가져오기
		List<Webhard_filesDTO> dirFileList = whservice.getDirFileList(dirSeq);
		
		model.addAttribute("dirFolderList", dirFolderList);
		model.addAttribute("dirFileList", dirFileList);
		model.addAttribute("dirSeq", dirSeq);
		
		return "/webhard/webhardMain";
	}
	
	
	// 파일 업로드
	@RequestMapping("uploadFile.webhard")
	public String uploadFile(List<MultipartFile> attfiles, HttpServletRequest request, Model model) throws IOException {
		// 저장할 dirSeq 값 도출
		int dirSeq = Integer.parseInt(request.getParameter("dirSeq"));
		
		// 파일 리스트, 디렉토리 번호에 저장
		whservice.uploadFile(dirSeq, attfiles);
		
		
		// 이전 페이지 주소값
		String referer = request.getHeader("REFERER");
		
		return "redirect:" + referer;
	}
	
	//첨부파일 단일 다운로드
	@RequestMapping("attFilesDown.webhard")
	public void attFilesDown(Webhard_filesDTO whfDTO, HttpServletResponse resp) throws Exception{
		
		System.out.println("요청 파일 seq : " + whfDTO.getWh_files_seq());
		System.out.println("요청 파일 SavedName : " + whfDTO.getWh_saved_name());
		System.out.println("=========="+whfDTO.getWh_ori_name());
		
		
		String filePath = session.getServletContext().getRealPath("/resources/Webhard_attached_files");
		File targetFile = new File(filePath+"/"+whfDTO.getWh_saved_name());
		if(targetFile.exists() && targetFile.isFile()) {
			//파일이 존재하고 진짜 파일이 맞다면
			resp.setContentType("application/octet-stream; charset=utf8");
			resp.setContentLength((int)targetFile.length());//파일 크기
			resp.setHeader("Content-Disposition", "attachment;filename=\""+whfDTO.getWh_ori_name()+"\";");
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
	
//	// 새폴더 생성 중복체크
//	@RequestMapping("mkdirOverlapCheck.webhard")
//	@ResponseBody
//	public String mkdirOverlapCheck(HttpServletRequest request, Model model) {
//		
//	}
	
	
	
	
	
	
	

}
