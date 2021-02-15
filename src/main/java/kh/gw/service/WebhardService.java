package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.WebhardDAO;
import kh.gw.dto.Webhard_accessDTO;
import kh.gw.dto.Webhard_dirDTO;

@Service
public class WebhardService {
	
	@Autowired
	private WebhardDAO whdao;
	
	public int personalMkdir(String sessionId) {
		int count = personalDirIsExist(sessionId);
		if (count < 1) {
			// 디렉토리 할당에 사용할 seq 선점
			int seq = newDirSeqGet();
			
			// 최상위 디렉토리 생성
			Webhard_dirDTO dirDTO = new Webhard_dirDTO();
			dirDTO.setWh_dir_seq(seq);
			dirDTO.setWh_dir_name("TOP");
			newDirMake(dirDTO);
			
			// 개인 아이디에 할당
			Webhard_accessDTO accDTO = new Webhard_accessDTO();
			accDTO.setWh_id(sessionId);
			accDTO.setWh_dir_seq(seq);
			accDTO.setWh_dir_type_code(0);
			dirAssign(accDTO);
			
		}
		
		return 0;
	}
	
	public int personalDirIsExist(String sessionId) {
		return whdao.personalDirIsExist(sessionId);
	}
	
	public int newDirSeqGet() {
		return whdao.newDirSeqGet();
	}
	
	public int newDirMake(Webhard_dirDTO dirDTO) {
		return whdao.newDirMake(dirDTO);
	}
	
	public int dirAssign(Webhard_accessDTO accDTO) {
		return whdao.dirAssign(accDTO);
	}
	
	
	
	
	
	
	
	
}
