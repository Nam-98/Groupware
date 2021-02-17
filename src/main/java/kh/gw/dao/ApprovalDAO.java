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
import kh.gw.dto.Approval_statusDTO;
import kh.gw.dto.Approval_typeDTO;

@Repository
public class ApprovalDAO {
	@Autowired
	private SqlSession db;
	
	public List<Approval_typeDTO> appDocsType() {
		return db.selectList("Approval.appDocsType");
	}
	public List<Approval_typeDTO> nxAllDocsType() {
		return db.selectList("Approval.nxAllDocsType");
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
	public int countBefAgree(int order, int seq) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("order", order);
		map.put("app_seq", seq);
		return db.selectOne("Approval.countBefAgree",map);
	}
	public int countAgree(int seq) {
		return db.selectOne("Approval.countAgree",seq);
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
	public int updateSign(Approval_signDTO dto) {
		return db.update("Approval.updateSign",dto);
	}
	public List<Approval_signDTO> getMySignApp(String id){
		return db.selectList("Approval.getMySignApp", id);
	}
	public List<Integer> confirmReject(List<Integer> confirmList){
		HashMap<String, Object> map = new HashMap();
		map.put("confirmList",confirmList);
		return db.selectList("Approval.confirmReject", map);
	}
	public List<Approval_signDTO> getTobeSignApp(String id){
		return db.selectList("Approval.getTobeSignApp", id);
	}
	public int countMySignedApp(String id){
		return db.selectOne("Approval.countMySignedApp", id);
	}
	public int countTobeSignApp(String id){
		return db.selectOne("Approval.countTobeSignApp", id);
	}
	public int writeCmt(Approval_commentsDTO dto) {
		System.out.println(dto.getApp_cmt_writer());
		return db.insert("Approval.writeCmt",dto);
	}
	public int delAppCmtBySeq(int app_cmt_seq) {
		return db.update("Approval.delAppCmtBySeq", app_cmt_seq);
	}
	public int countMyCCList(String id) {
		return db.selectOne("Approval.countMyCCList", id);
	}
	public int updateAppStatus(int app_status_code, int app_seq) {
		HashMap<String, Object> map = new HashMap();
		map.put("app_status_code", app_status_code);
		map.put("app_seq", app_seq);
		return db.update("Approval.updateAppStatus", map);
	}
	public int totalSign(int app_seq) {
		return db.selectOne("Approval.totalSign", app_seq);
	}
	public List<ApprovalDTO> getAppForMainWrite(String id, int max){
		HashMap<String, Object> map = new HashMap();
		map.put("id", id);
		map.put("max", max);
		return db.selectList("Approval.getAppForMainWrite", map);
	}
	public List<ApprovalDTO> getAppForMainCC(String id){
		return db.selectList("Approval.getAppForMainCC", id);
	}
	public int getAppCountToday() {
		return db.selectOne("Approval.getAppCountToday");
	}
	public String getDocsTemplate(int app_type_code) {
		return db.selectOne("Approval.getDocsTemplate", app_type_code);
	}
	///nexa cud관련 method
	public int nxInsertDocs(Approval_typeDTO dto) {
		return db.insert("Approval.nxInsertDocs", dto);
	}
	public int nxDeleteDocs(int app_type_code) {
		return db.delete("Approval.nxDeleteDocs", app_type_code);
	}
	public int nxUpdateDocs(Approval_typeDTO dto) {
		return db.update("Approval.nxUpdateDocs", dto);
	}
	public List<ApprovalDTO> nxAppAllList(){
		return db.selectList("Approval.nxAppAllList");
	}
	public List<Approval_statusDTO> nxAppStatusList(){
		return db.selectList("Approval.nxAppStatusList");
	}
}
