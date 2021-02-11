package kh.gw.dto;

public class BizLog_periodDTO {
	private int app_seq;
	private String biz_periodstart;
	private String biz_periodend;
	public BizLog_periodDTO(int app_seq, String biz_periodstart, String biz_periodend) {
		this.app_seq = app_seq;
		this.biz_periodstart = biz_periodstart;
		this.biz_periodend = biz_periodend;
	}
	public BizLog_periodDTO() {
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}
	public String getBiz_periodstart() {
		return biz_periodstart;
	}
	public void setBiz_periodstart(String biz_periodstart) {
		this.biz_periodstart = biz_periodstart;
	}
	public String getBiz_periodend() {
		return biz_periodend;
	}
	public void setBiz_periodend(String biz_periodend) {
		this.biz_periodend = biz_periodend;
	}

}
