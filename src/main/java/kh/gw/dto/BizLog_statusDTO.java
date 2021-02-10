package kh.gw.dto;

public class BizLog_statusDTO {
	private int biz_status_code;
	private String biz_status_name;

	public int getBiz_status_code() {
		return biz_status_code;
	}
	public void setBiz_status_code(int biz_status_code) {
		this.biz_status_code = biz_status_code;
	}
	public String getBiz_status_name() {
		return biz_status_name;
	}
	public void setBiz_status_name(String biz_status_name) {
		this.biz_status_name = biz_status_name;
	}
	public BizLog_statusDTO(int biz_status_code, String biz_status_name) {
		super();
		this.biz_status_code = biz_status_code;
		this.biz_status_name = biz_status_name;
	}
	public BizLog_statusDTO() {
		super();
	}

	

}
