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
	
	//쪽지 삭제(수신)
	public int msgDelete(int msg_seq) throws Exception{
		return db.update("Message.msgDelete",msg_seq);
	}
	
	//쪽지 삭제(발신)
	public int msgOutBoxDel(int msg_seq) throws Exception{
		return db.update("Message.msgOutBoxDel",msg_seq);
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
	
	//쪽지 chk박스로 보관함(수신)
	public int msgInCabinsert(String id, int msg_seq) throws Exception{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("msg_seq", msg_seq);
		return db.insert("Message.msgInCabinsert",param);
	}
	
	//쪽지 chk박스로 보관함(발신)
	public int msgOutCabinsert(String id, int msg_seq) throws Exception{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("msg_seq", msg_seq);
		return db.insert("Message.msgOutCabinsert",param);
	}
	
	//보관함 list(수신)
	public List<Map<String,Object>> msgCabInCpage(String id, int cpage) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE-1;
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("startRowNum", startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("id", id);
		return db.selectList("Message.msgCabInCpage",param);		
	}
	
	//보관함 list(발신)
	public List<MessageDTO> msgCabOutCpage(String id, int cpage) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE-1;
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("startRowNum", startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("id", id);
		return db.selectList("Message.msgCabOutCpage",param);		
	}
	
	//보관함 (수신) 리스트 사이즈
	public List<Map<String,Object>> msgCabInList(String id) throws Exception{
		return db.selectList("Message.msgCabInList",id);
	}
	
	//보관함 (발신) 리스트 사이즈
	public List<Map<String,Object>> msgCabOutList(String id) throws Exception{
		return db.selectList("Message.msgCabOutList",id);
	}
	
	//보관함 삭제
	public int delMsgCabList(String id, int msg_seq) throws Exception{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("msg_seq", msg_seq);
		return db.delete("Message.delMsgCabList",param);
	}
	
	//내게쓴쪽지함 list 불러오기
	public List<MessageDTO> msgMyBoxCpage(String id,int cpage) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE-1;
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("startRowNum", startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("id", id);
		return db.selectList("Message.msgMyBoxCpage",param);
	}
	
	//내게쓴쪽지함 사이즈 구하기
	public List<MessageDTO> msgMyBoxList(String id) throws Exception{
		return db.selectList("Message.msgMyBoxList",id);
	}
	
	//내게쓴쪽지함 상세페이지 삭제 버튼
	public int delMyMsg(int msg_seq) throws Exception{
		return db.update("Message.delMyMsg",msg_seq);
	}
	
	public String msgCount(String msg_id) throws Exception{
		return db.selectOne("Message.msgCount",msg_id);
	}
	
	//메인 팝업 msg
	public List<MessageDTO> kgsMsgList(String id, int cpage) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_POP_UP+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_POP_UP-1;
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("startRowNum", startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("id", id);
		return db.selectList("Message.msgInBoxCpage",param);
	}
	
}
