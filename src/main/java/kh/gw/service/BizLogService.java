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
    public HashMap<String,Object> getMainList(String strDate) {
    	HashMap<String,Object> result = new HashMap<String, Object>();

    	//시간설정
    	int year = Integer.parseInt(strDate.split("-")[0]);
    	int month = Integer.parseInt(strDate.split("-")[1]);
    	LocalDate start = LocalDate.of(year, month, 1);
    	LocalDate end = start.plusMonths(1).minusDays(1);//start date의 말일 구함.
    	Date dStart = Date.valueOf(start);
    	Date dEnd = Date.valueOf(end);
    	
    	//weekList
    	List<ApprovalDTO> weekTemp =  bdao.getWeekList((String)session.getAttribute("id"),dStart,dEnd);
    	result.put("weekList", weekTemp);
    	if(weekTemp.size()==0) {
    		result.put("weekPeriod", null);
    	}else {
    		result.put("weekPeriod", bdao.getPeriod(this.getSeqList(weekTemp)));
    	}
    	//MonthList
    	List<ApprovalDTO> monTemp =  bdao.getMonList((String)session.getAttribute("id"),dStart,dEnd);
    	result.put("monList",  monTemp);
    	if(monTemp.size()==0) {
    		result.put("monPeriod", null);
    	}else {
    		result.put("monPeriod", bdao.getPeriod(this.getSeqList(monTemp)));
    	}
    	//DailyList
    	List<ApprovalDTO> dailyTemp =  bdao.getDailyList((String)session.getAttribute("id"),dStart,dEnd);
    	result.put("dailyList",  dailyTemp);
    	if(dailyTemp.size()==0) {
    		result.put("dailyPeriod", null);
    	}else {
    		result.put("dailyPeriod", bdao.getPeriod(this.getSeqList(dailyTemp)));
    	}
    	
    	System.out.println(result.size());
    	return result;
    }
    private List<Integer> getSeqList(List<ApprovalDTO> list){
    	List<Integer> result = new ArrayList<>();
    	for(ApprovalDTO dto : list) {
    		result.add(dto.getApp_seq());
    	}
    	return result;
    }
	
}
