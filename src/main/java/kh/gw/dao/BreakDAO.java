package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.BreakDTO;
import kh.gw.dto.Break_typeDTO;

@Repository
public class BreakDAO {
	@Autowired
	private SqlSession db;
	
	public List<Break_typeDTO> getAllType(){
		return db.selectList("Break.getAllType");
	}
	
	public int insertBreak(BreakDTO dto) {
		return db.insert("Break.insertBreak", dto);
	}
	
	public double getDiscount(int break_code) {
		return db.selectOne("Break.getDiscount", break_code);
	}
	
	public int updateBreakType(Break_typeDTO dto) {
		return db.update("Break.updateBreakType", dto);
	}
	
	public int deleteBreakType(int break_code) {
		return db.delete("Break.deleteBreakType",break_code);
	}
	
	public int insertBreakType(Break_typeDTO dto) {
		return db.insert("Break.insertBreakType",dto);
	}
	
	public List<BreakDTO> loadHolidayList(String id){
		return db.selectList("Break.loadHolidayList",id);
	}
	
	public BreakDTO getBreakBySeq(int break_seq) {
		return db.selectOne("Break.getBreakBySeq",break_seq);
	}
	public int updateAccept(BreakDTO dto) {
		return db.update("Break.updateAccept", dto);
	}
}
