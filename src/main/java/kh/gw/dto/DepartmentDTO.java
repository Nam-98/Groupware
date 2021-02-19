package kh.gw.dto;

public class DepartmentDTO {

	private int dept_code;
	private String dept_name;
	private int dept_dir_id;
	private int dept_level;
	private int dept_code_parent;
	private String dept_tree_code;
	public DepartmentDTO(int dept_code, String dept_name, int dept_dir_id, int dept_level, int dept_code_parent,
			String dept_tree_code) {
		this.dept_code = dept_code;
		this.dept_name = dept_name;
		this.dept_dir_id = dept_dir_id;
		this.dept_level = dept_level;
		this.dept_code_parent = dept_code_parent;
		this.dept_tree_code = dept_tree_code;
	}
	public DepartmentDTO() {
	}
	public int getDept_code() {
		return dept_code;
	}
	public void setDept_code(int dept_code) {
		this.dept_code = dept_code;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getDept_dir_id() {
		return dept_dir_id;
	}
	public void setDept_dir_id(int dept_dir_id) {
		this.dept_dir_id = dept_dir_id;
	}
	public int getDept_level() {
		return dept_level;
	}
	public void setDept_level(int dept_level) {
		this.dept_level = dept_level;
	}
	public int getDept_code_parent() {
		return dept_code_parent;
	}
	public void setDept_code_parent(int dept_code_parent) {
		this.dept_code_parent = dept_code_parent;
	}

	public String getDept_tree_code() {
		return dept_tree_code;
	}
	public void setDept_tree_code(String dept_tree_code) {
		this.dept_tree_code = dept_tree_code;
	}
	

	
}
