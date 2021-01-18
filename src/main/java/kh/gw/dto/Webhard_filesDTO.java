package kh.gw.dto;

import java.sql.Date;

public class Webhard_filesDTO {
	private int wh_files_seq;
	private int wh_dir_seq;
	private String wh_ori_name;
	private String wh_saved_name;
	private Date wh_upload_date;
	public Webhard_filesDTO(int wh_files_seq, int wh_dir_seq, String wh_ori_name, String wh_saved_name,
			Date wh_upload_date) {
		super();
		this.wh_files_seq = wh_files_seq;
		this.wh_dir_seq = wh_dir_seq;
		this.wh_ori_name = wh_ori_name;
		this.wh_saved_name = wh_saved_name;
		this.wh_upload_date = wh_upload_date;
	}
	public Webhard_filesDTO() {
		super();
	}
	public int getWh_files_seq() {
		return wh_files_seq;
	}
	public void setWh_files_seq(int wh_files_seq) {
		this.wh_files_seq = wh_files_seq;
	}
	public int getWh_dir_seq() {
		return wh_dir_seq;
	}
	public void setWh_dir_seq(int wh_dir_seq) {
		this.wh_dir_seq = wh_dir_seq;
	}
	public String getWh_ori_name() {
		return wh_ori_name;
	}
	public void setWh_ori_name(String wh_ori_name) {
		this.wh_ori_name = wh_ori_name;
	}
	public String getWh_saved_name() {
		return wh_saved_name;
	}
	public void setWh_saved_name(String wh_saved_name) {
		this.wh_saved_name = wh_saved_name;
	}
	public Date getWh_upload_date() {
		return wh_upload_date;
	}
	public void setWh_upload_date(Date wh_upload_date) {
		this.wh_upload_date = wh_upload_date;
	}
	
}
