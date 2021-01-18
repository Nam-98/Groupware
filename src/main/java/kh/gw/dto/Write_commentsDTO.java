package kh.gw.dto;

import java.sql.Date;

public class Write_commentsDTO {
	private int write_cmt_seq;
	private int write_seq;
	private String write_cmt_id;
	private String write_cmt_contents;
	private Date write_cmt_date;
	private Date write_cmt_del;
	private int write_cmt_parent_id;
	public int getWrite_cmt_seq() {
		return write_cmt_seq;
	}
	public void setWrite_cmt_seq(int write_cmt_seq) {
		this.write_cmt_seq = write_cmt_seq;
	}
	public int getWrite_seq() {
		return write_seq;
	}
	public void setWrite_seq(int write_seq) {
		this.write_seq = write_seq;
	}
	public String getWrite_cmt_id() {
		return write_cmt_id;
	}
	public void setWrite_cmt_id(String write_cmt_id) {
		this.write_cmt_id = write_cmt_id;
	}
	public String getWrite_cmt_contents() {
		return write_cmt_contents;
	}
	public void setWrite_cmt_contents(String write_cmt_contents) {
		this.write_cmt_contents = write_cmt_contents;
	}
	public Date getWrite_cmt_date() {
		return write_cmt_date;
	}
	public void setWrite_cmt_date(Date write_cmt_date) {
		this.write_cmt_date = write_cmt_date;
	}
	public Date getWrite_cmt_del() {
		return write_cmt_del;
	}
	public void setWrite_cmt_del(Date write_cmt_del) {
		this.write_cmt_del = write_cmt_del;
	}
	public int getWrite_cmt_parent_id() {
		return write_cmt_parent_id;
	}
	public void setWrite_cmt_parent_id(int write_cmt_parent_id) {
		this.write_cmt_parent_id = write_cmt_parent_id;
	}
	public Write_commentsDTO(int write_cmt_seq, int write_seq, String write_cmt_id, String write_cmt_contents,
			Date write_cmt_date, Date write_cmt_del, int write_cmt_parent_id) {
		super();
		this.write_cmt_seq = write_cmt_seq;
		this.write_seq = write_seq;
		this.write_cmt_id = write_cmt_id;
		this.write_cmt_contents = write_cmt_contents;
		this.write_cmt_date = write_cmt_date;
		this.write_cmt_del = write_cmt_del;
		this.write_cmt_parent_id = write_cmt_parent_id;
	}
	public Write_commentsDTO() {
		super();
	}
	
	

}
