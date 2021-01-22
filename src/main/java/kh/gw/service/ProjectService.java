package kh.gw.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ProjectDAO;
import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;
import kh.gw.dto.Project_kb_workerDTO;

@Service
public class ProjectService {
	@Autowired
	private ProjectDAO pdao;
	
	public List<ProjectDTO> getList() throws Exception{
		return pdao.getList();
	}
	
	public int addProjectProc(ProjectDTO dto) throws Exception{
		return pdao.addProjectProc(dto);
	}
	
	public int getSeqNum() throws Exception{
		return pdao.getSeqNum();
	}
	
	public int addProjectKanban(int pro_seq) throws Exception{
		return pdao.addProjectKanban(pro_seq);
	}
	
	public ProjectDTO getProInfo(int pro_seq) throws Exception{
		return pdao.getProInfo(pro_seq);
	}
	
	public List<Project_kanbanDTO> getProKanInfo(int pro_seq) throws Exception{
		return pdao.getProKanInfo(pro_seq);
	}
	
	public List<Project_kb_workerDTO> getProKWInfo(int pro_seq) throws Exception{
		return pdao.getProKWInfo(pro_seq);
	}
	
	public long datediff(Date date1,Date date2) throws Exception {
		long calDate = date1.getTime() - date2.getTime(); 
        long calDateDays = calDate / ( 24*60*60*1000);
        System.out.println("두 날짜의 날짜 차이: "+calDateDays);
        return calDateDays;
	}
	
	public int getpkdtoListCode(List<Project_kanbanDTO> dto, int code) {
		int answer=0; 
		for(int i =0; i < dto.size(); i++) {
			if(dto.get(i).getPro_kb_process_code()==code) {
				answer++;
			}
		}
		return answer;
	}
}
