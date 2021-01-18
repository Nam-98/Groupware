package kh.gw.dto;

public class Webhard_dirDTO {
	private int wh_dir_seq;
	private String wh_dir_name;
	private int wh_dir_parent_seq;
	public Webhard_dirDTO(int wh_dir_seq, String wh_dir_name, int wh_dir_parent_seq) {
		super();
		this.wh_dir_seq = wh_dir_seq;
		this.wh_dir_name = wh_dir_name;
		this.wh_dir_parent_seq = wh_dir_parent_seq;
	}
	public Webhard_dirDTO() {
		super();
	}
	public int getWh_dir_seq() {
		return wh_dir_seq;
	}
	public void setWh_dir_seq(int wh_dir_seq) {
		this.wh_dir_seq = wh_dir_seq;
	}
	public String getWh_dir_name() {
		return wh_dir_name;
	}
	public void setWh_dir_name(String wh_dir_name) {
		this.wh_dir_name = wh_dir_name;
	}
	public int getWh_dir_parent_seq() {
		return wh_dir_parent_seq;
	}
	public void setWh_dir_parent_seq(int wh_dir_parent_seq) {
		this.wh_dir_parent_seq = wh_dir_parent_seq;
	}
	
}
