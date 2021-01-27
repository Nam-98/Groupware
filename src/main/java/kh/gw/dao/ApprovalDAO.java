package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ApprovalDTO;
import kh.gw.dto.Approval_attached_filesDTO;
import kh.gw.dto.Approval_signDTO;
import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.Approval_typeDTO;

@Repository
public class ApprovalDAO {
	@Autowired
	private SqlSession db;
	
	public List<Approval_typeDTO> allDocsType() {
		return db.selectList("Approval.allDocsType");
	}
	public List<Approval_sign_typeDTO> allSignType(){
		return db.selectList("Approval.allSignType");
	}
	public int writeApp(ApprovalDTO dto) {
		return db.insert("Approval.writeApp", dto);
	}
	public int setInitAppSign(Approval_signDTO dto) {
		return db.insert("Approval.setInitAppSign", dto);
	}
	public int getLatestSeqById(String id) {
		return db.selectOne("Approval.getLatestSeqById",id);
	}
	public int insertAf(Approval_attached_filesDTO dto) {
		return db.insert("Approval.insertAf", dto);
	}
}
