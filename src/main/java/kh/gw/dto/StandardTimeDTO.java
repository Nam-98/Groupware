package kh.gw.dto;

public class StandardTimeDTO {
	private String standard_time_attendance;
	private String standard_time_leave;
	private String standard_time_night;
	
	public StandardTimeDTO(String standard_time_attendance, String standard_time_leave, String standard_time_night) {
		super();
		this.standard_time_attendance = standard_time_attendance;
		this.standard_time_leave = standard_time_leave;
		this.standard_time_night = standard_time_night;
	}
	
	public String getStandard_time_attendance() {
		return standard_time_attendance;
	}
	public void setStandard_time_attendance(String standard_time_attendance) {
		this.standard_time_attendance = standard_time_attendance;
	}
	public String getStandard_time_leave() {
		return standard_time_leave;
	}
	public void setStandard_time_leave(String standard_time_leave) {
		this.standard_time_leave = standard_time_leave;
	}
	public String getStandard_time_night() {
		return standard_time_night;
	}
	public void setStandard_time_night(String standard_time_night) {
		this.standard_time_night = standard_time_night;
	}
	
	
	
	
}
