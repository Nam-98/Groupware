package kh.gw.dto;

import java.sql.Date;

public class BizLog_periodDTO {
	private int app_seq;
	private Date biz_periodstart;
	private Date biz_periodend;
	public BizLog_periodDTO(int app_seq, Date biz_periodstart, Date biz_periodend) {
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
	public Date getBiz_periodstart() {
		return biz_periodstart;
	}
	public void setBiz_periodstart(Date biz_periodstart) {
		this.biz_periodstart = biz_periodstart;
	}
	public Date getBiz_periodend() {
		return biz_periodend;
	}
	public void setBiz_periodend(Date biz_periodend) {
		this.biz_periodend = biz_periodend;
	}


}
