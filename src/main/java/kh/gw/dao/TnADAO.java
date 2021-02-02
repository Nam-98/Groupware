package kh.gw.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.TnADTO;
import kh.gw.dto.TnA_statusDTO;

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
	
	public Date getAttendanceTime(String sessionId) {
		return db.selectOne("TnA.getAttendanceTime",sessionId);
	}
	
	public Date getLeaveWorkTime(String sessionId) {
		return db.selectOne("TnA.getLeaveWorkTime",sessionId);
	}
	
	public List<Map<String, Object>> getTnaCalendarList(String sessionId) {
		return db.selectList("TnA.getTnaCalendarList", sessionId);
	}
	
	public Map<String, Object> getTnaCalendarValue(Map<String, Object> param) {
		return db.selectOne("TnA.getTnaCalendarValue", param);
	}
	
	public List<TnA_statusDTO> getTnaStatusList() {
		return db.selectList("TnA.getTnaStatusList");
	}
	
	
	
}
