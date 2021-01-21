package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.Approval_typeDTO;

@Repository
public class ApprovalDAO {
	@Autowired
	private SqlSession db;
	
	public List<Approval_typeDTO> allDocsType() {
		return db.selectList("Approval.allDocsType");
	}
}
