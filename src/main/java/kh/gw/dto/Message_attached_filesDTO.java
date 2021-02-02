package kh.gw.dto;

public class Message_attached_filesDTO {
	private int msg_seq;
	private String msg_ori_name;
	private String msg_saved_name;
	
	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getMsg_ori_name() {
		return msg_ori_name;
	}
	public void setMsg_ori_name(String msg_ori_name) {
		this.msg_ori_name = msg_ori_name;
	}
	public String getMsg_saved_name() {
		return msg_saved_name;
	}
	public void setMsg_saved_name(String msg_saved_name) {
		this.msg_saved_name = msg_saved_name;
	}
	
	public Message_attached_filesDTO(int msg_seq, String msg_ori_name, String msg_saved_name) {
		super();
		this.msg_seq = msg_seq;
		this.msg_ori_name = msg_ori_name;
		this.msg_saved_name = msg_saved_name;
	}
	
	public Message_attached_filesDTO() {}
	
}
