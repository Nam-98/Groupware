package kh.gw.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ProjectDAO;
import kh.gw.dto.ProjectDTO;
import kh.gw.dto.Project_kanbanDTO;
import kh.gw.statics.BoardConfigurator;

@Service
public class ProjectService {
	@Autowired
	private ProjectDAO pdao;
	
	public List<ProjectDTO> getList() throws Exception{
		return pdao.getList();
	}

	public List<ProjectDTO> listByCpage(int cpage) throws Exception{
		return pdao.listByCpage(cpage);
	}
	
	public List<ProjectDTO> projectSearch(int cpage, String search, String choice) throws Exception{
		return pdao.projectSearch(cpage, search, choice);
	}
	
	public String projectSearchNavi(int currentPage, String search, String choice) throws Exception{
		int recordTotalCount = pdao.getSearchList(search,choice).size(); //총 데이터 개수
		System.out.println(recordTotalCount);
		
		BoardConfigurator configurator = new BoardConfigurator();
		
		int recordCountPerPage = configurator.RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = configurator.NAVI_COUNT_PER_PAGE;

		int pageTotalCount;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount/recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount/recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage -1 ;

		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if(startNavi != 1) {
			sb.append("<a href='/project/projectSearch.project?choice="+choice+"&search="+search+"&cpage=1> << </a>" + " ");
		}
		if(needPrev) {
			sb.append("<a href='/project/projectSearch.project?choice="+choice+"&search="+search+"&cpage=" + (startNavi-1)+"'> < </a>" + " ");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/project/projectSearch.project?choice="+choice+"&search="+search+"&cpage=" +i+"'>"+i+"</a>"+" " );
		}
		if(endNavi != pageTotalCount) {
			sb.append("<a href='/project/projectSearch.project?choice="+choice+"&search="+search+"&cpage="+pageTotalCount+"'> >> </a>");
		}
		return sb.toString();
	}
	
	public String getListNavi(int currentPage) throws Exception{
		int recordTotalCount=  pdao.getList().size();

		
		int recordCountPerPage = BoardConfigurator.RECORD_COUNT_PER_PAGE; 
		int naviCountPerPage = BoardConfigurator.NAVI_COUNT_PER_PAGE; 
		int pageTotalCount;
		if (recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

				if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;
		

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();

		if (startNavi != 1) {
			sb.append("<a href ='/project/enterProjectList.project?cpage=1'><맨 앞으로></a>");
			sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		}

		if (needPrev) {
			sb.append("<a href ='/project/enterProjectList.project?cpage=" + (startNavi - 1) + "'>◀</a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href ='/project/enterProjectList.project?cpage=" + i + "'>" + i + "</a>");
			sb.append(" ");
		}
		if (needNext) {
			sb.append("<a href ='/project/enterProjectList.project?cpage=" + (endNavi + 1) + "'>▶</a>");
		}

		if (endNavi != pageTotalCount) {
			sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
			sb.append("<a href ='/project/enterProjectList.project?cpage=" + pageTotalCount + "'>" + "<맨 끝으로></a>");
		}

		return sb.toString();
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
	
	public int kanbanMoved(Project_kanbanDTO dto) throws Exception {
		return pdao.kanbanMoved(dto);
	}
	
	public int fixKanbanInfo(Project_kanbanDTO dto) throws Exception {
		return pdao.fixKanbanInfo(dto);
	}
	
	public int deleteKanban(int pro_kb_seq) throws Exception {
		return pdao.deleteKanban(pro_kb_seq);
	}
	
	public int addKanban(Project_kanbanDTO dto) throws Exception{
		return pdao.addKanban(dto);
	}
	
	public int destroyKanban(ProjectDTO dto) throws Exception{
		return pdao.destroyKanban(dto);
	}
}
