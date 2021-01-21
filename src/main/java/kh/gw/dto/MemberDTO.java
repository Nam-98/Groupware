package kh.gw.dto;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String gender;
	private String contact;
	private String address1;
	private String address2;
	private String zip_code;
	private String is_married;
	private int dept_code;
	private int position_code;
	private Date reg_date;
	private Date retire_date;
	private int access_level_code;
	private double break_total_count;
	private double break_use_count;
	private String dept_name;
	private String position_name;
	private int dept_level;

	
	
	
	public MemberDTO(String id, String password, String name, Date birth, String gender, String contact,
			String address1, String address2, String zip_code, String is_married, int dept_code, int position_code,
			Date reg_date, Date retire_date, int access_level_code, double break_total_count, double break_use_count) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.contact = contact;
		this.address1 = address1;
		this.address2 = address2;
		this.zip_code = zip_code;
		this.is_married = is_married;
		this.dept_code = dept_code;
		this.position_code = position_code;
		this.reg_date = reg_date;
		this.retire_date = retire_date;
		this.access_level_code = access_level_code;
		this.break_total_count = break_total_count;
		this.break_use_count = break_use_count;
	}

	public MemberDTO() {
		super();
	}

	public String getDept_name() {
		return dept_name;
	}




	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}




	public MemberDTO(String id, String password, String name, Date birth, String gender, String contact,
			String address1, String address2, String zip_code, String is_married, int dept_code, int position_code,
			Date reg_date, Date retire_date, int access_level_code, double break_total_count, double break_use_count,
			String dept_name, String position_name) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.contact = contact;
		this.address1 = address1;
		this.address2 = address2;
		this.zip_code = zip_code;
		this.is_married = is_married;
		this.dept_code = dept_code;
		this.position_code = position_code;
		this.reg_date = reg_date;
		this.retire_date = retire_date;
		this.access_level_code = access_level_code;
		this.break_total_count = break_total_count;
		this.break_use_count = break_use_count;
		this.dept_name = dept_name;
		this.position_name = position_name;
	}




	public String getPosition_name() {
		return position_name;
	}




	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}




	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getIs_married() {
		return is_married;
	}

	public void setIs_married(String is_married) {
		this.is_married = is_married;
	}

	public int getDept_code() {
		return dept_code;
	}

	public void setDept_code(int dept_code) {
		this.dept_code = dept_code;
	}

	public int getPosition_code() {
		return position_code;
	}

	public void setPosition_code(int position_code) {
		this.position_code = position_code;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getRetire_date() {
		return retire_date;
	}

	public void setRetire_date(Date retire_date) {
		this.retire_date = retire_date;
	}

	public int getAccess_level_code() {
		return access_level_code;
	}

	public void setAccess_level_code(int access_level_code) {
		this.access_level_code = access_level_code;
	}

	public double getBreak_total_count() {
		return break_total_count;
	}

	public void setBreak_total_count(double break_total_count) {
		this.break_total_count = break_total_count;
	}

	public double getBreak_use_count() {
		return break_use_count;
	}

	public void setBreak_use_count(double break_use_count) {
		this.break_use_count = break_use_count;
	}

	public int getDept_level() {
		return dept_level;
	}

	public void setDept_level(int dept_level) {
		this.dept_level = dept_level;
	}

	
	
	

}
