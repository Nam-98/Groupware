package kh.gw.dto;

public class Write_attached_filesDTO {
	private int write_seq;
	private String write_ori_name;
	private String write_saved_name;
	public int getWrite_seq() {
		return write_seq;
	}
	public void setWrite_seq(int write_seq) {
		this.write_seq = write_seq;
	}
	public String getWrite_ori_name() {
		return write_ori_name;
	}
	public void setWrite_ori_name(String write_ori_name) {
		this.write_ori_name = write_ori_name;
	}
	public String getWrite_saved_name() {
		return write_saved_name;
	}
	public void setWrite_saved_name(String write_saved_name) {
		this.write_saved_name = write_saved_name;
	}
	public Write_attached_filesDTO(int write_seq, String write_ori_name, String write_saved_name) {
		super();
		this.write_seq = write_seq;
		this.write_ori_name = write_ori_name;
		this.write_saved_name = write_saved_name;
	}
	public Write_attached_filesDTO() {
		super();
	}
	
}
