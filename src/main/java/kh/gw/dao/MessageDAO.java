package kh.gw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.MessageDTO;
import kh.gw.dto.Message_attached_filesDTO;
import kh.gw.statics.BoardConfigurator;

@Repository
public class MessageDAO {
	@Autowired
	private SqlSession db;
	
	//쪽지 작성
	public int msgProc(MessageDTO mdto) throws Exception{
		return db.insert("Message.msgProc",mdto);
	}
	
	//최근 seq를 구하기
	public int getLatestSeqById(String id) throws Exception{
		return db.selectOne("Message.getLatestSeqById",id);
	}
	
	//첨부파일 저장
	public int msgFiles(Message_attached_filesDTO adto) throws Exception{
		return db.insert("Message.msgFiles",adto);
	}
	
	//list에서 쪽지 제목 클릭 시 읽은 날짜 표시
	public int readDate(int msg_seq) throws Exception{
		return db.update("Message.readDate", msg_seq);
	}
	
	//첨부파일 list 받아오기
	public List<Message_attached_filesDTO> attFilesAll(int msg_seq) throws Exception{
		return db.selectList("Message.attFilesAll",msg_seq);
	}
	
	//쪽지 상세 보기
	public MessageDTO msgView(int msg_seq) throws Exception{
		return db.selectOne("Message.msgView",msg_seq);
	}
	
	//쪽지 상세보기에서 삭제 버튼 클릭 시
	public int msgDelete(int msg_seq) throws Exception{
		return db.delete("Message.msgDelete",msg_seq);
	}
	
	//쪽지 수신함 list size구하기
	public List<MessageDTO> msgInBoxList(String id) throws Exception{
		return db.selectList("Message.msgInBoxList",id);
	}
	
	//쪽지 수신한 cpage 구하기
	public List<MessageDTO> msgInBoxCpage(String id, int cpage) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE -1;
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("id", id);
		return db.selectList("Message.msgInBoxCpage",param);
	}
	
	//발신함 list
	public List<MessageDTO> msgOutBoxList(String id) throws Exception{
		return db.selectList("Message.msgOutBoxList",id);
	}
	
	//발신함 cpage구하기
	public List<MessageDTO> msgOutBoxCpage(String id, int cpage) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE -1;
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("id", id);
		return db.selectList("Message.msgOutBoxCpage",param);
	}
	
}
