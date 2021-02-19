package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.DepartmentDAO;
import kh.gw.dao.WebhardDAO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.Webhard_dirDTO;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentDAO ddao;
	@Autowired
	private WebhardDAO whdao;
	public List<DepartmentDTO> listDept() throws Exception{
		return ddao.listDept();
	}
	public int nxDeptAdd(DepartmentDTO dto) {
		int dir_seq = whdao.newDirSeqGet();
		int dept_code = ddao.getNewCode();
		dto.setDept_code(dept_code);
		dto.setDept_dir_id(dir_seq);
		//최상위 부서라면 tree code에 자기 자신의 dept_code를 넣는다.  
		if(dto.getDept_level()==1) {
			dto.setDept_tree_code(Integer.toString(dept_code));
		}else {
			String tree_code = dto.getDept_tree_code()+"_"+Integer.toString(dept_code);
			dto.setDept_tree_code(tree_code);
		}
		
		System.out.println("tree_code : "+dto.getDept_tree_code());
		
		Webhard_dirDTO dirDto = new Webhard_dirDTO();
		dirDto.setWh_dir_name(dto.getDept_name());
		dirDto.setWh_dir_seq(dir_seq);
		if(dto.getDept_level()==1) {
			dirDto.setWh_dir_parent_seq(2);//부서 dir들의 최상의 dir
		}else {
			//부모 dept의 dir값을 가져옴
			int dept_parent_dir = ddao.nxGetDeptDir(dto.getDept_code_parent());
			
			dirDto.setWh_dir_parent_seq(dept_parent_dir);
		}
		
		whdao.newDirMake(dirDto);//webhard_dir의 db에 추가
		ddao.nxDeptAdd(dto);//department의 db에 추가
		return 0;
	}
	
	public int nxDeptDel(int dept_code) {
		return ddao.nxDeptDel(dept_code);
	}
	
	public int nxDeptUdt(DepartmentDTO dto) {
		return ddao.nxDeptUdt(dto);
	}
	


}
