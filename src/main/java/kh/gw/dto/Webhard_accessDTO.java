package kh.gw.dto;

public class Webhard_accessDTO {
	private String wh_id;
	private int wh_dir_seq;
	private String wh_dir_type_code;
	public Webhard_accessDTO(String wh_id, int wh_dir_seq, String wh_dir_type_code) {
		super();
		this.wh_id = wh_id;
		this.wh_dir_seq = wh_dir_seq;
		this.wh_dir_type_code = wh_dir_type_code;
	}
	public Webhard_accessDTO() {
		super();
	}
	public String getWh_id() {
		return wh_id;
	}
	public void setWh_id(String wh_id) {
		this.wh_id = wh_id;
	}
	public int getWh_dir_seq() {
		return wh_dir_seq;
	}
	public void setWh_dir_seq(int wh_dir_seq) {
		this.wh_dir_seq = wh_dir_seq;
	}
	public String getWh_dir_type_code() {
		return wh_dir_type_code;
	}
	public void setWh_dir_type_code(String wh_dir_type_code) {
		this.wh_dir_type_code = wh_dir_type_code;
	}
	
}
