package kh.gw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.TnADTO;

@Repository
public class TnADAO {
	
	@Autowired
	private SqlSession db;
	
	public TnADTO selectByID(String id) {
		return db.selectOne("selectByID",id);
	}
	
	public int attendanceInput(TnADTO tdto) {
		return db.insert("TnA.attendanceInput",tdto);
	}
	
	public int leaveWorkInput(TnADTO tdto) {
		return db.update("TnA.leaveWorkInput",tdto);
	}
	
	public int getTnaSeq(String sessionId) {
		return db.selectOne("TnA.getTnaSeq", sessionId);
	}
	
}
