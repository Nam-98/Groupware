package kh.gw.dao;

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

}
