package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.DepartmentDAO;
import kh.gw.dto.DepartmentDTO;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentDAO ddao;
	
	public List<DepartmentDTO> listDept() throws Exception{
		return ddao.listDept();
	}
}
