package kh.gw.dto;

public class BizLog_ccDTO {
	private int biz_seq;
	private String biz_cc_id;
	public BizLog_ccDTO(int biz_seq, String biz_cc_id) {
		super();
		this.biz_seq = biz_seq;
		this.biz_cc_id = biz_cc_id;
	}
	public BizLog_ccDTO() {
		super();
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getBiz_cc_id() {
		return biz_cc_id;
	}
	public void setBiz_cc_id(String biz_cc_id) {
		this.biz_cc_id = biz_cc_id;
	}
	
}
