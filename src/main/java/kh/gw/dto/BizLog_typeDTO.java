package kh.gw.dto;

public class BizLog_typeDTO {
	private int biz_type_code;
	private String biz_type_name;
	public BizLog_typeDTO(int biz_type_code, String biz_type_name) {
		super();
		this.biz_type_code = biz_type_code;
		this.biz_type_name = biz_type_name;
	}
	public BizLog_typeDTO() {
	}
	public int getBiz_type_code() {
		return biz_type_code;
	}
	public void setBiz_type_code(int biz_type_code) {
		this.biz_type_code = biz_type_code;
	}
	public String getBiz_type_name() {
		return biz_type_name;
	}
	public void setBiz_type_name(String biz_type_name) {
		this.biz_type_name = biz_type_name;
	}
	

}
