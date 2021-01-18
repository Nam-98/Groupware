package kh.gw.dto;

import java.sql.Date;

public class WriteDTO {
	private int write_seq;
	private String write_code;
	private String write_title;
	private String write_contents;
	private String write_id;
	private Date write_reg_date;
	private Date write_del_date;
	private String write_open;
	private int write_readCount;
	public int getWrite_seq() {
		return write_seq;
	}
	public void setWrite_seq(int write_seq) {
		this.write_seq = write_seq;
	}
	public String getWrite_code() {
		return write_code;
	}
	public void setWrite_code(String write_code) {
		this.write_code = write_code;
	}
	public String getWrite_title() {
		return write_title;
	}
	public void setWrite_title(String write_title) {
		this.write_title = write_title;
	}
	public String getWrite_contents() {
		return write_contents;
	}
	public void setWrite_contents(String write_contents) {
		this.write_contents = write_contents;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}
	public Date getWrite_reg_date() {
		return write_reg_date;
	}
	public void setWrite_reg_date(Date write_reg_date) {
		this.write_reg_date = write_reg_date;
	}
	public Date getWrite_del_date() {
		return write_del_date;
	}
	public void setWrite_del_date(Date write_del_date) {
		this.write_del_date = write_del_date;
	}
	public String getWrite_open() {
		return write_open;
	}
	public void setWrite_open(String write_open) {
		this.write_open = write_open;
	}
	public int getWrite_readCount() {
		return write_readCount;
	}
	public void setWrite_readCount(int write_readCount) {
		this.write_readCount = write_readCount;
	}
	public WriteDTO(int write_seq, String write_code, String write_title, String write_contents, String write_id,
			Date write_reg_date, Date write_del_date, String write_open, int write_readCount) {
		super();
		this.write_seq = write_seq;
		this.write_code = write_code;
		this.write_title = write_title;
		this.write_contents = write_contents;
		this.write_id = write_id;
		this.write_reg_date = write_reg_date;
		this.write_del_date = write_del_date;
		this.write_open = write_open;
		this.write_readCount = write_readCount;
	}
	public WriteDTO() {
		super();
	}
	
}