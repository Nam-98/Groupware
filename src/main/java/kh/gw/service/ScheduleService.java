package kh.gw.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexacro.uiadapter17.spring.core.annotation.ParamDataSet;
import com.nexacro.uiadapter17.spring.core.data.NexacroResult;

import kh.gw.dao.ScheduleDAO;
import kh.gw.dto.Company_holidayDTO;
import kh.gw.dto.ScheduleDTO;
import kh.gw.statics.BoardConfigurator;

@Service
public class ScheduleService {
	@Autowired
	private ScheduleDAO sdao;

	public int insertSchedule(ScheduleDTO dto) throws Exception{
		return sdao.insertSchedule(dto);
	}

//	public List<ScheduleDTO> listByCpage(int cpage) throws Exception{
//		return sdao.listByCpage(cpage);
//	}
//
//	public String getListNavi(int currentPage) throws Exception{
//		int recordTotalCount=  sdao.getList().size();
//
//		
//		int recordCountPerPage = BoardConfigurator.RECORD_COUNT_PER_PAGE; 
//		int naviCountPerPage = BoardConfigurator.NAVI_COUNT_PER_PAGE; 
//		int pageTotalCount;
//		if (recordTotalCount % recordCountPerPage > 0) {
//			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
//		} else {
//			pageTotalCount = recordTotalCount / recordCountPerPage;
//		}
//
//				if (currentPage < 1) {
//			currentPage = 1;
//		} else if (currentPage > pageTotalCount) {
//			currentPage = pageTotalCount;
//		}
//
//		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
//		int endNavi = startNavi + naviCountPerPage - 1;
//
//		if (endNavi > pageTotalCount) {
//			endNavi = pageTotalCount;
//		}
//
//		boolean needPrev = true;
//		boolean needNext = true;
//		
//
//		if (startNavi == 1) {
//			needPrev = false;
//		}
//		if (endNavi == pageTotalCount) {
//			needNext = false;
//		}
//		StringBuilder sb = new StringBuilder();
//
//		if (startNavi != 1) {
//			sb.append("<a href ='/schedule/scheduleList.schedule?cpage=1'><맨 앞으로></a>");
//			sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
//		}
//
//		if (needPrev) {
//			sb.append("<a href ='/schedule/scheduleList.schedule.cpage=" + (startNavi - 1) + "'>◀</a>");
//		}
//		for (int i = startNavi; i <= endNavi; i++) {
//			sb.append("<a href ='/schedule/scheduleList.schedule?cpage=" + i + "'>" + i + "</a>");
//			sb.append(" ");
//		}
//		if (needNext) {
//			sb.append("<a href ='/project/enterProjectList.project?cpage=" + (endNavi + 1) + "'>▶</a>");
//		}
//
//		if (endNavi != pageTotalCount) {
//			sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
//			sb.append("<a href ='/schedule/scheduleList.schedule?cpage=" + pageTotalCount + "'>" + "<맨 끝으로></a>");
//		}
//
//		return sb.toString();
//	}

	public void addDateStr(List<ScheduleDTO> list) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for(ScheduleDTO dto : list) {
			dto.setSch_start_date_sc(simpleDateFormat.format(dto.getSch_start_date()));
			dto.setSch_end_date_sc(simpleDateFormat.format(dto.getSch_end_date()));
		}
	}
	
	public void addDateStr2(ScheduleDTO dtos) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dtos.setSch_start_date_sc(simpleDateFormat.format(dtos.getSch_start_date()));
		dtos.setSch_end_date_sc(simpleDateFormat.format(dtos.getSch_end_date()));
		
	}

	public List<ScheduleDTO> listAllSchedule(String id) throws Exception{
		return sdao.listAllSchedule(id);
	}

	public ScheduleDTO scheduleView(int sch_seq) throws Exception{
		return sdao.scheduleView(sch_seq);
	}

	public int scheduleDelete(int sch_seq) {
		return sdao.scheduleDelete(sch_seq);
	}
	
	public ScheduleDTO scheduleModifyBefore(int sch_seq) {
		return sdao.scheduleModifyBefore(sch_seq);
	}

	public int scheduleModify(ScheduleDTO dto) {
		return sdao.scheduleModify(dto);
	}

	public String dateconverter(String dateString) {
		return dateString.substring(0,10);
	}
	
	
	public List<Company_holidayDTO> loadComHd(){
		return sdao.loadComHd();
	}
	
	public int inserthol(Company_holidayDTO dto) throws Exception{
		return sdao.inserthol(dto);
	}
	
	public int deleteComhd(int comp_hd_seq) {
		return sdao.deleteComhd(comp_hd_seq);
	}
	
	public int updateComhd(Company_holidayDTO dto) throws Exception{
		return sdao.updateComhd(dto);
	}

	public List<Company_holidayDTO> holidaySchedule() throws Exception{
		return sdao.holidaySchedule();
	}

	public void addhDateStr(List<Company_holidayDTO> hlist) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM-dd");
		
		for(Company_holidayDTO dto : hlist) {
			dto.setComp_hd_date_str(simpleDateFormat.format(dto.getComp_hd_date()));
		}
	}

	public Company_holidayDTO holidayScheduleView(int comp_hd_seq) throws Exception{
		return sdao.holidayScheduleView(comp_hd_seq);
	}

	public void addhDateStr2(Company_holidayDTO chdto) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		chdto.setComp_hd_date_str(simpleDateFormat.format(chdto.getComp_hd_date()));
		
	}


//	public String dateHdconverter(String dateHdString) {
//		return dateHdString.substring(0,10);
//	}


}
