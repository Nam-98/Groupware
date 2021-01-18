package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ScheduleDAO;

@Service
public class ScheduleService {
	@Autowired
	private ScheduleDAO sdao;
}
