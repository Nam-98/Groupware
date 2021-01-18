package kh.gw.dto;

import java.sql.Date;

public class BreakDTO {
	private int break_seq;
	private String break_id;
	private int break_code;
	private double break_discount;
	private Date break_start_date;
	private Date break_end_date;
	private String break_reason;
	public int getBreak_seq() {
		return break_seq;
	}
	public void setBreak_seq(int break_seq) {
		this.break_seq = break_seq;
	}
	public String getBreak_id() {
		return break_id;
	}
	public void setBreak_id(String break_id) {
		this.break_id = break_id;
	}
	public int getBreak_code() {
		return break_code;
	}
	public void setBreak_code(int break_code) {
		this.break_code = break_code;
	}
	public double getBreak_discount() {
		return break_discount;
	}
	public void setBreak_discount(double break_discount) {
		this.break_discount = break_discount;
	}
	public Date getBreak_start_date() {
		return break_start_date;
	}
	public void setBreak_start_date(Date break_start_date) {
		this.break_start_date = break_start_date;
	}
	public Date getBreak_end_date() {
		return break_end_date;
	}
	public void setBreak_end_date(Date break_end_date) {
		this.break_end_date = break_end_date;
	}
	public String getBreak_reason() {
		return break_reason;
	}
	public void setBreak_reason(String break_reason) {
		this.break_reason = break_reason;
	}
	public BreakDTO(int break_seq, String break_id, int break_code, double break_discount, Date break_start_date,
			Date break_end_date, String break_reason) {
		super();
		this.break_seq = break_seq;
		this.break_id = break_id;
		this.break_code = break_code;
		this.break_discount = break_discount;
		this.break_start_date = break_start_date;
		this.break_end_date = break_end_date;
		this.break_reason = break_reason;
	}
	public BreakDTO() {
		super();
	}
	
}