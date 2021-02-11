package kh.gw.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.BizLogDAO;
import kh.gw.dto.Approval_typeDTO;
import kh.gw.dto.BizLog_periodDTO;
import kh.gw.dto.MemberDTO;

@Service
public class BizLogService {
	@Autowired
	private BizLogDAO bdao;

	@Autowired
	private HttpSession session;
	
	public List<MemberDTO> getMyDeptMem(){
		return bdao.getMyDeptMem((String)session.getAttribute("id"));
	}
	public List<Approval_typeDTO> getDocsType(){
		return bdao.getDocsType();
	}
    public int setPeriod(BizLog_periodDTO dto, int seq) {
		dto.setApp_seq(seq);
		return bdao.setPeriod(dto);
    }
	
}
