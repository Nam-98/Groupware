package kh.gw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession db;
	
	public int loginCheck(MemberDTO dto) throws Exception{
		String resultId = db.selectOne("Member.loginCheck",dto);
		if(resultId!=null) {return 1;}
		else return 0;
	}
	
	public MemberDTO getMemInfo(String id) throws Exception{
		return db.selectOne("Member.getMemInfo",id);
	}
}
