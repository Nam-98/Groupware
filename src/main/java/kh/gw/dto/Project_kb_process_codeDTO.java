package kh.gw.dto;

public class Project_kb_process_codeDTO {
	private int pro_kb_process_code;
	private String pro_kb_process_name;
	public int getPro_kb_process_code() {
		return pro_kb_process_code;
	}
	public void setPro_kb_process_code(int pro_kb_process_code) {
		this.pro_kb_process_code = pro_kb_process_code;
	}
	public String getPro_kb_process_name() {
		return pro_kb_process_name;
	}
	public void setPro_kb_process_name(String pro_kb_process_name) {
		this.pro_kb_process_name = pro_kb_process_name;
	}
	public Project_kb_process_codeDTO(int pro_kb_process_code, String pro_kb_process_name) {
		super();
		this.pro_kb_process_code = pro_kb_process_code;
		this.pro_kb_process_name = pro_kb_process_name;
	}
	public Project_kb_process_codeDTO() {
		super();
	}

	
}
