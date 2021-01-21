package kh.gw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.WriteDTO;
import kh.gw.statics.BoardConfigurator;

@Repository
public class WriteDAO {
	@Autowired
	private SqlSession db;

	//------------------- 공지사항 cpage
	public List<WriteDTO> noticeByCpage(int cpage,String write_code) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE -1;
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("writeCode", write_code);
		return db.selectList("Write.noticeByCpage",param);
	}

	//------------------- 공지사항 list
	public List<WriteDTO> noticeList(String writeCode) throws Exception{
		return db.selectList("Write.noticeList", writeCode);
	}

	//------------------ 제목 눌렀을 때 공지사항 상세
	public WriteDTO noticeView(int write_seq) throws Exception{
		return db.selectOne("Write.noticeView", write_seq);
	}

	//------------------ 조회수
	public int addViewCount(int write_seq) throws Exception{
		return db.update("Write.updateViewCount", write_seq);
	}

	//------------------ 공지사항 검색 cpage
	public List<WriteDTO> noticeSearch(int cpage, String condition, String writeCode, String keyword) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE -1;
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("condition",condition);
		param.put("writeCode",writeCode);
		param.put("keyword",keyword);
		return db.selectList("Write.noticeSearch",param);
	}

	//------------------ 공지사항 검색 navi
	public List<WriteDTO> noticeSearchList (String writeCode, String condition, String keyword) throws Exception{
		Map<String,String> param = new HashMap<String, String>();
		param.put("writeCode", writeCode);
		param.put("condition", condition);
		param.put("keyword", keyword);
		return db.selectList("Write.noticeSearchList",param);
	}

	//------------------- 시스템 공지사항 list
	public List<WriteDTO> systemNoticeList(String writeCode) throws Exception{
		return db.selectList("Write.systemNoticeList", writeCode);
	}

	//------------------ 시스템 공지사항 검색 navi
	public List<WriteDTO> systemNoticeSearchList (String writeCode, String condition, String keyword) throws Exception{
		Map<String,String> param = new HashMap<String, String>();
		param.put("writeCode", writeCode);
		param.put("condition", condition);
		param.put("keyword", keyword);
		return db.selectList("Write.noticeSearchList",param);
	}
}
