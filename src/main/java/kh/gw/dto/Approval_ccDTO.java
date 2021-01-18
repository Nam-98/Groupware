package kh.gw.dto;

public class Approval_ccDTO {
	private int app_seq;
	private String app_cc_id;
	public Approval_ccDTO(int app_seq, String app_cc_id) {
		super();
		this.app_seq = app_seq;
		this.app_cc_id = app_cc_id;
	}
	public Approval_ccDTO() {
		super();
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}
	public String getApp_cc_id() {
		return app_cc_id;
	}
	public void setApp_cc_id(String app_cc_id) {
		this.app_cc_id = app_cc_id;
	}
	
}
