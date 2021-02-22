package kh.gw.dto;

import java.util.Date;

public class Company_holidayDTO {
	private int comp_hd_seq;
	private String comp_hd_name;
	private Date comp_hd_date;
	private String comp_hd_date_cd;
	public int getComp_hd_seq() {
		return comp_hd_seq;
	}
	public void setComp_hd_seq(int comp_hd_seq) {
		this.comp_hd_seq = comp_hd_seq;
	}
	public String getComp_hd_name() {
		return comp_hd_name;
	}
	public void setComp_hd_name(String comp_hd_name) {
		this.comp_hd_name = comp_hd_name;
	}
	public Date getComp_hd_date() {
		return comp_hd_date;
	}
	public void setComp_hd_date(Date comp_hd_date) {
		this.comp_hd_date = comp_hd_date;
	}
	public String getComp_hd_date_cd() {
		return comp_hd_date_cd;
	}
	public void setComp_hd_date_cd(String comp_hd_date_cd) {
		this.comp_hd_date_cd = comp_hd_date_cd;
	}
	public Company_holidayDTO(int comp_hd_seq, String comp_hd_name, Date comp_hd_date, String comp_hd_date_cd) {
		super();
		this.comp_hd_seq = comp_hd_seq;
		this.comp_hd_name = comp_hd_name;
		this.comp_hd_date = comp_hd_date;
		this.comp_hd_date_cd = comp_hd_date_cd;
	}
	public Company_holidayDTO() {
		
	}
		
	
}
