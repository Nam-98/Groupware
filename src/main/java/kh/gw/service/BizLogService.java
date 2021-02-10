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
    public int insertPeriod(BizLog_periodDTO dto, int seq, int app_type_code) {
		//biz_period 맞춰서 넣기
		if(app_type_code==7) {
			dto.getBiz_period_start();
		}else if(app_type_code==8) {
			
		}else if(app_type_code==9) {
			
		}else {return -1;}
    	return -1;
    }
	
}
