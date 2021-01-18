package kh.gw.dto;

import java.sql.Date;

public class BizLog_signDTO {
	private int biz_seq;
	private String biz_sign_id;
	private int biz_sign_order;
	private Date biz_sign_date;
	private String biz_sign_accept;
	public BizLog_signDTO(int biz_seq, String biz_sign_id, int biz_sign_order, Date biz_sign_date,
			String biz_sign_accept) {
		super();
		this.biz_seq = biz_seq;
		this.biz_sign_id = biz_sign_id;
		this.biz_sign_order = biz_sign_order;
		this.biz_sign_date = biz_sign_date;
		this.biz_sign_accept = biz_sign_accept;
	}
	public BizLog_signDTO() {
		super();
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getBiz_sign_id() {
		return biz_sign_id;
	}
	public void setBiz_sign_id(String biz_sign_id) {
		this.biz_sign_id = biz_sign_id;
	}
	public int getBiz_sign_order() {
		return biz_sign_order;
	}
	public void setBiz_sign_order(int biz_sign_order) {
		this.biz_sign_order = biz_sign_order;
	}
	public Date getBiz_sign_date() {
		return biz_sign_date;
	}
	public void setBiz_sign_date(Date biz_sign_date) {
		this.biz_sign_date = biz_sign_date;
	}
	public String getBiz_sign_accept() {
		return biz_sign_accept;
	}
	public void setBiz_sign_accept(String biz_sign_accept) {
		this.biz_sign_accept = biz_sign_accept;
	}
	
}