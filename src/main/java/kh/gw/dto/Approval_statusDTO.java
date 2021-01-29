package kh.gw.dto;

public class Approval_statusDTO {
	private int app_status_code;
	private String app_status_name;
	public Approval_statusDTO(int app_status_code, String app_status_name) {
		super();
		this.app_status_code = app_status_code;
		this.app_status_name = app_status_name;
	}
	public Approval_statusDTO() {
		super();
	}
	public int getApp_status_code() {
		return app_status_code;
	}
	public void setApp_status_code(int app_status_code) {
		this.app_status_code = app_status_code;
	}
	public String getApp_status_name() {
		return app_status_name;
	}
	public void setApp_status_name(String app_status_name) {
		this.app_status_name = app_status_name;
	}
	

}
