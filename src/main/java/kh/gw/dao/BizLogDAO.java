package kh.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.BizLogDTO;
import kh.gw.dto.BizLog_attached_filesDTO;
import kh.gw.dto.BizLog_signDTO;
import kh.gw.dto.BizLog_typeDTO;
import kh.gw.dto.MemberDTO;

@Repository
public class BizLogDAO {
	@Autowired
	private SqlSession db;
	public List<MemberDTO> getMyDeptMem(String id){
		return db.selectList("BizLog.getMyDeptMem", id);
	}
	public List<BizLog_typeDTO> getDocsType(){
		return db.selectList("BizLog.getDocsType");
	}
	public int writeBizlog(BizLogDTO dto) {
		return db.insert("BizLog.writeBizlog", dto);
	}
	public int getLatestSeqById(String id) {
		return db.selectOne("BizLog.getLatestSeqById", id);
	}
	public int setInitAppSign(BizLog_signDTO dto) {
		return db.insert("BizLog.setInitAppSign",dto);
	}
	public int insertAf(BizLog_attached_filesDTO dto) {
		return db.insert("BizLog.insertAF", dto);
	}
	public int contentsUpdate(int biz_seq, String contents) {
		HashMap<String,Object> map = new HashMap();
		map.put("biz_contents", contents);
		map.put("biz_seq",biz_seq);
		return db.update("BizLog.contentsUpdate", map);
	}
}
