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
	public List<WriteDTO> noticeList(String write_code) throws Exception{
		return db.selectList("Wrtie.noticeList", write_code);
	}
}
