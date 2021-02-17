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
	
	public int insertBreak(BreakDTO dto, ApprovalDTO adto) {
		double break_discount = bdao.getDiscount(dto.getBreak_code());
		dto.setBreak_id((String) session.getAttribute("id"));
		dto.setBreak_discount(break_discount);
		dto.setBreak_reason(adto.getApp_contents());
		return bdao.insertBreak(dto);
	}
	
	public void updateBreakType(List<Break_typeDTO> list) {
		for(Break_typeDTO dto : list) {
		bdao.updateBreakType(dto);
		}
	}
}
