package kh.gw.dto;

public class Approval_sign_typeDTO {
	private int app_sign_type_code;
	private String app_sign_type_name;
	public Approval_sign_typeDTO(int app_sign_type_code, String app_sign_type_name) {
		super();
		this.app_sign_type_code = app_sign_type_code;
		this.app_sign_type_name = app_sign_type_name;
	}
	public Approval_sign_typeDTO() {
		super();
	}
	public int getApp_sign_type_code() {
		return app_sign_type_code;
	}
	public void setApp_sign_type_code(int app_sign_type_code) {
		this.app_sign_type_code = app_sign_type_code;
	}
	public String getApp_sign_type_name() {
		return app_sign_type_name;
	}
	public void setApp_sign_type_name(String app_sign_type_name) {
		this.app_sign_type_name = app_sign_type_name;
	}
	
}
