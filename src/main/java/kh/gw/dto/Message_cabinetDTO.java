package kh.gw.dto;

public class Message_cabinetDTO {
	private int msg_seq;
	private String msg_id;
	public Message_cabinetDTO(int msg_seq, String msg_id) {
		super();
		this.msg_seq = msg_seq;
		this.msg_id = msg_id;
	}
	public Message_cabinetDTO() {
		super();
	}
	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	

}
