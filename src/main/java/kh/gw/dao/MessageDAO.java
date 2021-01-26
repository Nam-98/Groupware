package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.MessageDTO;

@Repository
public class MessageDAO {
	@Autowired
	private SqlSession db;
	
	public int msgProc(MessageDTO mdto) throws Exception{
		return db.insert("Message.msgProc",mdto);
	}
	
	public List<MessageDTO> msgInBoxList(String id) throws Exception{
		return db.selectList("Message.msgInBoxList",id);
	}
}
