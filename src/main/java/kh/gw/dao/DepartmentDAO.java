package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.DepartmentDTO;

@Repository
public class DepartmentDAO {
	@Autowired
	private SqlSession db;
	
	public List<DepartmentDTO> listDept() {
		return db.selectList("Department.listDept");
	}
	public int nxDeptAdd(DepartmentDTO dto) {
		return db.insert("Department.nxDeptAdd", dto);
	}
	public int nxDeptDel(int dept_seq) {
		return db.delete("Department.nxDeptDel",dept_seq);
	}
	public int nxDeptUdt(DepartmentDTO dto) {
		return db.update("Department.nxDeptUdt", dto);
	}
	public int nxGetDeptDir(int dept_code) {
		return db.selectOne("Department.nxGetDeptDir", dept_code);
	}
	public int getNewCode() {
		return db.selectOne("Department.getNewCode");
	}
}
