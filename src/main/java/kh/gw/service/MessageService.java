package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.MessageDAO;
import kh.gw.dto.MessageDTO;
import kh.gw.statics.BoardConfigurator;

@Service
public class MessageService {
	@Autowired
	private MessageDAO mdao;
	
	//쪽지 작성
	public int msgProc(MessageDTO mdto) throws Exception{
		return mdao.msgProc(mdto);
	}
	
	//list에서 쪽지 제목 클릭 시 읽은 날짜 표시
	public int readDate(int msg_seq) throws Exception{
		return mdao.readDate(msg_seq);
	}
	
	//쪽지 상세 보기
	public MessageDTO msgView(int msg_seq) throws Exception{
		return mdao.msgView(msg_seq);
	}
	
	//쪽지 상세보기에서 삭제 버튼 클릭 시
	public int msgDelete(int msg_seq) throws Exception{
		return mdao.msgDelete(msg_seq);
	}
	
	//수신함list 불러오기
	public List<MessageDTO> msgInBoxList(String id) throws Exception{
		return mdao.msgInBoxList(id);
	}
	
	//수신함 navi 불러오기
	public String inBoxGetNavi(int currentPage,String id) throws Exception{
		int recordTotalCount = mdao.msgInBoxList(id).size(); //총 데이터 개수

		BoardConfigurator configurator = new BoardConfigurator();

		int recordCountPerPage = configurator.RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = configurator.NAVI_COUNT_PER_PAGE;

		int pageTotalCount;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount/recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount/recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage -1 ;

		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if(startNavi != 1) {
			sb.append("<a href='/message/msgInBoxList.message?cpage=1> << </a>" + " ");
		}
		if(needPrev) {
			sb.append("<a href='/message/msgInBoxList.message?cpage=" + (startNavi-1)+"'> < </a>" + " ");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/message/msgInBoxList.message?cpage=" +i+"'>"+i+"</a>"+" " );
		}
		if(endNavi != pageTotalCount) {
			sb.append("<a href='/message/msgInBoxList.message?cpage="+pageTotalCount+"'> >> </a>");
		}
		return sb.toString();
	}
	
}
