package kh.gw.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ProjectDAO;
import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;

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
	
	public int addProjectKanban(ProjectDTO dto) throws Exception{
		return pdao.addProjectKanban(dto);
	}
	
	public ProjectDTO getProInfo(int pro_seq) throws Exception{
		return pdao.getProInfo(pro_seq);
	}
	
	public List<Project_kanbanDTO> getProKanInfo(int pro_seq) throws Exception{
		return pdao.getProKanInfo(pro_seq);
	}
	
	public Project_kanbanDTO getKanbanInfo(int pro_kb_seq ) throws Exception{
		return pdao.getKanbanInfo(pro_kb_seq);
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
	
	public void addDateStr(List<ProjectDTO> dtoList) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 

		for(ProjectDTO dto : dtoList) {
			dto.setPro_start_date_str(simpleDateFormat.format(dto.getPro_start_date()));
			dto.setPro_end_date_str(simpleDateFormat.format(dto.getPro_end_date()));
		}
	}
	
	public void addDateStr(ProjectDTO dto) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
			dto.setPro_start_date_str(simpleDateFormat.format(dto.getPro_start_date()));
			dto.setPro_end_date_str(simpleDateFormat.format(dto.getPro_end_date()));
		
	}
	
	public int deleteProject(int pro_seq) throws Exception {
		return pdao.deleteProject(pro_seq);
	}
}
