package kh.gw.dto;

import java.sql.Date;

public class ProjectDTO {
	private int pro_seq;
	private String pro_title;
	private Date pro_start_date;
	private Date pro_end_date;
	private String pro_id;
	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	public String getPro_title() {
		return pro_title;
	}
	public void setPro_title(String pro_title) {
		this.pro_title = pro_title;
	}
	public Date getPro_start_date() {
		return pro_start_date;
	}
	public void setPro_start_date(Date pro_start_date) {
		this.pro_start_date = pro_start_date;
	}
	public Date getPro_end_date() {
		return pro_end_date;
	}
	public void setPro_end_date(Date pro_end_date) {
		this.pro_end_date = pro_end_date;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public ProjectDTO() {
	}
	public ProjectDTO(int pro_seq, String pro_title, Date pro_start_date, Date pro_end_date, String pro_id) {
		this.pro_seq = pro_seq;
		this.pro_title = pro_title;
		this.pro_start_date = pro_start_date;
		this.pro_end_date = pro_end_date;
		this.pro_id = pro_id;
	}

	
	
}
