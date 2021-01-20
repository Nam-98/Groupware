package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.MemberDAO;
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

}
