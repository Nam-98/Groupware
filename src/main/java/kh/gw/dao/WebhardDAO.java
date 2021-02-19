package kh.gw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;
import kh.gw.dto.Webhard_accessDTO;
import kh.gw.dto.Webhard_dirDTO;
import kh.gw.dto.Webhard_filesDTO;

@Repository
public class WebhardDAO {
	@Autowired
	private SqlSession db;
	
	// 해당 아이디로 된 개인 디렉토리가 있는지 조회
	public int personalDirIsExist(Webhard_accessDTO accDTO) {
		return db.selectOne("Webhard.personalDirIsExist", accDTO);
	}
	
	// 해당 아이디로 된 공용 디렉토리가 있는지 조회
	public int commonDirIsExist(Webhard_accessDTO accDTO) {
		return db.selectOne("Webhard.commonDirIsExist", accDTO);
	}
	
	// 해당 아이디, 해당 부서코드로 된 부서 디렉토리가 있는지 조회
	public int departmentDirIsExist(Webhard_accessDTO accDTO) {
		return db.selectOne("Webhard.departmentDirIsExist", accDTO);
	}
	
	// 새로운 디렉토리 생성
	public int newDirMake(Webhard_dirDTO dirDTO) {
		return db.insert("Webhard.newDirMake", dirDTO);
	}
	
	// 새로운 디렉토리 seq값 선점
	public int newDirSeqGet() {
		return db.selectOne("Webhard.newDirSeqGet");
	}
	
	// 디렉토리를 아이디에 배정
	public int dirAssign(Webhard_accessDTO accDTO) {
		return db.insert("Webhard.dirAssign", accDTO);
	}
	
	// 개인 최상위 디렉토리 정보 가져오기
	public Map<String,Object> getTopDirInfo(Webhard_accessDTO accDTO) {
		return db.selectOne("Webhard.getTopDirInfo", accDTO);
	}
	
	// 공용 최상위 디렉토리 정보 가져오기
	public Map<String,Object> getTopCommonDirInfo(Webhard_accessDTO accDTO) {
		return db.selectOne("Webhard.getTopCommonDirInfo", accDTO);
	}
	
	// 부서 최상위 디렉토리 정보 가져오기
	public Map<String,Object> getTopDepartmentDirInfo(Webhard_accessDTO accDTO) {
		return db.selectOne("Webhard.getTopDepartmentDirInfo", accDTO);
	}
	
	// 파일업로드
	public int uploadFile(Webhard_filesDTO fileDTO) {
		return db.insert("Webhard.uploadFile", fileDTO);
	}
	
	// 해당 디렉토리의 파일 리스트 가져오기
	public List<Webhard_filesDTO> getDirFileList(int dirSeq) {
		return db.selectList("Webhard.getDirFileList", dirSeq);
	}
	
	// 해당 디렉토리의 폴더 리스트 가져오기
	public List<Webhard_dirDTO> getDirFolderList(int dirSeq) {
		return db.selectList("Webhard.getDirFolderList", dirSeq);
	}
	
	// 해당 아이디의 정보 가져오기
	public MemberDTO idInfomationGet(String sessionId) {
		return db.selectOne("Webhard.idInfomationGet", sessionId);
	}
	
	// 해당 부서코드의 정보 가져오기
	public DepartmentDTO deptInfomationGet(int deptCode) {
		return db.selectOne("Webhard.deptInfomationGet", deptCode);
	}

}
