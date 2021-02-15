package kh.gw.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.Webhard_accessDTO;
import kh.gw.dto.Webhard_dirDTO;

@Repository
public class WebhardDAO {
	@Autowired
	private SqlSession db;
	
	public int personalDirIsExist(String sessionId) {
		return db.selectOne("Webhard.personalDirIsExist", sessionId);
	}
	
	public int newDirMake(Webhard_dirDTO dirDTO) {
		return db.insert("Webhard.newDirMake", dirDTO);
	}
	
	public int newDirSeqGet() {
		return db.selectOne("Webhard.newDirSeqGet");
	}
	
	public int dirAssign(Webhard_accessDTO accDTO) {
		return db.insert("Webhard.dirAssign", accDTO);
	}
	
	public Map<String,Object> getTopDirInfo(String sessionId) {
		return db.selectOne("webhard.getTopDirInfo", sessionId);
	}
}
