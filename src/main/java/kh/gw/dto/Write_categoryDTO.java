package kh.gw.dto;

public class Write_categoryDTO {
	private String write_category_code;
	private String write_category_name;
	public String getWrite_category_code() {
		return write_category_code;
	}
	public void setWrite_category_code(String write_category_code) {
		this.write_category_code = write_category_code;
	}
	public String getWrite_category_name() {
		return write_category_name;
	}
	public void setWrite_category_name(String write_category_name) {
		this.write_category_name = write_category_name;
	}
	public Write_categoryDTO(String write_category_code, String write_category_name) {
		super();
		this.write_category_code = write_category_code;
		this.write_category_name = write_category_name;
	}
	public Write_categoryDTO() {
		super();
	}

}
