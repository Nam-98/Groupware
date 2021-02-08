package kh.gw.dto;

import java.sql.Date;
import java.util.List;

public class Approval_signDTO {
	private int app_seq;
	private String app_sign_id;
	private int app_sign_order;
	private Date app_sign_date;
	private String app_sign_accept;
	private String app_sign_type_code;
	private String name;
	private String app_sign_type_name;
	private List<Approval_signDTO> approval_signDTOList;
	public Approval_signDTO(int app_seq, String app_sign_id, int app_sign_order, Date app_sign_date,
			String app_sign_accept, String app_sign_type_code, String name, String app_sign_type_name,
			List<Approval_signDTO> approval_signDTOList) {
		super();
		this.app_seq = app_seq;
		this.app_sign_id = app_sign_id;
		this.app_sign_order = app_sign_order;
		this.app_sign_date = app_sign_date;
		this.app_sign_accept = app_sign_accept;
		this.app_sign_type_code = app_sign_type_code;
		this.name = name;
		this.app_sign_type_name = app_sign_type_name;
		this.approval_signDTOList = approval_signDTOList;
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
	public String getApp_sign_type_code() {
		return app_sign_type_code;
	}
	public void setApp_sign_type_code(String app_sign_type_code) {
		this.app_sign_type_code = app_sign_type_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getApp_sign_type_name() {
		return app_sign_type_name;
	}
	public void setApp_sign_type_name(String app_sign_type_name) {
		this.app_sign_type_name = app_sign_type_name;
	}
	public List<Approval_signDTO> getApproval_signDTOList() {
		return approval_signDTOList;
	}
	public void setApproval_signDTOList(List<Approval_signDTO> approval_signDTOList) {
		this.approval_signDTOList = approval_signDTOList;
	}
	

}
