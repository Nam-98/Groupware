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
}
