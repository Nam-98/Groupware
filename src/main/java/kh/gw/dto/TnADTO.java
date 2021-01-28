package kh.gw.dto;

import java.sql.Date;

public class TnADTO {
	private int TnA_seq;
	private String TnA_id;
	private Date TnA_start_time;
	private Date TnA_end_time;
	private int TnA_start_status_code;
	private int TnA_end_status_code;
	
	public TnADTO() {}
	public TnADTO(int tnA_seq, String tnA_id, Date tnA_start_time, Date tnA_end_time, int tnA_start_status_code,
			int tnA_end_status_code) {
		super();
		TnA_seq = tnA_seq;
		TnA_id = tnA_id;
		TnA_start_time = tnA_start_time;
		TnA_end_time = tnA_end_time;
		TnA_start_status_code = tnA_start_status_code;
		TnA_end_status_code = tnA_end_status_code;
	}
	public int getTnA_seq() {
		return TnA_seq;
	}
	public void setTnA_seq(int tnA_seq) {
		TnA_seq = tnA_seq;
	}
	public String getTnA_id() {
		return TnA_id;
	}
	public void setTnA_id(String tnA_id) {
		TnA_id = tnA_id;
	}
	public Date getTnA_start_time() {
		return TnA_start_time;
	}
	public void setTnA_start_time(Date tnA_start_time) {
		TnA_start_time = tnA_start_time;
	}
	public Date getTnA_end_time() {
		return TnA_end_time;
	}
	public void setTnA_end_time(Date tnA_end_time) {
		TnA_end_time = tnA_end_time;
	}
	public int getTnA_start_status_code() {
		return TnA_start_status_code;
	}
	public void setTnA_start_status_code(int tnA_start_status_code) {
		TnA_start_status_code = tnA_start_status_code;
	}
	public int getTnA_end_status_code() {
		return TnA_end_status_code;
	}
	public void setTnA_end_status_code(int tnA_end_status_code) {
		TnA_end_status_code = tnA_end_status_code;
	}
	
	
	

	
	
}
