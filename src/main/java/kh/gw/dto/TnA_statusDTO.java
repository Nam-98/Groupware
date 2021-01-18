package kh.gw.dto;

public class TnA_statusDTO {
	private int TnA_status_code;
	private String TnA_status_name;
	
	public int getTnA_status_code() {
		return TnA_status_code;
	}
	public void setTnA_status_code(int tnA_status_code) {
		TnA_status_code = tnA_status_code;
	}
	public String getTnA_status_name() {
		return TnA_status_name;
	}
	public void setTnA_status_name(String tnA_status_name) {
		TnA_status_name = tnA_status_name;
	}
	public TnA_statusDTO(int tnA_status_code, String tnA_status_name) {
		super();
		TnA_status_code = tnA_status_code;
		TnA_status_name = tnA_status_name;
	}
	public TnA_statusDTO() {
		super();
	}
	
	
}
