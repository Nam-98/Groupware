package kh.gw.dto;

import java.sql.Date;

public class BizLogDTO {
	private int biz_seq;
	private String biz_id;
	private Date biz_reg_date;
	private String biz_title;
	private String biz_contents;
	public BizLogDTO(int biz_seq, String biz_id, Date biz_reg_date, String biz_title, String biz_contents) {
		super();
		this.biz_seq = biz_seq;
		this.biz_id = biz_id;
		this.biz_reg_date = biz_reg_date;
		this.biz_title = biz_title;
		this.biz_contents = biz_contents;
	}
	public BizLogDTO() {
		super();
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}
	public Date getBiz_reg_date() {
		return biz_reg_date;
	}
	public void setBiz_reg_date(Date biz_reg_date) {
		this.biz_reg_date = biz_reg_date;
	}
	public String getBiz_title() {
		return biz_title;
	}
	public void setBiz_title(String biz_title) {
		this.biz_title = biz_title;
	}
	public String getBiz_contents() {
		return biz_contents;
	}
	public void setBiz_contents(String biz_contents) {
		this.biz_contents = biz_contents;
	}
	
}
