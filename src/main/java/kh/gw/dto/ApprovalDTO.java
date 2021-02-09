package kh.gw.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ApprovalDTO {
	private int app_seq;
	private int app_type_code;
	private String app_type_name;
	private String app_id;
	private String name;
	private int app_archive;
	private String app_title;
	private String app_contents;
	private Date app_reg_date;
	private String app_docs_num;
	private List<MultipartFile> attachedfiles;
	private int app_status_code;
	private String app_status_name;
	private String app_sign_accept;
	private String app_is_my_sign_turn;
	public ApprovalDTO(int app_seq, int app_type_code, String app_type_name, String app_id, String name,
			int app_archive, String app_title, String app_contents, Date app_reg_date, String app_docs_num,
			List<MultipartFile> attachedfiles, int app_status_code, String app_status_name, String app_sign_accept,
			String app_is_my_sign_turn) {
		super();
		this.app_seq = app_seq;
		this.app_type_code = app_type_code;
		this.app_type_name = app_type_name;
		this.app_id = app_id;
		this.name = name;
		this.app_archive = app_archive;
		this.app_title = app_title;
		this.app_contents = app_contents;
		this.app_reg_date = app_reg_date;
		this.app_docs_num = app_docs_num;
		this.attachedfiles = attachedfiles;
		this.app_status_code = app_status_code;
		this.app_status_name = app_status_name;
		this.app_sign_accept = app_sign_accept;
		this.app_is_my_sign_turn = app_is_my_sign_turn;
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
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
	public String getApp_id() {
		return app_id;
	}
	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getApp_archive() {
		return app_archive;
	}
	public void setApp_archive(int app_archive) {
		this.app_archive = app_archive;
	}
	public String getApp_title() {
		return app_title;
	}
	public void setApp_title(String app_title) {
		this.app_title = app_title;
	}
	public String getApp_contents() {
		return app_contents;
	}
	public void setApp_contents(String app_contents) {
		this.app_contents = app_contents;
	}
	public Date getApp_reg_date() {
		return app_reg_date;
	}
	public void setApp_reg_date(Date app_reg_date) {
		this.app_reg_date = app_reg_date;
	}
	public String getApp_docs_num() {
		return app_docs_num;
	}
	public void setApp_docs_num(String app_docs_num) {
		this.app_docs_num = app_docs_num;
	}
	public List<MultipartFile> getAttachedfiles() {
		return attachedfiles;
	}
	public void setAttachedfiles(List<MultipartFile> attachedfiles) {
		this.attachedfiles = attachedfiles;
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
	public String getApp_sign_accept() {
		return app_sign_accept;
	}
	public void setApp_sign_accept(String app_sign_accept) {
		this.app_sign_accept = app_sign_accept;
	}
	public String getApp_is_my_sign_turn() {
		return app_is_my_sign_turn;
	}
	public void setApp_is_my_sign_turn(String app_is_my_sign_turn) {
		this.app_is_my_sign_turn = app_is_my_sign_turn;
	}
	public ApprovalDTO() {
		super();
	}
	

}
