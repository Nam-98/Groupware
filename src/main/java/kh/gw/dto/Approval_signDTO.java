package kh.gw.dto;

import java.sql.Date;

public class Approval_signDTO {
	private int app_seq;
	private String app_sign_id;
	private int app_sign_order;
	private Date app_sign_date;
	private String app_sign_accept;
	private String app_sign_help;
	public Approval_signDTO(int app_seq, String app_sign_id, int app_sign_order, Date app_sign_date,
			String app_sign_accept, String app_sign_help) {
		super();
		this.app_seq = app_seq;
		this.app_sign_id = app_sign_id;
		this.app_sign_order = app_sign_order;
		this.app_sign_date = app_sign_date;
		this.app_sign_accept = app_sign_accept;
		this.app_sign_help = app_sign_help;
	}
	public Approval_signDTO() {
		super();
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}
	public String getApp_sign_id() {
		return app_sign_id;
	}
	public void setApp_sign_id(String app_sign_id) {
		this.app_sign_id = app_sign_id;
	}
	public int getApp_sign_order() {
		return app_sign_order;
	}
	public void setApp_sign_order(int app_sign_order) {
		this.app_sign_order = app_sign_order;
	}
	public Date getApp_sign_date() {
		return app_sign_date;
	}
	public void setApp_sign_date(Date app_sign_date) {
		this.app_sign_date = app_sign_date;
	}
	public String getApp_sign_accept() {
		return app_sign_accept;
	}
	public void setApp_sign_accept(String app_sign_accept) {
		this.app_sign_accept = app_sign_accept;
	}
	public String getApp_sign_help() {
		return app_sign_help;
	}
	public void setApp_sign_help(String app_sign_help) {
		this.app_sign_help = app_sign_help;
	}
	
}
