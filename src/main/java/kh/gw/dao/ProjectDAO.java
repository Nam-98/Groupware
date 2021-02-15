package kh.gw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;
import kh.gw.statics.BoardConfigurator;

@Repository
public class ProjectDAO {
	@Autowired
	private SqlSession db;
	
	public List<ProjectDTO> getList() throws Exception{
		return db.selectList("Project.getList");
	}
	
	public List<ProjectDTO> projectSearch(int cpage, String search, String choice) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE -1;
		Map<String,Object> param = new HashMap<>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("search",search);
		param.put("choice",choice);
		return db.selectList("Project.projectSearch",param);
	}
	
	public List<ProjectDTO> getSearchList(String search,String choice) throws Exception{
		Map<String,String> param = new HashMap<>();
		param.put("search", search);
		param.put("choice",choice);
		return db.selectList("Project.getSearchList",param);
	}
	
	public List<ProjectDTO> listByCpage(int cpage) throws Exception{
		int startRowNum = (cpage - 1) * BoardConfigurator.RECORD_COUNT_PER_PAGE + 1;
		int endRowNum = startRowNum + BoardConfigurator.RECORD_COUNT_PER_PAGE - 1;
		
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		
		return db.selectList("Project.selectAllByPage",map);
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
	
	public int addKanban(Project_kanbanDTO dto) throws Exception{
		return db.insert("Project.addKanban",dto);
	}
	
	public int destroyKanban(ProjectDTO dto) throws Exception{
		return db.delete("Project.destroyKanban", dto);
	}
	
	public List<Project_kanbanDTO> getProKanInfoById(String id) throws Exception{
		return db.selectList("Project.getProKanInfoById", id);
	}
}
