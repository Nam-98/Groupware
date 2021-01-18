package kh.gw.dto;

public class Project_kanbanDTO {
	private int pro_kb_seq;
	private int pro_seq;
	private int pro_kb_process_code;
	private String pro_kb_title;
	private String pro_kb_details;
	public int getPro_kb_seq() {
		return pro_kb_seq;
	}
	public void setPro_kb_seq(int pro_kb_seq) {
		this.pro_kb_seq = pro_kb_seq;
	}
	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	public int getPro_kb_process_code() {
		return pro_kb_process_code;
	}
	public void setPro_kb_process_code(int pro_kb_process_code) {
		this.pro_kb_process_code = pro_kb_process_code;
	}
	public String getPro_kb_title() {
		return pro_kb_title;
	}
	public void setPro_kb_title(String pro_kb_title) {
		this.pro_kb_title = pro_kb_title;
	}
	public String getPro_kb_details() {
		return pro_kb_details;
	}
	public void setPro_kb_details(String pro_kb_details) {
		this.pro_kb_details = pro_kb_details;
	}
	public Project_kanbanDTO(int pro_kb_seq, int pro_seq, int pro_kb_process_code, String pro_kb_title,
			String pro_kb_details) {
		this.pro_kb_seq = pro_kb_seq;
		this.pro_seq = pro_seq;
		this.pro_kb_process_code = pro_kb_process_code;
		this.pro_kb_title = pro_kb_title;
		this.pro_kb_details = pro_kb_details;
	}
	public Project_kanbanDTO() {
	}
	
}
