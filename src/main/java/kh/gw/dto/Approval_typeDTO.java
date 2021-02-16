package kh.gw.dto;

public class Approval_typeDTO {
	private int app_type_code;
	private String app_type_name;
	private String app_type_template;
	private String nx_status;
	public Approval_typeDTO(int app_type_code, String app_type_name, String app_type_template, String nx_status) {
		this.app_type_code = app_type_code;
		this.app_type_name = app_type_name;
		this.app_type_template = app_type_template;
		this.nx_status = nx_status;
	}
	public Approval_typeDTO() {
	}
	public int getApp_type_code() {
		return app_type_code;
	}
	public void setApp_type_code(int app_type_code) {
		this.app_type_code = app_type_code;
	}
	public String getApp_type_name() {
		return app_type_name;
	}
	public void setApp_type_name(String app_type_name) {
		this.app_type_name = app_type_name;
	}
	public String getApp_type_template() {
		return app_type_template;
	}
	public void setApp_type_template(String app_type_template) {
		this.app_type_template = app_type_template;
	}
	public String getNx_status() {
		return nx_status;
	}
	public void setNx_status(String nx_status) {
		this.nx_status = nx_status;
	}


	
}
