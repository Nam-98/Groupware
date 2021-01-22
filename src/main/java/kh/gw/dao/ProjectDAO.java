package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;
import kh.gw.dto.Project_kb_workerDTO;

@Repository
public class ProjectDAO {
	@Autowired
	private SqlSession db;
	
	public List<ProjectDTO> getList() throws Exception{
		return db.selectList("Project.getList");
	}
	
	public int addProjectProc(ProjectDTO dto) throws Exception{
		return db.insert("Project.addProjectProc",dto);
	}
	
	public int getSeqNum() throws Exception{
		return db.selectOne("Project.getSeqNum");
	}
	
	public int addProjectKanban(int pro_seq) throws Exception{
		return db.insert("Project.addProjectKanban",pro_seq);
	}
	
	public ProjectDTO getProInfo(int pro_seq) throws Exception{
		return db.selectOne("Project.getProInfo",pro_seq);
	}
	
	public List<Project_kanbanDTO> getProKanInfo(int pro_seq) throws Exception{
		return db.selectList("Project.getProKanInfo", pro_seq);
	}
	
	public List<Project_kb_workerDTO> getProKWInfo(int pro_seq) throws Exception{
		return db.selectList("Project.getProKWInfo", pro_seq);
	}
}
