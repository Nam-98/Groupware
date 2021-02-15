package kh.gw.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.Webhard_accessDTO;
import kh.gw.dto.Webhard_dirDTO;
import kh.gw.dto.Webhard_filesDTO;

@Repository
public class WebhardDAO {
	@Autowired
	private SqlSession db;
	
	// 해당 아이디로 된 개인 디렉토리가 있는지 조회
	public int personalDirIsExist(String sessionId) {
		return db.selectOne("Webhard.personalDirIsExist", sessionId);
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
	
	// 최상위 디렉토리 정보 가져오기
	public Map<String,Object> getTopDirInfo(String sessionId) {
		return db.selectOne("Webhard.getTopDirInfo", sessionId);
	}
	
	// 파일업로드
	public int uploadFile(Webhard_filesDTO fileDTO) {
		return db.insert("Webhard.uploadFile", fileDTO);
	}
}
