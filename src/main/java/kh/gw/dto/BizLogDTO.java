package kh.gw.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BizLogDTO {
	private int biz_seq;
	private String biz_id;
	private Date biz_reg_date;
	private String biz_title;
	private String biz_contents;
	private int biz_type_code;
	private int biz_status_code;
	private int biz_type_name;
	private int biz_status_name;
	private List<MultipartFile> attachedfiles;
	public BizLogDTO(int biz_seq, String biz_id, Date biz_reg_date, String biz_title, String biz_contents,
			int biz_type_code, int biz_status_code, int biz_type_name, int biz_status_name,
			List<MultipartFile> attachedfiles) {
		this.biz_seq = biz_seq;
		this.biz_id = biz_id;
		this.biz_reg_date = biz_reg_date;
		this.biz_title = biz_title;
		this.biz_contents = biz_contents;
		this.biz_type_code = biz_type_code;
		this.biz_status_code = biz_status_code;
		this.biz_type_name = biz_type_name;
		this.biz_status_name = biz_status_name;
		this.attachedfiles = attachedfiles;
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}
	public Date getBiz_reg_date() {
		return biz_reg_date;
	}
	public void setBiz_reg_date(Date biz_reg_date) {
		this.biz_reg_date = biz_reg_date;
	}
	public String getBiz_title() {
		return biz_title;
	}
	public void setBiz_title(String biz_title) {
		this.biz_title = biz_title;
	}
	public String getBiz_contents() {
		return biz_contents;
	}
	public void setBiz_contents(String biz_contents) {
		this.biz_contents = biz_contents;
	}
	public int getBiz_type_code() {
		return biz_type_code;
	}
	public void setBiz_type_code(int biz_type_code) {
		this.biz_type_code = biz_type_code;
	}
	public int getBiz_status_code() {
		return biz_status_code;
	}
	public void setBiz_status_code(int biz_status_code) {
		this.biz_status_code = biz_status_code;
	}
	public int getBiz_type_name() {
		return biz_type_name;
	}
	public void setBiz_type_name(int biz_type_name) {
		this.biz_type_name = biz_type_name;
	}
	public int getBiz_status_name() {
		return biz_status_name;
	}
	public void setBiz_status_name(int biz_status_name) {
		this.biz_status_name = biz_status_name;
	}
	public List<MultipartFile> getAttachedfiles() {
		return attachedfiles;
	}
	public void setAttachedfiles(List<MultipartFile> attachedfiles) {
		this.attachedfiles = attachedfiles;
	}
	public BizLogDTO() {
	}

}
