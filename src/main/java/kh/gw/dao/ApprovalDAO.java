package kh.gw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ApprovalDTO;
import kh.gw.dto.Approval_attached_filesDTO;
import kh.gw.dto.Approval_commentsDTO;
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
	public List<ApprovalDTO> allMyWriteApp(String id){
		return db.selectList("Approval.allMyWriteApp", id);
	}
	public List<Approval_signDTO> allMySignApp(String id){
		return db.selectList("Approval.allMySignApp", id);
	}
	public ApprovalDTO searchApp(int app_seq) {
		return db.selectOne("Approval.searchApp", app_seq);
	}
	public List<ApprovalDTO> getAppByCpage(List<Integer> seqList,int startnum,int endnum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("seqList", seqList);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		return db.selectList("Approval.getAppByCpage", map);
	}
	public int isSignTurn(int order, int app_seq) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("order", order);
		map.put("app_seq", app_seq);
		return db.selectOne("Approval.isSignTurn",map);
	}
	public int countAgree(int order, int seq) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("order", order);
		map.put("app_seq", seq);
		return db.selectOne("Approval.countAgree",map);
	}
	public List<Integer> allMyCCList(String id){
		return db.selectList("Approval.allMyCCList", id);
	}
	public ApprovalDTO getAppBySeq(int app_seq) {
		return db.selectOne("Approval.getAppBySeq", app_seq);
	}
	public List<Approval_signDTO> getAppSignBySeq(int app_seq) {
		return db.selectList("Approval.getAppSignBySeq",app_seq);
	}
	public List<Approval_attached_filesDTO> getAppFileBySeq(int app_seq){
		return db.selectList("Approval.getAppFileBySeq",app_seq);
	}
	public List<Approval_commentsDTO> getAppCmtBySeq(int app_seq){
		return db.selectList("Approval.getAppCmtBySeq", app_seq);
	}
	public int contentsUpdate(int app_seq, String fileName) {
		HashMap<String, Object> map = new HashMap();
		map.put("fileName", fileName);
		map.put("app_seq", app_seq);
		return db.update("Approval.contentsUpdate", map);
	}
}
