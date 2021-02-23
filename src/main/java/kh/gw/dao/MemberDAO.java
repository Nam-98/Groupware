package kh.gw.dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession db;
	
	public String loginCheck(MemberDTO dto) throws Exception{
		return db.selectOne("Member.loginCheck",dto);
	}
	
	public MemberDTO getMemInfo(String id) throws Exception{
		return db.selectOne("Member.getMemInfo",id);
	}
	
	public List<MemberDTO> listMem() throws Exception{
		return db.selectList("Member.listMem");
	}
	
	public List<DepartmentDTO> listDept() throws Exception{
		return db.selectList("Member.listDept");
	}
	public Map<String,Object> getMyInfo(String id) throws Exception{
		return db.selectOne("Member.getMyInfo",id);
	}
	public int insertMem(MemberDTO dto) throws Exception{
		return db.insert("Member.insertMem", dto);
	}
	public int updateMemInfo(MemberDTO dto) throws Exception{
		return db.update("Member.updateMemInfo", dto);
	}
	public int updatePw(String id, String newpw) throws IOException {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("newpw", newpw);
		return db.update("Member.updatePw",param);
	}
	public int updateBreakUseCount(String id, double break_use_count) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("break_use_count", break_use_count);
		return db.update("Member.updateBreakUseCount", param);
	}
}
