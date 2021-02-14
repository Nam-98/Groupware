package kh.gw.dto;

import java.util.Date;

public class ScheduleDTO {
	private int sch_seq;
	private String sch_title;
	private String sch_contents;
	private Date sch_start_date;
	private Date sch_end_date;
	private String sch_type;
	private String sch_id;
	private String sch_start_date_sc;
	private String sch_end_date_sc;
	
	public ScheduleDTO() {}
	public ScheduleDTO(int sch_seq, String sch_title, String sch_contents, Date sch_start_date, Date sch_end_date,
			String sch_type, String sch_id, String sch_start_date_sc, String sch_end_date_sc) {
		super();
		this.sch_seq = sch_seq;
		this.sch_title = sch_title;
		this.sch_contents = sch_contents;
		this.sch_start_date = sch_start_date;
		this.sch_end_date = sch_end_date;
		this.sch_type = sch_type;
		this.sch_id = sch_id;
		this.sch_start_date_sc = sch_start_date_sc;
		this.sch_end_date_sc = sch_end_date_sc;
	}
	public int getSch_seq() {
		return sch_seq;
	}
	public void setSch_seq(int sch_seq) {
		this.sch_seq = sch_seq;
	}
	public String getSch_title() {
		return sch_title;
	}
	public void setSch_title(String sch_title) {
		this.sch_title = sch_title;
	}
	public String getSch_contents() {
		return sch_contents;
	}
	public void setSch_contents(String sch_contents) {
		this.sch_contents = sch_contents;
	}
	public Date getSch_start_date() {
		return sch_start_date;
	}
	public void setSch_start_date(Date sch_start_date) {
		this.sch_start_date = sch_start_date;
	}
	public Date getSch_end_date() {
		return sch_end_date;
	}
	public void setSch_end_date(Date sch_end_date) {
		this.sch_end_date = sch_end_date;
	}
	public String getSch_type() {
		return sch_type;
	}
	public void setSch_type(String sch_type) {
		this.sch_type = sch_type;
	}
	public String getSch_id() {
		return sch_id;
	}
	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}
	public String getSch_start_date_sc() {
		return sch_start_date_sc;
	}
	public void setSch_start_date_sc(String sch_start_date_sc) {
		this.sch_start_date_sc = sch_start_date_sc;
	}
	public String getSch_end_date_sc() {
		return sch_end_date_sc;
	}
	public void setSch_end_date_sc(String sch_end_date_sc) {
		this.sch_end_date_sc = sch_end_date_sc;
	}
}
