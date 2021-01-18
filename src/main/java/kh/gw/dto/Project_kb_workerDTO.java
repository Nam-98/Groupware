package kh.gw.dto;

public class Project_kb_workerDTO {
	private int pro_kb_seq;
	private int por_seq;
	private String pro_kb_worker;
	public int getPro_kb_seq() {
		return pro_kb_seq;
	}
	public void setPro_kb_seq(int pro_kb_seq) {
		this.pro_kb_seq = pro_kb_seq;
	}
	public int getPor_seq() {
		return por_seq;
	}
	public void setPor_seq(int por_seq) {
		this.por_seq = por_seq;
	}
	public String getPro_kb_worker() {
		return pro_kb_worker;
	}
	public void setPro_kb_worker(String pro_kb_worker) {
		this.pro_kb_worker = pro_kb_worker;
	}
	public Project_kb_workerDTO(int pro_kb_seq, int por_seq, String pro_kb_worker) {
		super();
		this.pro_kb_seq = pro_kb_seq;
		this.por_seq = por_seq;
		this.pro_kb_worker = pro_kb_worker;
	}
	public Project_kb_workerDTO() {
		super();
	}
	
}
