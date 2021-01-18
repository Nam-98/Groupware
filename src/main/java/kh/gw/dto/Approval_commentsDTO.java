package kh.gw.dto;

import java.sql.Date;

public class Approval_commentsDTO {
	private int app_cmt_seq;
	private int app_seq;
	private String app_cmt_writer;
	private String app_cmt_contents;
	private Date app_cmt_date;
	private Date app_cmt_del;
	public Approval_commentsDTO(int app_cmt_seq, int app_seq, String app_cmt_writer, String app_cmt_contents,
			Date app_cmt_date, Date app_cmt_del) {
		super();
		this.app_cmt_seq = app_cmt_seq;
		this.app_seq = app_seq;
		this.app_cmt_writer = app_cmt_writer;
		this.app_cmt_contents = app_cmt_contents;
		this.app_cmt_date = app_cmt_date;
		this.app_cmt_del = app_cmt_del;
	}
	public Approval_commentsDTO() {
		super();
	}
	public int getApp_cmt_seq() {
		return app_cmt_seq;
	}
	public void setApp_cmt_seq(int app_cmt_seq) {
		this.app_cmt_seq = app_cmt_seq;
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}
	public String getApp_cmt_writer() {
		return app_cmt_writer;
	}
	public void setApp_cmt_writer(String app_cmt_writer) {
		this.app_cmt_writer = app_cmt_writer;
	}
	public String getApp_cmt_contents() {
		return app_cmt_contents;
	}
	public void setApp_cmt_contents(String app_cmt_contents) {
		this.app_cmt_contents = app_cmt_contents;
	}
	public Date getApp_cmt_date() {
		return app_cmt_date;
	}
	public void setApp_cmt_date(Date app_cmt_date) {
		this.app_cmt_date = app_cmt_date;
	}
	public Date getApp_cmt_del() {
		return app_cmt_del;
	}
	public void setApp_cmt_del(Date app_cmt_del) {
		this.app_cmt_del = app_cmt_del;
	}
}
