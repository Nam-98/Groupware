package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ProjectDAO;

@Service
public class ProjectService {
	@Autowired
	private ProjectDAO pdao;
	
}
