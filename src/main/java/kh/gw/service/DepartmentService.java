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
	public int nxDeptAdd(String sRtn) {
		String[] arr = sRtn.split("|");
		DepartmentDTO dto = new DepartmentDTO();
		dto.setDept_name(arr[0]);
		dto.setDept_parent_code(Integer.parseInt(arr[1]));
		dto.setDept_level(Integer.parseInt(arr[2]));
		
		return 0;
	}
}
