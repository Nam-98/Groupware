package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;

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
	
	public int addProjectKanban(ProjectDTO dto) throws Exception{
		return db.insert("Project.addProjectKanban",dto);
	}
	
	public ProjectDTO getProInfo(int pro_seq) throws Exception{
		return db.selectOne("Project.getProInfo",pro_seq);
	}
	
	public List<Project_kanbanDTO> getProKanInfo(int pro_seq) throws Exception{
		return db.selectList("Project.getProKanInfo", pro_seq);
	}
	
	public Project_kanbanDTO getKanbanInfo(int pro_kb_seq) throws Exception{
		return db.selectOne("Project.getKanbanInfo",pro_kb_seq);
	}
	
	public int deleteProject(int pro_seq) throws Exception{
		return db.delete("Project.deleteProject",pro_seq);
	}
	
	public int kanbanMoved(Project_kanbanDTO dto) throws Exception{
		return db.update("Project.kanbanMoved", dto);
	}
	
	public int fixKanbanInfo(Project_kanbanDTO dto) throws Exception{
		return db.update("Project.fixKanbanInfo", dto);
	}
	
	public int deleteKanban(int pro_kb_seq) throws Exception{
		return db.delete("Project.deleteKanban",pro_kb_seq);
	}
}
