package kh.gw.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.service.WebhardService;

@Controller
@RequestMapping("/webhard")
public class WebhardController {
	
	@Autowired
	private WebhardService whservice;
	@Autowired
	private HttpSession session;
	
	// 웹하드 접속
	@RequestMapping("webhardMain.webhard")
	public String webhardMain(HttpServletRequest request, Model model) {
		// 세션 id값 가져오기
		String sessionId = (String)session.getAttribute("id");
		
		// 최초 웹하드 접속시 개인 폴더 생성
		whservice.personalMkdir(sessionId);
		// 개인 최상위 디렉토리 번호값 가져옴
		Map<String,Object> info = whservice.getTopDirInfo(sessionId);
		int dirSeq = Integer.parseInt(String.valueOf(info.get("WH_DIR_SEQ")));
		
		
		model.addAttribute("dirSeq", dirSeq);
		
		return "/webhard/webhardMain";
	}
	
	// 파일 업로드
	@RequestMapping("uploadFile.webhard")
	public String uploadFile(List<MultipartFile> attfiles, HttpServletRequest request, Model model) {
		// 저장할 dirSeq 값 도출
		int dirSeq = Integer.parseInt(request.getParameter("dirSeq"));
		
		// 파일 리스트, 디렉토리 번호에 저장
		whservice.uploadFile(dirSeq, attfiles);
		
		
		return "/";
	}
	
	
	
	

}
