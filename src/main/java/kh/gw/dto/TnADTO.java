package kh.gw.dto;

import java.sql.Date;

public class TnADTO {
	private int tna_seq;
	private String tna_id;
	private Date tna_start_time;
	private Date tna_end_time;
	private int tna_start_status_code;
	private int tna_end_status_code;
	
	public TnADTO() {}
	public TnADTO(int tna_seq, String tna_id, Date tna_start_time, Date tna_end_time, int tna_start_status_code,
			int tna_end_status_code) {
		super();
		this.tna_seq = tna_seq;
		this.tna_id = tna_id;
		this.tna_start_time = tna_start_time;
		this.tna_end_time = tna_end_time;
		this.tna_start_status_code = tna_start_status_code;
		this.tna_end_status_code = tna_end_status_code;
	}
	public int getTna_seq() {
		return tna_seq;
	}
	public void setTna_seq(int tna_seq) {
		this.tna_seq = tna_seq;
	}
	public String getTna_id() {
		return tna_id;
	}
	public void setTna_id(String tna_id) {
		this.tna_id = tna_id;
	}
	public Date getTna_start_time() {
		return tna_start_time;
	}
	public void setTna_start_time(Date tna_start_time) {
		this.tna_start_time = tna_start_time;
	}
	public Date getTna_end_time() {
		return tna_end_time;
	}
	public void setTna_end_time(Date tna_end_time) {
		this.tna_end_time = tna_end_time;
	}
	public int getTna_start_status_code() {
		return tna_start_status_code;
	}
	public void setTna_start_status_code(int tna_start_status_code) {
		this.tna_start_status_code = tna_start_status_code;
	}
	public int getTna_end_status_code() {
		return tna_end_status_code;
	}
	public void setTna_end_status_code(int tna_end_status_code) {
		this.tna_end_status_code = tna_end_status_code;
	}
	
	
	
	

	
	
}
