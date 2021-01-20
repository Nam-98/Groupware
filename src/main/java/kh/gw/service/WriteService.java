package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.WriteDAO;
import kh.gw.dto.WriteDTO;
import kh.gw.statics.BoardConfigurator;

@Service
public class WriteService {
	@Autowired
	private WriteDAO wdao;
	
	//----------------공지사항 list cpage
	public List<WriteDTO> noticeByCpage(int cpage, String write_code) throws Exception{
		return wdao.noticeByCpage(cpage, write_code);
	}
	
	//----------------공지사항 list navi
	public String noticeGetNavi(int currentPage,String write_code) throws Exception{
		int recordTotalCount = wdao.noticeList(write_code).size(); //총 데이터 개수
		
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
			sb.append("<a href='/write/noticeList.write?cpage=1> << </a>" + " ");
		}
		if(needPrev) {
			sb.append("<a href='/write/noticeList.write?cpage=" + (startNavi-1)+"'> < </a>" + " ");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/write/noticeList.write?cpage=" +i+"'>"+i+"</a>"+" " );
		}
		if(endNavi != pageTotalCount) {
			sb.append("<a href='/write/noticeList.write?cpage="+pageTotalCount+"'> >> </a>");
		}
		return sb.toString();
	}
}
