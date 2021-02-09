package kh.gw.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ScheduleDTO;

@Repository
public class ScheduleDAO {
	@Autowired
	private SqlSession db;

	public int insertSchedule(ScheduleDTO dto) {
		return db.insert("Schedule.insertSchedule",dto);
	}

	public List<ScheduleDTO> scheduleListProc(Date sch_start_date) {
		return db.selectList("Schedule.scheduleListProc", sch_start_date);
	}
}
