package kh.gw.dto;

public class BizLog_periodDTO {
	private int app_seq;
	private String biz_period_start;
	private String biz_period_end;
	public BizLog_periodDTO(int app_seq, String biz_period_start, String biz_period_end) {
		this.app_seq = app_seq;
		this.biz_period_start = biz_period_start;
		this.biz_period_end = biz_period_end;
	}
	public BizLog_periodDTO() {
	}
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}
	public String getBiz_period_start() {
		return biz_period_start;
	}
	public void setBiz_period_start(String biz_period_start) {
		this.biz_period_start = biz_period_start;
	}
	public String getBiz_period_end() {
		return biz_period_end;
	}
	public void setBiz_period_end(String biz_period_end) {
		this.biz_period_end = biz_period_end;
	}

}
