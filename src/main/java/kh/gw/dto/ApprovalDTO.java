package kh.gw.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ApprovalDTO {
	private int app_seq;
	private int app_type_code;
	private String app_id;
	private int app_archive;
	private String app_title;
	private String app_contents;
	private Date app_reg_date;
	private String app_docs_num;
	private List<MultipartFile> files;
	private int app_status_code;
	public ApprovalDTO(int app_seq, int app_type_code, String app_id, int app_archive, String app_title,
			String app_contents, Date app_reg_date, String app_docs_num, List<MultipartFile> files,
			int app_status_code) {
		super();
		this.app_seq = app_seq;
		this.app_type_code = app_type_code;
		this.app_id = app_id;
		this.app_archive = app_archive;
		this.app_title = app_title;
		this.app_contents = app_contents;
		this.app_reg_date = app_reg_date;
		this.app_docs_num = app_docs_num;
		this.files = files;
		this.app_status_code = app_status_code;
	}
	public ApprovalDTO() {
		super();
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
	public String getApp_id() {
		return app_id;
	}
	public void setApp_id(String app_id) {
		this.app_id = app_id;
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
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public int getApp_status_code() {
		return app_status_code;
	}
	public void setApp_status_code(int app_status_code) {
		this.app_status_code = app_status_code;
	}
	
}
