package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.MessageDAO;
import kh.gw.dto.MessageDTO;

@Service
public class MessageService {
	@Autowired
	private MessageDAO mdao;
	
	//쪽지 작성
	public int msgProc(MessageDTO mdto) throws Exception{
		return mdao.msgProc(mdto);
	}
	
	//수신함list 불러오기
	public List<MessageDTO> msgInBoxList(String id) throws Exception{
		return mdao.msgInBoxList(id);
	}
	
}
