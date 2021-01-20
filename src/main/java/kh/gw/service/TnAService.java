package kh.gw.service;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonObject;

import kh.gw.dao.TnADAO;
import kh.gw.dto.TnADTO;

public class TnAService {
	@Autowired
	private TnADAO tdao;
	
	public String isGoLeave(String id) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 HH:mm:ss");
		TnADTO dto = tdao.selectByID(id);
		JsonObject json = new JsonObject();
		if(dto.getTnA_start_time()==null) {
			//출근 전
			json.addProperty("status", "beforeOn");
			return json.toString();
		}else{
			if(dto.getTnA_end_time()==null) {
				//출근찍고 퇴근 전
				Date onwork = dto.getTnA_start_time();
				json.addProperty("status", "beforeLeave");
				json.addProperty("onWorkT", sdf.format(onwork));
				return json.toString();
			}else {
				//출근 및 퇴근 둘다 찍음
				Date onwork = dto.getTnA_start_time();
				Date leave = dto.getTnA_end_time();
				json.addProperty("status", "Leave");
				json.addProperty("onWorkT", sdf.format(onwork));
				json.addProperty("leaveWorkT", sdf.format(leave));
				return json.toString();
			}
		}
	}
}
