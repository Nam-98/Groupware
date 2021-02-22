package kh.gw.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.dao.WebhardDAO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.dto.Webhard_accessDTO;
import kh.gw.dto.Webhard_dirDTO;
import kh.gw.dto.Webhard_filesDTO;

@Service
public class WebhardService {
	
	@Autowired
	private WebhardDAO whdao;
	
	@Autowired
	private HttpSession session;
	
	// 최초 접속 시 DB 조회 후 개인 디렉토리 생성 및 할당
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
		Webhard_accessDTO accDTO = new Webhard_accessDTO();
		accDTO.setWh_id(sessionId);
		accDTO.setWh_dir_type_code(0);
		return whdao.personalDirIsExist(accDTO);
	}
	
	// 해당 아이디로 최상위 공용 디렉토리가 있는지 확인
	public int commonDirIsExist(String sessionId) {
		Webhard_accessDTO accDTO = new Webhard_accessDTO();
		accDTO.setWh_id(sessionId);
		accDTO.setWh_dir_type_code(2);
		return whdao.commonDirIsExist(accDTO);
	}
	
	// 해당 아이디로 최상위 부서 디렉토리가 있는지 확인
	public int departmentDirIsExist(String sessionId) {
		// 해당 아이디의 정보 가져와서 부서코드 get
		MemberDTO mdto = idInfomationGet(sessionId);
		int deptCode = mdto.getDept_code();
		// 해당 부서코드의 정보 가져와서 웹하드 디렉토리 번호 get
		DepartmentDTO ddto = deptInfomationGet(deptCode);
		int dirSeq = ddto.getDept_dir_id();
		
		Webhard_accessDTO accDTO = new Webhard_accessDTO();
		accDTO.setWh_id(sessionId);
		accDTO.setWh_dir_seq(dirSeq);
		accDTO.setWh_dir_type_code(1);
		
		return whdao.departmentDirIsExist(accDTO);
	}
	
	// 해당 아이디의 정보 가져오기
	public MemberDTO idInfomationGet(String sessionId) {
		return whdao.idInfomationGet(sessionId);
	}
	
	// 해당 부서코드의 정보 가져오기
	public DepartmentDTO deptInfomationGet(int deptCode) {
		return whdao.deptInfomationGet(deptCode);
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
	
	// 해당 아이디의 개인 최상위 디렉토리 값 get
	public Map<String,Object> getTopDirInfo(String sessionId) {
		
		Webhard_accessDTO accDTO = new Webhard_accessDTO();
		accDTO.setWh_id(sessionId);
		accDTO.setWh_dir_type_code(0);
		
		return whdao.getTopDirInfo(accDTO);
	}
	
	// 해당 아이디의 공용 최상위 디렉토리 값 get
	public Map<String,Object> getTopCommonDirInfo(String sessionId) {
		
		Webhard_accessDTO accDTO = new Webhard_accessDTO();
		accDTO.setWh_id(sessionId);
		accDTO.setWh_dir_type_code(2);
		
		return whdao.getTopCommonDirInfo(accDTO);
	}
	
	// 해당 아이디의 부서 최상위 디렉토리 값 get
	public Map<String,Object> getTopDepartmentDirInfo(String sessionId) {
		
		// 할당 할 부서의 dirSeq값 가져오기
		// 해당 아이디의 정보 가져와서 부서코드 get
		MemberDTO mdto = idInfomationGet(sessionId);
		int deptCode = mdto.getDept_code();
		// 해당 부서코드의 정보 가져와서 웹하드 디렉토리 번호 get
		DepartmentDTO ddto = deptInfomationGet(deptCode);
		int dirSeq = ddto.getDept_dir_id();
		
		Webhard_accessDTO accDTO = new Webhard_accessDTO();
		accDTO.setWh_id(sessionId);
		accDTO.setWh_dir_seq(dirSeq);
		accDTO.setWh_dir_type_code(1);
		
		return whdao.getTopDepartmentDirInfo(accDTO);
	}
	
	// 파일 업로드
	public int uploadFile(int dirSeq, List<MultipartFile> attfiles) throws IOException {
		
		// 첨부한 파일 갯수만큼 for
		for (int i = 0; i < attfiles.size(); i++) {

			// 파일 리스트가 비어있을 경우
			if(attfiles.get(i).getOriginalFilename() == null || attfiles.get(i).getOriginalFilename().contentEquals("")) {
				System.out.println("스킵됨");
				continue;
			}
			
			
			// 저장될 경로값 설정
			String realPath = session.getServletContext().getRealPath("/resources/Webhard_attached_files");
			File filesPath = new File(realPath);
			
			// resource의 해당 폴더가 존재 하지 않는 경우 생성
			if (!filesPath.exists()) {filesPath.mkdir();}
			
			String oriName =  attfiles.get(i).getOriginalFilename();
			System.out.println(oriName);
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String savedName = uuid+"_"+oriName;
			System.out.println(savedName);
			Webhard_filesDTO fileDTO = new Webhard_filesDTO();
			fileDTO.setWh_dir_seq(dirSeq);
			fileDTO.setWh_ori_name(oriName);
			fileDTO.setWh_saved_name(savedName);
			
			// DB에 값 저장
			int uploadFileResult = whdao.uploadFile(fileDTO);
			
			// 파일 디렉토리에 저장
			if(uploadFileResult > 0) {
				File targetLoc = new File(filesPath.getAbsoluteFile()+"/"+savedName);
				FileCopyUtils.copy(attfiles.get(i).getBytes(), targetLoc);
			}
		}
		
		return 0;
	}
	
	// 해당 디렉토리의 파일 리스트 가져오기
	public List<Webhard_filesDTO> getDirFileList(int dirSeq) {
		return whdao.getDirFileList(dirSeq);
	}
	
	// 해당 디렉토리의 폴더 리스트 가져오기
	public List<Webhard_dirDTO> getDirFolderList(int dirSeq) {
		return whdao.getDirFolderList(dirSeq);
	}
	
	// 최초 공용 디렉토리 접속 시 할당
	public int commonDirAssign(String sessionId) {
		int count = commonDirIsExist(sessionId);
		if (count < 1) {
			
			// 개인 아이디에 할당
			Webhard_accessDTO accDTO = new Webhard_accessDTO();
			accDTO.setWh_id(sessionId);
			accDTO.setWh_dir_seq(1);
			accDTO.setWh_dir_type_code(2);
			dirAssign(accDTO);
			
		}
		
		return 0;
	}
	
	// 최초 부서 디렉토리 접속 시 할당
	public int departmentDirAssign(String sessionId) {
		int count = departmentDirIsExist(sessionId);
		if (count < 1) {
			
			// 할당 할 부서의 dirSeq값 가져오기
			// 해당 아이디의 정보 가져와서 부서코드 get
			MemberDTO mdto = idInfomationGet(sessionId);
			int deptCode = mdto.getDept_code();
			// 해당 부서코드의 정보 가져와서 웹하드 디렉토리 번호 get
			DepartmentDTO ddto = deptInfomationGet(deptCode);
			int dirSeq = ddto.getDept_dir_id();
			
			// 개인 아이디에 할당
			Webhard_accessDTO accDTO = new Webhard_accessDTO();
			accDTO.setWh_id(sessionId);
			accDTO.setWh_dir_seq(dirSeq);
			accDTO.setWh_dir_type_code(1);
			dirAssign(accDTO);
			
		}
		
		return 0;
	}
	
	// 중복되는 폴더, 파일이 있는지 체크
	public int mkdirOverlapCheck(int dirSeq, String newFolderName) {
		
		// 해당 이름과 겹치는 개수 초기값
		int overlapCount = 0;
		
		// 폴더 리스트 가져오기
		List<Webhard_dirDTO> dirFolderList = getDirFolderList(dirSeq);
		for (int i = 0; i < dirFolderList.size(); i++) {
			if (dirFolderList.get(i).getWh_dir_name().contentEquals(newFolderName)) {
				overlapCount += 1;
			}
		}
		// 파일 리스트 가져오기
		List<Webhard_filesDTO> dirFileList = getDirFileList(dirSeq);
		for (int i = 0; i < dirFileList.size(); i++) {
			if (dirFileList.get(i).getWh_ori_name().contentEquals(newFolderName)) {
				overlapCount += 1;
			}
		}
		
		return overlapCount;
	}
	
	// 해당 디렉토리 내에 새 폴더 생성
	public int mkdirProcess(int dirSeq, String newFolderName) {
		int newDirSeq = newDirSeqGet();
		
		Webhard_dirDTO dirDTO = new Webhard_dirDTO();
		dirDTO.setWh_dir_seq(newDirSeq);
		dirDTO.setWh_dir_name(newFolderName);
		dirDTO.setWh_dir_parent_seq(dirSeq);
		
		int result = newDirMake(dirDTO);
		
		return result;
	}
	
	
	
	
	
}
