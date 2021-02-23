package kh.gw.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.BreakDAO;
import kh.gw.dto.ApprovalDTO;
import kh.gw.dto.BreakDTO;
import kh.gw.dto.Break_typeDTO;

@Service
public class BreakService {
	@Autowired
	private BreakDAO bdao;
	@Autowired
	private HttpSession session;
	
	public List<Break_typeDTO> getAllType(){
		return bdao.getAllType();
	}
	
	public int insertBreak(BreakDTO dto, ApprovalDTO adto,int app_seq) {
		double break_discount = bdao.getDiscount(dto.getBreak_code());
		dto.setBreak_id((String) session.getAttribute("id"));
		dto.setBreak_discount(break_discount);
		dto.setBreak_reason(adto.getApp_contents());
		dto.setApp_seq(app_seq);
		return bdao.insertBreak(dto);
	}
	
	public void updateBreakType(Break_typeDTO dto) {
		bdao.updateBreakType(dto);
	}
	
	public void deleteBreakType(int break_code) {
		bdao.deleteBreakType(break_code);
	}
	
	public void insertBreakType(Break_typeDTO dto) {
		bdao.insertBreakType(dto);
	}
	
	public List<BreakDTO> loadHolidayList(String id){
		return bdao.loadHolidayList(id);
	}
	
}
