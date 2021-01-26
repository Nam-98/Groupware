package kh.gw.service;


import java.sql.Time;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.TnADAO;
import kh.gw.dto.TnADTO;
import kh.gw.statics.TnAConfigurator;


@Service
public class TnAService {
	@Autowired
	private TnADAO tdao;
	
	public Date getAttendanceDate() {
		// 변수에 지정한 기준시간을 parse
		Calendar cal = Calendar.getInstance();
		// 사용자가 지정한 HHmm을 substring으로 시간과 분을 구별한다. (당일조퇴기준지정)
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(TnAConfigurator.ATTENDANCE_STANDARD.substring(0,2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(TnAConfigurator.ATTENDANCE_STANDARD.substring(2,4)));
		cal.set(Calendar.SECOND, Integer.parseInt(TnAConfigurator.ATTENDANCE_STANDARD.substring(4,6)));	
		Date attendanceDate = new Date(cal.getTimeInMillis());
		return attendanceDate;
	}
	public Date getEarlyLeaveWorkDate() {
		// 변수에 지정한 기준시간을 parse
		Calendar cal = Calendar.getInstance();
		// 사용자가 지정한 HHmm을 substring으로 시간과 분을 구별한다. (당일조퇴기준지정)
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(TnAConfigurator.EARLYLEAVEWORK_STANDARD.substring(0,2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(TnAConfigurator.EARLYLEAVEWORK_STANDARD.substring(2,4)));
		cal.set(Calendar.SECOND, Integer.parseInt(TnAConfigurator.EARLYLEAVEWORK_STANDARD.substring(4,6)));	
		Date earlyLeaveWorkDate = new Date(cal.getTimeInMillis());
		return earlyLeaveWorkDate;
	}
	public Date getLeaveWorkDate() {
		// 변수에 지정한 기준시간을 parse
		Calendar cal = Calendar.getInstance();
		// 사용자가 지정한 HHmm을 substring으로 시간과 분을 구별한다. (당일퇴근기준지정)
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(TnAConfigurator.LEAVEWORK_STANDARD.substring(0,2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(TnAConfigurator.LEAVEWORK_STANDARD.substring(2,4)));
		cal.set(Calendar.SECOND, Integer.parseInt(TnAConfigurator.LEAVEWORK_STANDARD.substring(4,6)));
		Date leaveWorkDate = new Date(cal.getTimeInMillis());
		return leaveWorkDate;
	}

	// 출근시간 입력 프로세스
	public int attendanceInput(String sessionId) throws ParseException {
		TnADTO tdto = new TnADTO();
		tdto.setTnA_id(sessionId);
		tdto.setTnA_status_code(attendanceCheck());
		
		return tdao.attendanceInput(tdto);
	}
	
	// 출근 기준시간과 현재시간 비교 후 코드 값 리턴
	public int attendanceCheck() throws ParseException {
		
        // 현재시간 가져옴
        Time nowDate = new Time(System.currentTimeMillis());
        
        // 출근시간이 출근기준시간보다 늦은경우(지각처리),
        if(nowDate.after(getAttendanceDate())) {
           return 0;
        // 출근시간이 출근기준시간보다 이르거나 같은경우(정상출근),
        }else {
           return 2;
        }
	}
	
	// 퇴근시간 입력 프로세스
	public int leaveWorkInput(String sessionId) throws ParseException {
		
		int seq = getTnaSeq(sessionId);
		
		TnADTO tdto = new TnADTO();
		tdto.setTnA_id(sessionId);
		tdto.setTnA_status_code(leaveWorkCheck());
		tdto.setTnA_seq(seq);
		
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
			return 4;
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
	
	public String getCurrentTime() {
		Date nowDate = new Date(System.currentTimeMillis());
		
		return "";
	}

	
}
