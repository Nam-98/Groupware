package kh.gw.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ScheduleDAO;
import kh.gw.dto.ScheduleDTO;

@Service
public class ScheduleService {
	@Autowired
	private ScheduleDAO sdao;

	public int insertSchedule(ScheduleDTO dto) {
		return sdao.insertSchedule(dto);
	}

	public List<ScheduleDTO> scheduleListProc(Date sch_start_date) {
		return sdao.scheduleListProc(sch_start_date);
	}
}
