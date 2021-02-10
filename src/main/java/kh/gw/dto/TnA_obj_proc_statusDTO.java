package kh.gw.dto;

public class TnA_obj_proc_statusDTO {
	private int tna_obj_proc_status_code;
	private String tna_obj_proc_status_name;
	
	public TnA_obj_proc_statusDTO() {}
	public TnA_obj_proc_statusDTO(int tna_obj_proc_status_code, String tna_obj_proc_status_name) {
		super();
		this.tna_obj_proc_status_code = tna_obj_proc_status_code;
		this.tna_obj_proc_status_name = tna_obj_proc_status_name;
	}
	public int getTna_obj_proc_status_code() {
		return tna_obj_proc_status_code;
	}
	public void setTna_obj_proc_status_code(int tna_obj_proc_status_code) {
		this.tna_obj_proc_status_code = tna_obj_proc_status_code;
	}
	public String getTna_obj_proc_status_name() {
		return tna_obj_proc_status_name;
	}
	public void setTna_obj_proc_status_name(String tna_obj_proc_status_name) {
		this.tna_obj_proc_status_name = tna_obj_proc_status_name;
	}
	
	
	
	
	
}
