package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.WriteDAO;

@Service
public class WriteService {
	@Autowired
	private WriteDAO wdao;
}
