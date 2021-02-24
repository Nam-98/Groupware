package kh.gw.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.Company_holidayDTO;
import kh.gw.dto.ScheduleDTO;
import kh.gw.statics.BoardConfigurator;

@Repository
public class ScheduleDAO {
	@Autowired
	private SqlSession db;

	public int insertSchedule(ScheduleDTO dto) throws Exception{
		return db.insert("Schedule.insertSchedule",dto);
	}

//	public List<ScheduleDTO> listByCpage(int cpage) throws Exception{
//		int startRowNum = (cpage - 1) * BoardConfigurator.RECORD_COUNT_PER_PAGE + 1;
//		int endRowNum = startRowNum + BoardConfigurator.RECORD_COUNT_PER_PAGE - 1;
//		
//		Map<String,Object> map = new HashMap<>();
//		map.put("startRowNum",startRowNum);
//		map.put("endRowNum",endRowNum);
//		
//		return db.selectList("Schedule.listByCpage",map);
//	}

	public List<ScheduleDTO> getList() throws Exception{
		return db.selectList("Schedule.getList");
	}

	public List<ScheduleDTO> listAllSchedule(String id) throws Exception{
		return db.selectList("Schedule.listAllSchedule", id);
	}

	public ScheduleDTO scheduleView(int sch_seq) throws Exception{
		return db.selectOne("Schedule.scheduleView", sch_seq);
	}

	public int scheduleDelete(int sch_seq) {
		return db.delete("Schedule.scheduleDelete", sch_seq);
	}
	
	public ScheduleDTO scheduleModifyBefore(int sch_seq) {
		return db.selectOne("Schedule.scheduleModifyBefore", sch_seq);
	}

	public int scheduleModify(ScheduleDTO dto) {
		return db.update("Schedule.scheduleModify", dto);
	}
	
	public List<Company_holidayDTO> loadComHd(){
		return db.selectList("Schedule.loadComHd");
	}
	
	public int inserthol(Company_holidayDTO dto) throws Exception{
		return db.insert("Schedule.inserthol",dto);
	}
	
	public int deleteComhd(int comp_hd_seq) {
		return db.delete("Schedule.deleteComhd",comp_hd_seq);
	}
	
	public int updateComhd(Company_holidayDTO dto) {
		System.out.println(dto.getComp_hd_name());
		System.out.println(dto.getComp_hd_date());
		return db.update("Schedule.updateComhd", dto);
	}
	
}
