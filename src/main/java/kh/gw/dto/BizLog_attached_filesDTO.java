package kh.gw.dto;

public class BizLog_attached_filesDTO {
	private int biz_seq;
	private String biz_ori_name;
	private String biz_saved_name;
	public BizLog_attached_filesDTO(int biz_seq, String biz_ori_name, String biz_saved_name) {
		super();
		this.biz_seq = biz_seq;
		this.biz_ori_name = biz_ori_name;
		this.biz_saved_name = biz_saved_name;
	}
	public BizLog_attached_filesDTO() {
		super();
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getBiz_ori_name() {
		return biz_ori_name;
	}
	public void setBiz_ori_name(String biz_ori_name) {
		this.biz_ori_name = biz_ori_name;
	}
	public String getBiz_saved_name() {
		return biz_saved_name;
	}
	public void setBiz_saved_name(String biz_saved_name) {
		this.biz_saved_name = biz_saved_name;
	}
	
}
