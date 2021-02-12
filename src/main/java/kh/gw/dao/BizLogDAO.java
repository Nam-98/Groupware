package kh.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.Approval_typeDTO;
import kh.gw.dto.BizLog_periodDTO;
import kh.gw.dto.MemberDTO;

@Repository
public class BizLogDAO {
	@Autowired
	private SqlSession db;
	public List<MemberDTO> getMyDeptMem(String id){
		return db.selectList("BizLog.getMyDeptMem", id);
	}
	public List<Approval_typeDTO> getDocsType(){
		return db.selectList("BizLog.getDocsType");
	}
	public int contentsUpdate(int biz_seq, String contents) {
		HashMap<String,Object> map = new HashMap();
		map.put("biz_contents", contents);
		map.put("biz_seq",biz_seq);
		return db.update("BizLog.contentsUpdate", map);
	}
	public int setPeriod(BizLog_periodDTO dto) {
		return db.insert("BizLog.setPeriod", dto);
	}
}
