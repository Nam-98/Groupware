package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ProjectDAO;
import kh.gw.dto.ProjectDTO;

@Service
public class ProjectService {
	@Autowired
	private ProjectDAO pdao;
	
	public List<ProjectDTO> getList() throws Exception{
		return pdao.getList();
	}
}
