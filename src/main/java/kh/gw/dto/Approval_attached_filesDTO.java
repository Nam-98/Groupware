package kh.gw.dto;

public class Approval_attached_filesDTO {
	private int app_seq;
	private String app_ori_name;
	private String app_saved_name;
	public Approval_attached_filesDTO(int app_seq, String app_ori_name, String app_saved_name) {
		super();
		this.app_seq = app_seq;
		this.app_ori_name = app_ori_name;
		this.app_saved_name = app_saved_name;
	}
	public Approval_attached_filesDTO() {
		super();
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}
	public String getApp_ori_name() {
		return app_ori_name;
	}
	public void setApp_ori_name(String app_ori_name) {
		this.app_ori_name = app_ori_name;
	}
	public String getApp_saved_name() {
		return app_saved_name;
	}
	public void setApp_saved_name(String app_saved_name) {
		this.app_saved_name = app_saved_name;
	}
	
}
