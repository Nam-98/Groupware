package kh.gw.dto;

public class Break_typeDTO {
	private int break_code;
	private String break_name;
	private double break_discount;
	public Break_typeDTO(int break_code, String break_name, double break_discount) {
		super();
		this.break_code = break_code;
		this.break_name = break_name;
		this.break_discount = break_discount;
	}
	public Break_typeDTO() {
		super();
	}
	public int getBreak_code() {
		return break_code;
	}
	public void setBreak_code(int break_code) {
		this.break_code = break_code;
	}
	public String getBreak_name() {
		return break_name;
	}
	public void setBreak_name(String break_name) {
		this.break_name = break_name;
	}
	public double getBreak_discount() {
		return break_discount;
	}
	public void setBreak_discount(double break_discount) {
		this.break_discount = break_discount;
	}
	
}
