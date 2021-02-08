package kh.gw.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.MemberDAO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO mdao;
	
	public int loginCheck(MemberDTO dto) throws Exception{
		String result = mdao.loginCheck(dto);
		if(result!=null) {return 1;}
		else return 0;
	}
	
	public MemberDTO getMemInfo(String id) throws Exception{
		return mdao.getMemInfo(id);
	}
	
	public List<MemberDTO> listMem() throws Exception{
		return mdao.listMem();
	}
	
	public List<DepartmentDTO> listDept() throws Exception{
		return mdao.listDept();
	}
	public Map<String,Object> getMyInfo(String id) throws Exception{
		return mdao.getMyInfo(id);
	}
	public int insertMem(MemberDTO dto) throws Exception{
		return mdao.insertMem(dto);
	}
	public void updateMemList(List<MemberDTO> list) throws Exception {
		for(MemberDTO dto : list) {
			mdao.updateMemInfo(dto);
		}
	}
}
