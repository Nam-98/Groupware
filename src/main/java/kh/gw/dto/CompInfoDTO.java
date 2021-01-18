package kh.gw.dto;

public class CompInfoDTO {
	private String comp_name;
	private String comp_summary;
	private String comp_establish;
	private String comp_sales;
	private String comp_emp_count;
	private String comp_major_business;
	private String comp_history;
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getComp_summary() {
		return comp_summary;
	}
	public void setComp_summary(String comp_summary) {
		this.comp_summary = comp_summary;
	}
	public String getComp_establish() {
		return comp_establish;
	}
	public void setComp_establish(String comp_establish) {
		this.comp_establish = comp_establish;
	}
	public String getComp_sales() {
		return comp_sales;
	}
	public void setComp_sales(String comp_sales) {
		this.comp_sales = comp_sales;
	}
	public String getComp_emp_count() {
		return comp_emp_count;
	}
	public void setComp_emp_count(String comp_emp_count) {
		this.comp_emp_count = comp_emp_count;
	}
	public String getComp_major_business() {
		return comp_major_business;
	}
	public void setComp_major_business(String comp_major_business) {
		this.comp_major_business = comp_major_business;
	}
	public String getComp_history() {
		return comp_history;
	}
	public void setComp_history(String comp_history) {
		this.comp_history = comp_history;
	}
	public CompInfoDTO(String comp_name, String comp_summary, String comp_establish, String comp_sales,
			String comp_emp_count, String comp_major_business, String comp_history) {
		super();
		this.comp_name = comp_name;
		this.comp_summary = comp_summary;
		this.comp_establish = comp_establish;
		this.comp_sales = comp_sales;
		this.comp_emp_count = comp_emp_count;
		this.comp_major_business = comp_major_business;
		this.comp_history = comp_history;
	}
	public CompInfoDTO() {
		super();
	}
	
}
