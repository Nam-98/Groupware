package kh.gw.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.dao.WebhardDAO;
import kh.gw.dto.Webhard_accessDTO;
import kh.gw.dto.Webhard_dirDTO;
import kh.gw.dto.Webhard_filesDTO;

@Service
public class WebhardService {
	
	@Autowired
	private WebhardDAO whdao;
	
	@Autowired
	private HttpSession session;
	
	// 최초 접속 시 DB 조회 후 개인 디렉토리 생성
	public int personalMkdir(String sessionId) {
		int count = personalDirIsExist(sessionId);
		if (count < 1) {
			// 디렉토리 할당에 사용할 seq 선점
			int seq = newDirSeqGet();
			
			// 최상위 디렉토리 생성
			Webhard_dirDTO dirDTO = new Webhard_dirDTO();
			dirDTO.setWh_dir_seq(seq);
			dirDTO.setWh_dir_name(sessionId);
			dirDTO.setWh_dir_parent_seq(0);
			newDirMake(dirDTO);
			
			// 개인 아이디에 할당
			Webhard_accessDTO accDTO = new Webhard_accessDTO();
			accDTO.setWh_id(sessionId);
			accDTO.setWh_dir_seq(seq);
			accDTO.setWh_dir_type_code(0);
			dirAssign(accDTO);
			
		}
		
		return 0;
	}
	
	// 해당 아이디로 최상위 개인 디렉토리가 있는지 확인
	public int personalDirIsExist(String sessionId) {
		return whdao.personalDirIsExist(sessionId);
	}
	
	// 새로운 디렉토리 생성,할당 하기 위한 seq값 선점
	public int newDirSeqGet() {
		return whdao.newDirSeqGet();
	}
	
	// 새로운 디렉토리 생성
	public int newDirMake(Webhard_dirDTO dirDTO) {
		return whdao.newDirMake(dirDTO);
	}
	
	// 디렉토리 아이디에 할당
	public int dirAssign(Webhard_accessDTO accDTO) {
		return whdao.dirAssign(accDTO);
	}
	
	// 해당 아이디의 최상위 디렉토리 값 get
	public Map<String,Object> getTopDirInfo(String sessionId) {
		return whdao.getTopDirInfo(sessionId);
	}
	
	// 파일 업로드
	public int uploadFile(int dirSeq, List<MultipartFile> attfiles) {
		
		// 첨부한 파일 갯수만큼 for
		for (int i = 0; i < attfiles.size(); i++) {
			// 저장될 경로값 설정
			String realPath = session.getServletContext().getRealPath("/resources/Webhard_attached_files");
			File filesPath = new File(realPath);
			
//			// resource의 해당 폴더가 존재 하지 않는 경우 생성
//			if (!filesPath.exists()) {filesPath.mkdir();}
			
			String oriName =  attfiles.get(i).getOriginalFilename();
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String savedName = uuid+"_"+oriName;
			
			Webhard_filesDTO fileDTO = new Webhard_filesDTO();
			fileDTO.setWh_dir_seq(dirSeq);
			fileDTO.setWh_ori_name(oriName);
			fileDTO.setWh_saved_name(savedName);
			
			int uploadFileResult = whdao.uploadFile(fileDTO);
			System.out.println(fileDTO.getWh_saved_name());
		}
		
		return 0;
	}
	
	
	
	
	
	
	
}
