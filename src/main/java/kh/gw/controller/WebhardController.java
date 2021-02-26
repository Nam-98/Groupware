package kh.gw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	// test
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
		
		
		// 최초 웹하드 접속시 개인,부서,공용 디렉토리 생성, 할당
		whservice.dirAssignId(sessionId);

		
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
		// 폴더 리스트 가져오기
		List<Webhard_dirDTO> dirFolderList = whservice.getDirFolderList(dirSeq);
		// 파일 리스트 가져오기
		List<Webhard_filesDTO> dirFileList = whservice.getDirFileList(dirSeq);
		// 접근 가능한 최상위 폴더 리스트 가져오기
		List<Integer> topAccessDirList = whservice.getTopAccessDirList(sessionId);
		
		model.addAttribute("dirFolderList", dirFolderList);
		model.addAttribute("dirFileList", dirFileList);
		model.addAttribute("dirSeq", dirSeq);
		model.addAttribute("topAccessDirList", topAccessDirList);
		
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
	public void attFilesDown(Webhard_filesDTO whfDTO, HttpServletRequest request, HttpServletResponse resp) throws Exception{
		
		System.out.println("요청 파일 seq : " + whfDTO.getWh_files_seq());
		System.out.println("요청 파일 SavedName : " + whfDTO.getWh_saved_name());
		System.out.println("=========="+whfDTO.getWh_ori_name());
		
		
		String filePath = session.getServletContext().getRealPath("/resources/Webhard_attached_files");
		File targetFile = new File(filePath+"/"+whfDTO.getWh_saved_name());
		//파일이 존재하고 진짜 파일이 맞다면
		if(targetFile.exists() && targetFile.isFile()) {
			
			// 브라우저별 파일명 한글깨짐 해결 로직
			String browser = getBrowser(request);
			String encodedFilename = null;
			if (browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(whfDTO.getWh_ori_name(), "UTF-8").replaceAll(
						"\\+", "%20");
			} else if (browser.equals("Firefox")) {
				encodedFilename = "\""
						+ new String(whfDTO.getWh_ori_name().getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
				encodedFilename = "\""
						+ new String(whfDTO.getWh_ori_name().getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
				StringBuffer sb = new StringBuffer();
				for (int j = 0; j < whfDTO.getWh_ori_name().length(); j++) {
					char c = whfDTO.getWh_ori_name().charAt(j);
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
			
			
			///////////////////////////////////////
			
			resp.setContentType("application/octet-stream; charset=utf8");
			resp.setContentLength((int)targetFile.length());//파일 크기
			resp.setHeader("Content-Disposition", "attachment;filename=\""+encodedFilename+"\";");
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
	
	// 새폴더 생성 중복체크
	@RequestMapping("mkdirOverlapCheck.webhard")
	@ResponseBody
	public String mkdirOverlapCheck(HttpServletRequest request, Model model) {
		String stringdirSeqGet = request.getParameter("dirSeq");
		int dirSeq = Integer.parseInt(stringdirSeqGet);
		String newFolderName = request.getParameter("newFolderName");

		// 중복되는 폴더, 파일이 있는지 체크
		int overlapCount = whservice.mkdirOverlapCheck(dirSeq, newFolderName);
		
		return overlapCount + "";
	}
	
	// 새폴더 생성 프로세스
	@RequestMapping("mkdirProcess.webhard")
	public String mkdirProcess(HttpServletRequest request, Model model) {
		String stringdirSeqGet = request.getParameter("dirSeq");
		int dirSeq = Integer.parseInt(stringdirSeqGet);
		String newFolderName = request.getParameter("newFolderName");
		
		whservice.mkdirProcess(dirSeq, newFolderName);
		
		// 이전 페이지 주소값
		String referer = request.getHeader("REFERER");
		
		return "redirect:" + referer;
	}
	
	// 체크된 폴더 및 파일 삭제 프로세스
	@RequestMapping(value="delCheckObject.webhard", method=RequestMethod.POST)
	@ResponseBody
	public String delCheckObject(@RequestParam(value="chkArrFolder[]") List<String> chkArrFolder,
			@RequestParam(value="chkArrFile[]") List<String> chkArrFile) {
		
		// 정상처리 값 0 / 에러 시 1 이상
		int result = whservice.delListProc(chkArrFolder, chkArrFile);
		return result +"";
	}
	
	// 부모디렉토리로 이동 (부모디렉토리 찾아서 webhardMain으로 리다이렉트)
	@RequestMapping("goToParentDir.webhard")
	public String goToParentDir(HttpServletRequest request, Model model) {
		// 자식 디렉토리 번호
		String stringdirSeqChildGet = request.getParameter("dirSeqChild");
		int dirSeqChild = Integer.parseInt(stringdirSeqChildGet);
	
		int dirSeqParent = whservice.getDirSeqParent(dirSeqChild);
		
		
		return "redirect:/webhard/webhardMain.webhard?dirSeq="+dirSeqParent;
	}
	
	// 체크된 대상의 이름 변경 프로세스
	@RequestMapping("renameObjectProcess.webhard")
	public String renameObjectProcess(HttpServletRequest request, Model model) {
		// 체크된 대상의 오브젝트 seq 번호
		String stringobjectSeqGet = request.getParameter("objectSeq");
		int objectSeq = Integer.parseInt(stringobjectSeqGet);
		// 변경할 이름 값
		String newObjectName = request.getParameter("newFolderName");
		// 변경될 대상의 타입
		String dirType = request.getParameter("dirType");
		
		whservice.renameObjectProcess(objectSeq, newObjectName, dirType);
		
		
		
		
		
		// 이전 페이지 주소값
		String referer = request.getHeader("REFERER");
		
		return "redirect:" + referer;
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
	
	
	
	
	
	
	

}
