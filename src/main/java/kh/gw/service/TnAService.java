package kh.gw.service;


import java.sql.Time;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.TnADAO;
import kh.gw.dto.TnA_StandardTimeDTO;
import kh.gw.dto.TnADTO;
import kh.gw.dto.TnA_objectionDTO;
import kh.gw.dto.TnA_statusDTO;
import kh.gw.statics.BoardConfigurator;



@Service
public class TnAService {
	@Autowired
	private TnADAO tdao;
	
	public Date getAttendanceDate(){
		// 변수에 지정한 기준시간을 parse
		Calendar cal = Calendar.getInstance();
		
		// 기준 시간 가져오기
		TnA_StandardTimeDTO sdto = tdao.tnaStandardTime(); 
		
		// 사용자가 지정한 HHmm을 substring으로 시간과 분을 구별한다. (당일조퇴기준지정)
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(sdto.getStandard_time_attendance().substring(0,2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(sdto.getStandard_time_attendance().substring(2,4)));
		cal.set(Calendar.SECOND, Integer.parseInt(sdto.getStandard_time_attendance().substring(4,6)));	
		Date attendanceDate = new Date(cal.getTimeInMillis());
		return attendanceDate;
	}
	public Date getEarlyLeaveWorkDate(){
		// 변수에 지정한 기준시간을 parse
		Calendar cal = Calendar.getInstance();
		
		// 기준 시간 가져오기
				TnA_StandardTimeDTO sdto = tdao.tnaStandardTime(); 
		
		// 사용자가 지정한 HHmm을 substring으로 시간과 분을 구별한다. (당일조퇴기준지정)
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(sdto.getStandard_time_leave().substring(0,2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(sdto.getStandard_time_leave().substring(2,4)));
		cal.set(Calendar.SECOND, Integer.parseInt(sdto.getStandard_time_leave().substring(4,6)));	
		Date earlyLeaveWorkDate = new Date(cal.getTimeInMillis());
		return earlyLeaveWorkDate;
	}
	public Date getLeaveWorkDate(){
		// 변수에 지정한 기준시간을 parse
		Calendar cal = Calendar.getInstance();
		
		// 기준 시간 가져오기
		TnA_StandardTimeDTO sdto = tdao.tnaStandardTime(); 
		
		// 사용자가 지정한 HHmm을 substring으로 시간과 분을 구별한다. (당일퇴근기준지정)
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(sdto.getStandard_time_night().substring(0,2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(sdto.getStandard_time_night().substring(2,4)));
		cal.set(Calendar.SECOND, Integer.parseInt(sdto.getStandard_time_night().substring(4,6)));
		Date leaveWorkDate = new Date(cal.getTimeInMillis());
		return leaveWorkDate;
	}

	
	// 출근시간 입력 프로세스
	public int attendanceInput(String sessionId) throws ParseException {
		TnADTO tdto = new TnADTO();
		tdto.setTna_id(sessionId);
		tdto.setTna_start_status_code(attendanceCheck());
		
		return tdao.attendanceInput(tdto);
	}
	
	// 출근 기준시간과 현재시간 비교 후 코드 값 리턴
	public int attendanceCheck() throws ParseException {
		
        // 현재시간 가져옴
        Time nowDate = new Time(System.currentTimeMillis());
        
        // 출근시간이 출근기준시간보다 늦은경우(지각처리),
        if(nowDate.after(getAttendanceDate())) {
           return 3;
        // 출근시간이 출근기준시간보다 이르거나 같은경우(정상출근),
        }else {
           return 2;
        }
	}
	
	// 퇴근시간 입력 프로세스
	public int leaveWorkInput(String sessionId) throws ParseException {
		
		int seq = getTnaSeq(sessionId);
		
		TnADTO tdto = new TnADTO();
		tdto.setTna_id(sessionId);
		tdto.setTna_end_status_code(leaveWorkCheck());
		tdto.setTna_seq(seq);
		
		return tdao.leaveWorkInput(tdto);
	}
	
	// 퇴근 기준시간과 현재시간 비교 후 코드 값 리턴
	public int leaveWorkCheck() throws ParseException {
		
		// 현재날짜시간 가져옴
		Date nowDate = new Date(System.currentTimeMillis());
		
//		System.out.println("현재시간 : "+ nowDate);
//		System.out.println("조퇴기준시간 : "+ earlyLeaveWorkDate);
//		System.out.println("정상퇴근시간 : "+ leaveWorkDate);
//		
//		if(nowDate.before(earlyLeaveWorkDate)) {
//			System.out.println("현재시간이 조퇴기준시간보다 이전임");
//		}
//		if(nowDate.after(earlyLeaveWorkDate)) {
//			System.out.println("현재시간이 조퇴기준시간보다 이후임");
//		}
//		if(leaveWorkDate.after(nowDate)) {
//			System.out.println("현재시간이 야근기준시간보다 전임");
//		}
		
		// 조퇴시간보다는 빠르면서, 야근시간보다는 이전(정상퇴근)
		if((nowDate.after(getEarlyLeaveWorkDate())) && (nowDate.before(getLeaveWorkDate()))) {
			return 9;
		// 정상퇴근[18:00~19:00] 이전시간에 퇴근(조퇴)
		}else if(nowDate.before(getEarlyLeaveWorkDate())) {
			return 8;
		// 정상퇴근[18:00~19:00] 이후시간에 퇴근(야근)
		}else {
			return 10;
		}
	}
	
	// 현재날짜와 출근날짜가 일치하는 seq 번호 가져오기
	public int getTnaSeq(String sessionId) {
		return tdao.getTnaSeq(sessionId);
	}
	
	// 출근시간 조회시 시간 출력
	public Map<String, Object> getAttendanceTime(String sessionId) {
		Date sqlDate = tdao.getAttendanceTime(sessionId);
		
		Map<String, Object> param = new HashMap<>();
		
		if (sqlDate == null) {
			param.put("status", "-");
//			System.out.println(param.get("status"));
		}else if(sqlDate.before(getAttendanceDate())) {
			param.put("status", "출근");
			param.put("hour", sqlDate.getHours());
			param.put("minute", sqlDate.getMinutes());
//			System.out.println(param.get("status"));
//			System.out.println(param.get("hour"));
//			System.out.println(param.get("minute"));
		}else {
		// (sqlDate.after(getAttendanceDate()))
			param.put("status", "지각");
			param.put("hour", sqlDate.getHours());
			param.put("minute", sqlDate.getMinutes());
//			System.out.println(param.get("status"));
//			System.out.println(param.get("hour"));
//			System.out.println(param.get("minute"));
		}
		return param;
	}
	
	// 퇴근시간 조회시 시간 출력
	public Map<String, Object> getLeaveWorkTime(String sessionId) {
		Date sqlDate = tdao.getLeaveWorkTime(sessionId);
		
		Map<String, Object> param = new HashMap();
		
		if (sqlDate == null) {
			param.put("status", "-");
//			System.out.println(param.get("status"));
		}else if (sqlDate.before(getEarlyLeaveWorkDate())) {
			param.put("status", "조퇴");
			param.put("hour", sqlDate.getHours());
			param.put("minute", sqlDate.getMinutes());
//			System.out.println(param.get("status"));
//			System.out.println(param.get("hour"));
//			System.out.println(param.get("minute"));
		}else if (((sqlDate.after(getEarlyLeaveWorkDate())) && (sqlDate.before(getLeaveWorkDate())))) {
			// (sqlDate.after(getAttendanceDate()))
			param.put("status", "퇴근");
			param.put("hour", sqlDate.getHours());
			param.put("minute", sqlDate.getMinutes());
//			System.out.println(param.get("status"));
//			System.out.println(param.get("hour"));
//			System.out.println(param.get("minute"));
		}else {
			param.put("status", "야근");
			param.put("hour", sqlDate.getHours());
			param.put("minute", sqlDate.getMinutes());
		}
		return param;
	}
	
	public List<Map<String, Object>> getTnaCalendarList(String sessionId) {
		List<Map<String, Object>> result =  tdao.getTnaCalendarList(sessionId);
		System.out.println("=====service다!!==="+result.size());
		 return result;
	}
	
	public Map<String, Object> getTnaCalendarValue(String sessionId, int tna_seq) {
		Map<String, Object> param = new HashMap();
		
		param.put("sessionId", sessionId);
		param.put("tna_seq", tna_seq);
			
		return tdao.getTnaCalendarValue(param);
	}
	
	public List<TnA_statusDTO> getTnaStatusList() {
		return tdao.getTnaStatusList();
	}
	
	public int tnaFixRequestInput(TnA_objectionDTO dto, String sessionId) {
		dto.setTna_obj_id(sessionId);
		dto.setTna_obj_proc_status_code(1);
		return tdao.tnaFixRequestInput(dto);
	}
	
	public Map<String, Object> tnaCheckOverlap(int tna_seq, String tna_status) {
		TnA_objectionDTO dto = new TnA_objectionDTO();
		dto.setTna_seq(tna_seq);
		dto.setTna_obj_status(tna_status);
		return tdao.tnaCheckOverlap(dto);
	}
	
	public List<Map<String, Object>> getTnaStartCountList(String sessionId, String selectYearValue) {
		return tdao.getTnaStartCountList(sessionId,selectYearValue);
	}
	
	public List<Map<String, Object>> getTnaStartCountSumList(String sessionId, String selectYearValue) {
		return tdao.getTnaStartCountSumList(sessionId,selectYearValue);
	}
	
	public List<Map<String, Object>> getTnaEndCountList(String sessionId, String selectYearValue) {
		return tdao.getTnaEndCountList(sessionId,selectYearValue);
	}
	
	public List<Map<String, Object>> getTnaEndCountSumList(String sessionId, String selectYearValue) {
		return tdao.getTnaEndCountSumList(sessionId,selectYearValue);
	}
	
	public List<Map<String, Object>> getTnaSelectYearList(String sessionId) {
		return tdao.getTnaSelectYearList(sessionId);
	}
	
	public String yearVerify(String selectYearValue) {
		if (selectYearValue == null) {
			// 현재시간 가져옴
			Date nowDate = new Date(System.currentTimeMillis());
			selectYearValue = (nowDate.getYear()+1900) + "";
		}
		return selectYearValue;
	}
	
	public String cpageVerify(String cpage) {
		if (cpage == null) {
			// 현재시간 가져옴
			cpage = 1 + "";
		}
		return cpage;
	}
	
	public List<Map<String, Object>> getTnaFixRequestList(String sessionId, int cpage) {
		return tdao.getTnaFixRequestList(sessionId, cpage);
	}
	
	// 네비게이터 메서드
	public String getTnaFixRequestNavi(String sessionId, int cpage) {
		int recordTotalCount = tdao.getTnaFixRequestListAll(sessionId).size();

		// 총 페이지의 개수
		int pageTotalCount;
		if (recordTotalCount % BoardConfigurator.RECORD_COUNT_PER_PAGE > 0) {
			pageTotalCount = recordTotalCount / BoardConfigurator.RECORD_COUNT_PER_PAGE + 1;
		}else {
			pageTotalCount = recordTotalCount / BoardConfigurator.RECORD_COUNT_PER_PAGE;
		}
		
		// 보안처리코드 (가능한페이지가 아닌 음수,초과하는 페이지의 경우 처리)
		if (cpage < 1) {
			cpage = 1;
		}else if (cpage > pageTotalCount){
			cpage = pageTotalCount;
		}
		
		
		// 페이지 목록 도출
		
		// 현재페이지의 가장 앞에 들어가야 할 값을 도출하기 위해서 한페이지에 나타나는 개수로 나눠서 시작값을 뽑고 다시 곱해서 자리를 복귀한뒤 +1
		// 단, 가장 마지막 페이지는 다음 페이지로 밀려나므로 한자리씩 당기기 위해 시작할때 현재페이지 -1을 한다
		int startNavi = (cpage-1) / BoardConfigurator.NAVI_COUNT_PER_PAGE * BoardConfigurator.NAVI_COUNT_PER_PAGE + 1;
		
		// 마지막 페이지값 보정
		int endNavi = startNavi + (BoardConfigurator.NAVI_COUNT_PER_PAGE - 1);
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		// 다음페이지로 가기 보정 < > (가장 앞과 뒤의 경우 존재하지 않도록)
		boolean needPrev = true;
		boolean needNext = true;
		
		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		
		//StringBuilder 스트링 값 연결해서 한번에 뽑아내기
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
//			sb.append("<a href='/mypage/bookmarkWindow.mypage?cpage="+(startNavi-1) +"&search="+search+ "&option="+option+"'>< </a>");
			sb.append("<a href='/tna/tnaFixHistoryPage.tna?cpage="+(startNavi-1)+"'> < </a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
//			sb.append("<a href='/mypage/bookmarkWindow.mypage?cpage="+i+"&search="+search+ "&option="+option+"'>" + i + " </a>");
			sb.append("<a href='/tna/tnaFixHistoryPage.tna?cpage="+i+"'>" + i + " </a>");
		}
		if(needNext) {
//			sb.append("<a href='/mypage/bookmarkWindow.mypage?cpage="+(endNavi+1) +"&search="+search+ "&option="+option+"'> > </a>");
			sb.append("<a href='/tna/tnaFixHistoryPage.tna?cpage="+(endNavi+1)+"'> > </a>");
		}
		
		
		
		return sb.toString();
	}
	
	//근태조정신청 list(관리자)
	public List<Map<String, Object>> tnaHistory() throws Exception{
		return tdao.tnaHistory();
	}
	
	//근태 승인(출근용)
	public int tnaStartApp(int tnaSeq, int finalChange) throws Exception {
		return tdao.tnaStartApp(tnaSeq,finalChange);
	}
	//근태 승인(퇴근용)
	public int tnaEndApp(int tnaSeq, int finalChange) throws Exception {		
		return tdao.tnaEndApp(tnaSeq,finalChange);
	}
	//근태 승인(정정처리결과)
	public int objApproval(int objSeq, int statusCode) throws Exception {
		return tdao.objApproval(objSeq,statusCode);
	}
	
	//근태 수정 요청
	public int tnaReFixSubmit(String sessionId, int tna_seq, String tna_obj_status, int tna_obj_changed_code,
			String tna_obj_reason) throws Exception {
		return tdao.tnaReFixSubmit(sessionId,tna_seq,tna_obj_status,tna_obj_changed_code,tna_obj_reason);
	}
	
	//출퇴근 기준 시간 가져오기.
	public TnA_StandardTimeDTO tnaStandardTime() throws Exception{
		return tdao.tnaStandardTime();
	}
	
	//출퇴근 기준 시간 변경
	public int tnaUpdateTime(String att_time, String lea_time, String nig_time) throws Exception {
		return tdao.tnaUpdateTime(att_time,lea_time,nig_time);
	}
	
	
	
	
	

	
}
