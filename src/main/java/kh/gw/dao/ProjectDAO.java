package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ProjectDTO;

@Repository
public class ProjectDAO {
	@Autowired
	private SqlSession db;
	
	public List<ProjectDTO> getList() throws Exception{
		return db.selectList("Project.getList");
	}
}
