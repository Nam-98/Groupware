package kh.gw.service;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.BizLogDAO;
import kh.gw.dto.ApprovalDTO;
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
    public int setPeriod(int seq, String bpStart, String bpEnd) {
    	Date biz_periodstart = java.sql.Date.valueOf(bpStart);
    	Date biz_periodend = java.sql.Date.valueOf(bpEnd);
    	BizLog_periodDTO dto = new BizLog_periodDTO(seq, biz_periodstart, biz_periodend);
		return bdao.setPeriod(dto);
    }
    public List<HashMap<String,Object>> getMainList(String strDate) {
    	List<HashMap<String,Object>> result = new ArrayList<HashMap<String,Object>>();
    	HashMap<String,Object> temp = new HashMap<String, Object>();
    	int year = Integer.parseInt(strDate.split("-")[0]);
    	int month = Integer.parseInt(strDate.split("-")[1]);
    	LocalDate start = LocalDate.of(year, month, 1);
    	LocalDate end = start.plusMonths(1).minusDays(1);//start date의 말일 구함.
    	Date dStart = Date.valueOf(start);
    	Date dEnd = Date.valueOf(end);
    	
    	//weekList
    	temp.put("weekList",  bdao.getWeekList((String)session.getAttribute("id"),dStart,dEnd));
    	result.add(temp);
    	//temp.put("weekPeriod", );
    	bdao.getMonDailyList((String)session.getAttribute("id"),dStart,dEnd);
    	return result;
    }
	
}
