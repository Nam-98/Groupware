package kh.gw.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.WriteDAO;
import kh.gw.dto.ScheduleDTO;
import kh.gw.dto.WriteDTO;
import kh.gw.dto.Write_commentsDTO;
import kh.gw.statics.BoardConfigurator;

@Service
public class WriteService {
	
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	private WriteDAO wdao;
	
	@Autowired
	private HttpSession session;

	//----------------게시판 list cpage
	public List<WriteDTO> noticeByCpage(int cpage, String writeCode) throws Exception{
		return wdao.noticeByCpage(cpage, writeCode);
	}

	//----------------공지사항 list navi
	public String noticeGetNavi(int currentPage, String write_code) throws Exception{
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

	//--------------- seq를 이용해서 공지사항 상세
	public WriteDTO noticeView(int write_seq) throws Exception{
		return wdao.noticeView(write_seq);
	}

	//--------------- 게시판 조회수
	public int addViewCount(int write_seq) throws Exception{
		return wdao.addViewCount(write_seq);
	}

	//--------------- 게시판 검색 cpage
	public List<WriteDTO>noticeSearch(int cpage, String condition, String writeCode, String keyword) throws Exception{
		return wdao.noticeSearch(cpage,condition,writeCode,keyword);
	}

	//--------------- 공지사항 search navi
	public String noticeSearchNavi(int currentPage,String condition,String writeCode,String keyword) throws Exception{
		int recordTotalCount = wdao.noticeSearchList(writeCode, condition, keyword).size(); //총 데이터 개수
		System.out.println(recordTotalCount);

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
			sb.append("<a href='/write/noticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=1> << </a>" + " ");
		}
		if(needPrev) {
			sb.append("<a href='/write/noticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" + (startNavi-1)+"'> < </a>" + " ");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/write/noticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" +i+"'>"+i+"</a>"+" " );
		}
		if(endNavi != pageTotalCount) {
			sb.append("<a href='/write/noticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage="+pageTotalCount+"'> >> </a>");
		}
		return sb.toString();
	}

	//----------------시스템 공지사항 list navi
	public String systemNoticeGetNavi(int currentPage, String write_code) throws Exception{
		int recordTotalCount = wdao.systemNoticeList(write_code).size(); //총 데이터 개수

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
			sb.append("<a href='/write/systemNoticeList.write?cpage=1> << </a>" + " ");
		}
		if(needPrev) {
			sb.append("<a href='/write/systemNoticeList.write?cpage=" + (startNavi-1)+"'> < </a>" + " ");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/write/systemNoticeList.write?cpage=" +i+"'>"+i+"</a>"+" " );
		}
		if(endNavi != pageTotalCount) {
			sb.append("<a href='/write/systemNoticeList.write?cpage="+pageTotalCount+"'> >> </a>");
		}
		return sb.toString();
	}

	//------------ 시스템 공지사항 search navi
	public String systemNoticeSearchNavi(int currentPage,String condition,String writeCode,String keyword) throws Exception{
		int recordTotalCount = wdao.systemNoticeSearchList(writeCode, condition, keyword).size(); //총 데이터 개수
		System.out.println(recordTotalCount);

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
			sb.append("<a href='/write/systemNoticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=1> << </a>" + " ");
		}
		if(needPrev) {
			sb.append("<a href='/write/systemNoticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" + (startNavi-1)+"'> < </a>" + " ");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/write/systemNoticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" +i+"'>"+i+"</a>"+" " );
		}
		if(endNavi != pageTotalCount) {
			sb.append("<a href='/write/sysemNoticeSearch.write?condition="+condition+"&keyword="+keyword+"&cpage="+pageTotalCount+"'> >> </a>");
		}
		return sb.toString();
	}

	//------------ 회사 게시판 search navi
	public String boardSearchNavi(int currentPage,String condition,String writeCode,String keyword) throws Exception{
		int recordTotalCount = wdao.systemNoticeSearchList(writeCode, condition, keyword).size(); //총 데이터 개수
		System.out.println(recordTotalCount);

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
			sb.append("<a href='/write/boardSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=1> << </a>" + " ");
		}
		if(needPrev) {
			sb.append("<a href='/write/boardSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" + (startNavi-1)+"'> < </a>" + " ");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/write/boardSearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" +i+"'>"+i+"</a>"+" " );
		}
		if(endNavi != pageTotalCount) {
			sb.append("<a href='/write/boardSearch.write?condition="+condition+"&keyword="+keyword+"&cpage="+pageTotalCount+"'> >> </a>");
		}
		return sb.toString();
	}
	
	
	//------------- 회사 게시판 글쓰기
	public int insertBoardWrite(WriteDTO dto) throws Exception{
		int write_seq = wdao.getNewBoardSeq();
		dto.setWrite_seq(write_seq);
		
		this.makeTempContent(write_seq, dto.getWrite_contents());
		
		return wdao.insertBoardWrite(dto);
	}
	
	//------------- 회사 게시글 삭제
	public int deleteBoardWrite(int write_seq) {
		return wdao.deleteBoardWrite(write_seq);
	}
	//------------- 회사 게시글 수정 전
	public WriteDTO modifyBeforeBoard(int write_seq) throws Exception{
		return wdao.modifyBeforeBoard(write_seq);
	}
	//------------- 회사 게시글 수정 후
	public int modifyAfterBoard(WriteDTO dto) throws Exception{
		return wdao.modifyAfterBoard(dto);
	}
	
	
	//------------ 갤러리 게시판 search navi
		public String gallerySearchNavi(int currentPage,String condition,String writeCode,String keyword) throws Exception{
			int recordTotalCount = wdao.systemNoticeSearchList(writeCode, condition, keyword).size(); //총 데이터 개수
			System.out.println(recordTotalCount);

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
				sb.append("<a href='/write/boardGallerySearch.write?condition="+condition+"&keyword="+keyword+"&cpage=1> << </a>" + " ");
			}
			if(needPrev) {
				sb.append("<a href='/write/boardGallerySearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" + (startNavi-1)+"'> < </a>" + " ");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href='/write/boardGallerySearch.write?condition="+condition+"&keyword="+keyword+"&cpage=" +i+"'>"+i+"</a>"+" " );
			}
			if(endNavi != pageTotalCount) {
				sb.append("<a href='/write/boardGallerySearch.write?condition="+condition+"&keyword="+keyword+"&cpage="+pageTotalCount+"'> >> </a>");
			}
			return sb.toString();
		}
		
		//------------- 갤러리 게시판 글쓰기
		public int insertGalleryWrite(WriteDTO dto) throws Exception{
			
			int write_seq = wdao.getNewBoardSeq();
			dto.setWrite_seq(write_seq);
			
			this.makeTempContent(write_seq, dto.getWrite_contents());
			
			return wdao.insertGalleryWrite(dto);
		}
		
		//------------- 갤러리 게시판 글 삭제
		public int deleteGalleryWrite(int write_seq) {
			return wdao.deleteGalleryWrite(write_seq);
		}
		
		//------------- 갤러리 게시글 수정 전
		public WriteDTO modifyBeforeGallery(int write_seq) throws Exception{
			return wdao.modifyBeforeGallery(write_seq);
		}
		//------------- 갤러리 게시글 수정 후
		public int modifyAfterGallery(WriteDTO dto) throws Exception{
			return wdao.modifyAfterGallery(dto);
		}

		public int commentWrite(Write_commentsDTO dto) {
			return wdao.commentWrite(dto);
		}
		
		//현재 쓴 댓글부터 select
		public List<Write_commentsDTO> commentNow(Write_commentsDTO dto) {
			return wdao.commentNow(dto);
		}
		// 댓글 리스트로 보이게 하기
		public List<Write_commentsDTO> commentView(int write_seq) {
			return wdao.commentView(write_seq);
		}
		//댓글 삭제
		public int commentDelete(int write_cmt_seq) throws Exception{
			return wdao.commentDelete(write_cmt_seq);
		}

		public List<Write_commentsDTO> reCommentList(Write_commentsDTO dto) {
			return wdao.reCommentList(dto);
		}

		public int reCommentWrite(Write_commentsDTO dto) {
			return wdao.reCommentWrite(dto);
		}

		public List<Write_commentsDTO> reCommentNow(Write_commentsDTO dto) {
			return wdao.reCommentNow(dto);
		}
		
		public int insertWrite(WriteDTO dto) {
			return wdao.insertWrite(dto);
			
		}

		public List<WriteDTO> listWr() {
			return wdao.listWr();
		}

		public void updateWrList(List<WriteDTO> list) throws Exception{
			for(WriteDTO dto : list) {
				wdao.updateWrList(dto);
			}
			
		}

		public int deleteWrList(WriteDTO dto) throws Exception{
			return wdao.deleteWrList(dto);
			
		}

		public List<WriteDTO> noticePopupList(int cpage, String write_code) throws Exception{
			return wdao.noticePopupList(cpage, write_code);
		}

		public List<WriteDTO> noticePopupView(String write_code) {
			return wdao.noticePopupView(write_code);
		}

		public void addDateStr(List<WriteDTO> wlist) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			for(WriteDTO dto : wlist) {
				dto.setWrite_reg_date_wr(simpleDateFormat.format(dto.getWrite_reg_date()));
			}
		}
		
		public void addDateStrOne(WriteDTO dtos) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

			dtos.setWrite_reg_date_wr(simpleDateFormat.format(dtos.getWrite_reg_date()));

		}

		public void addDateStrTwo(List<WriteDTO> dtos) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			for(WriteDTO dto : dtos) {
				dto.setWrite_reg_date_wr(simpleDateFormat.format(dto.getWrite_reg_date()));
			}
			
		}

		public List<WriteDTO> listBr() {
			return wdao.listBr();
		}
		
		private String makeTempContent(int write_seq, String contents) throws Exception {
			// WARING!!!!!! -> project workspace경로가 아닌 project server가 가동되는 경로에 생되므로
			// Project clean시 생성한 file도 삭제됩니다. clean전에 반드시 backup 해주세요!!!!!
			String sDir = servletContext.getRealPath("/resources/board_contents");// src/main/webapp/resources/approval_contents폴더
																					// 경로 출력
			String sFileName = write_seq + ".html";// 저장할 file이름은 seq.html이 될것입니다.
			File filesPath = new File(sDir);
			// 파일 디렉토리가 존재한지 검사 없다면 생성
			if (!filesPath.exists()) {
				filesPath.mkdir();
			}

			// BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상, 기록하고자 하는 파일의 크기가 100K를 넘을때)
			// sDir경로에 sFileName이름의 파일 생성함
			File conFile = new File(sDir, sFileName);
			BufferedWriter fw = new BufferedWriter(new FileWriter(conFile));

			// 파일안에 문자열 쓰기
			fw.write(contents);
			fw.flush();

			// 객체 닫기
			fw.close();
			return sFileName;
		}
		
		
		public String getHtmlText (int write_seq) throws Exception {
		      //----------------------html파일 전달하기
		      int cur = 0;
		      
		      //src/main/webapp/resources/write_contents폴더 경로 출력
		      String sDir = servletContext.getRealPath("/resources/board_contents");
		      //저장할 file이름은 게시판코드_글id.html이 될것입니다.
		      String sFileName = write_seq+".html";
		      
		      StringBuilder sb = new StringBuilder();
		         //sDir 폴더속 sFileName을 가져온다.
		         File file = new File(sDir, sFileName);
		         if(!file.exists()) {
		        	 return write_seq+"_contents";
		         }
		         FileReader file_reader = new FileReader(file);

		         while((cur = file_reader.read()) != -1){
		            sb.append((char)cur);
		         }
		         
		         file_reader.close();
		     	      
		      return sb.toString() ;
		      
		}
		// 대댓글 삭제
		public int commentReDelete(int write_cmt_seq) {
			return wdao.commentReDelete(write_cmt_seq);
		}

}
