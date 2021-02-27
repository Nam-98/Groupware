package kh.gw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
		
		// 현재 접근할 폴더 정보 가져오기
		Webhard_dirDTO nowDirInfo = whservice.getNowDirInfo(dirSeq);
		// 현재 디렉토리 이름 보내기
		String nowDirName = nowDirInfo.getWh_dir_name();
		
		
		model.addAttribute("dirFolderList", dirFolderList);
		model.addAttribute("dirFileList", dirFileList);
		model.addAttribute("dirSeq", dirSeq);
		model.addAttribute("topAccessDirList", topAccessDirList);
		model.addAttribute("nowDirName", nowDirName);
		
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
	
	
	// 체크된 파일 다운로드 프로세스
	@RequestMapping(value="multiFilesDown.webhard")
	public void multiFilesDown(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		
		// 다운로드 받을 파일 seq 번호 목록 문자열
		String chkArrFileString = request.getParameter("chkArrFile");
		// 문자열이 , 로 구분된 코드를 리스트로 반환
		List<String> chkArrFile = whservice.codesToList(chkArrFileString);
		
		// 실제 파일이 존재하는 경로
		String filePath = session.getServletContext().getRealPath("/resources/Webhard_attached_files");
		
		// 체크된 파일이 단 하나일 경우
		if(chkArrFile.size() <= 1) {
			// 파일 seq 번호값
			int fileSeq = Integer.parseInt(chkArrFile.get(0));
			// 해당되는 seq값의 dto 가져옴
			Webhard_filesDTO fileDTO = whservice.getFileInfo(fileSeq);
			
			String oriName = fileDTO.getWh_ori_name();
			String savedName = fileDTO.getWh_saved_name();
			File targetFile = new File(filePath + "/" + savedName);
			System.out.println(oriName);
			System.out.println(savedName);
			System.out.println(targetFile);
			
			//파일이 존재하고 진짜 파일이 맞다면
			if(targetFile.exists() && targetFile.isFile()) {
				
				// 브라우저별 파일명 한글깨짐 해결 로직
				String browser = getBrowser(request);
				String encodedFilename = null;
				if (browser.equals("MSIE")) {
					encodedFilename = URLEncoder.encode(oriName, "UTF-8").replaceAll(
							"\\+", "%20");
				} else if (browser.equals("Firefox")) {
					encodedFilename = "\""
							+ new String(oriName.getBytes("UTF-8"), "8859_1") + "\"";
				} else if (browser.equals("Opera")) {
					encodedFilename = "\""
							+ new String(oriName.getBytes("UTF-8"), "8859_1") + "\"";
				} else if (browser.equals("Chrome")) {
					StringBuffer sb = new StringBuffer();
					for (int j = 0; j < oriName.length(); j++) {
						char c = oriName.charAt(j);
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
			
		// 다운받을 파일이 2개 이상인 경우	
		}else {
			//실제 파일 취급
			File targetFile = null;
			//다운받을 파일에 입힐 이름
			String tranName ="";
			
			ArrayList<String> arrSaved = new ArrayList<String>();
			ArrayList<String> arrOrg = new ArrayList<String>();
			
			for(int i = 0; i < chkArrFile.size(); i++) {
				
				// 파일 seq 번호값
				int fileSeq = Integer.parseInt(chkArrFile.get(i));
				// 해당되는 seq값의 dto 가져옴
				Webhard_filesDTO fileDTO = whservice.getFileInfo(fileSeq);
				
				// 저장된 이름 목록 리스트 만들기
				String savedName = fileDTO.getWh_saved_name();
				arrSaved.add(i, savedName);
				
				// 출력할 이름 목록 리스트 만들기
				String oriName  = fileDTO.getWh_ori_name();
				arrOrg.add(i, oriName);
			}
			
			for(int i = 0; i<arrSaved.size(); i++) {
				// 받을 zip 파일명 지정
				Date nowDate = new Date(System.currentTimeMillis());
				String yearValue = (nowDate.getYear() + 1900) + "-";
				String monthValue = (nowDate.getMonth() + 1) + "-";
				String dayValue = (nowDate.getDate()) + "";
				
				
				String title = "STJWARE_"+ yearValue + monthValue + dayValue;
				
				// 파일이 2개 이상이면 압축파일로 저장한다.
				if(arrSaved.size() > 1) {
					// 만들 압축파일의 고유값 생성
					String uid = UUID.randomUUID().toString().replaceAll("-", "");
				    targetFile = whservice.getCompressZipFile(arrSaved, filePath, "compressZip_"+uid);	    
				    tranName = title+".zip";	 
					resp.setContentType("application/zip; charset=utf-8"); 	//응답으로 보낼 데이터의 내용 형태 세팅/resp 기본적으로 text형식으로 보낸다.(text형식으로 보내면 랜더링 된다

					resp.setContentLength((int)targetFile.length());
					resp.setHeader("Content-Disposition", "attachment; filename=\""+tranName+"\"");
					FileInputStream fis = new FileInputStream(targetFile);
					ServletOutputStream sos = resp.getOutputStream();
					FileCopyUtils.copy(fis, sos);
					fis.close();
					sos.flush();
					sos.close();
				}
			}
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
	
	
	// error
	@ExceptionHandler
	public String exceptionalHandler(Exception e) {
		e.printStackTrace();
		return "errorPopup";
	}
	
	
	
	
	

}
