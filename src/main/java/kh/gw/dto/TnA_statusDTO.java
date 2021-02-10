package kh.gw.dto;

public class TnA_statusDTO {
	private int tna_status_code;
	private String tna_status_name;
	
	public TnA_statusDTO() {}
	public TnA_statusDTO(int tna_status_code, String tna_status_name) {
		super();
		this.tna_status_code = tna_status_code;
		this.tna_status_name = tna_status_name;
	}
	public int getTna_status_code() {
		return tna_status_code;
	}
	public void setTna_status_code(int tna_status_code) {
		this.tna_status_code = tna_status_code;
	}
	public String getTna_status_name() {
		return tna_status_name;
	}
	public void setTna_status_name(String tna_status_name) {
		this.tna_status_name = tna_status_name;
	}
	
	

	
	
}
