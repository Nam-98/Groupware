package kh.gw.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.dao.MessageDAO;
import kh.gw.dto.MessageDTO;
import kh.gw.dto.Message_attached_filesDTO;
import kh.gw.statics.BoardConfigurator;

@Service
public class MessageService {
	@Autowired
	private MessageDAO mdao;
	
	@Autowired
	private HttpSession session;
	
	
	
	//쪽지 작성
	public int msgProc(MessageDTO mdto) throws Exception{
		int result = mdao.msgProc(mdto);
		if(result > 0) {			
		int msg_seq = mdao.getLatestSeqById(mdto.getMsg_sender());
		System.out.println("================="+msg_seq);
		if(mdto.getAttfiles() != null) {
			this.msgUploadFile(mdto.getAttfiles(), msg_seq);
		}
		return 1;//파일업로드까지 성공시 2 출력
		}	
		return -1;//파일 X,일반 글만 업로드 1출력
	}
	
	private void msgUploadFile(List<MultipartFile> files, int msg_seq) throws Exception{
		System.out.println("======사이즈사이즈====="+files.size());
		for(MultipartFile file : files) {
		if(file.isEmpty()) {return;}
		String realPath = session.getServletContext().getRealPath("/resources/Message_attached_files");
		File filesPath = new File(realPath);
		
		if(!filesPath.exists()) {filesPath.mkdir();}
		
		String oriName = file.getOriginalFilename();
		System.out.println("=================oriname===="+oriName);
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		String savedName = uid+"_"+oriName;
		
		Message_attached_filesDTO adto = new Message_attached_filesDTO(msg_seq,oriName,savedName);
		int fileResult = mdao.msgFiles(adto);
		
		if(fileResult>0) {
			File targetLoc = new File(filesPath.getAbsoluteFile()+"/"+savedName);
			FileCopyUtils.copy(file.getBytes(), targetLoc);
		}
		}
	}
	
	//list에서 쪽지 제목 클릭 시 읽은 날짜 표시
	public int readDate(int msg_seq,String msg_receive_date) throws Exception{
		if(msg_receive_date.contentEquals(" ")) {
		return mdao.readDate(msg_seq);}
		return 1;
		
		
	}
	
	//첨부파일 list 받아오기
	public List<Message_attached_filesDTO> attFilesAll(int msg_seq) throws Exception{
		return mdao.attFilesAll(msg_seq);
	}
	
	//쪽지 상세 보기
	public MessageDTO msgView(int msg_seq) throws Exception{
		return mdao.msgView(msg_seq);
	}
	
	//쪽지 삭제 (수신)
	public int msgDelete(int msg_seq) throws Exception{
		return mdao.msgDelete(msg_seq);
	}
	
	//쪽지 삭제 (발신)
	public int msgOutBoxDel(int msg_seq) throws Exception{
		return mdao.msgOutBoxDel(msg_seq);
	}
	
	//수신함list 불러오기
	public List<MessageDTO> msgInBoxCpage(String id,int cpage) throws Exception{
		return mdao.msgInBoxCpage(id,cpage);
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
	
	//발신함 list
	public List<MessageDTO> msgOutBoxCpage(String id,int cpage) throws Exception{
		return mdao.msgOutBoxCpage(id,cpage);
	}
	
	//발신함 navi 불러오기
		public String outBoxGetNavi(int currentPage,String id) throws Exception{
			int recordTotalCount = mdao.msgOutBoxList(id).size(); //총 데이터 개수

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
				sb.append("<a href='/message/msgOutBoxList.message?cpage=1> << </a>" + " ");
			}
			if(needPrev) {
				sb.append("<a href='/message/msgOutBoxList.message?cpage=" + (startNavi-1)+"'> < </a>" + " ");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href='/message/msgOutBoxList.message?cpage=" +i+"'>"+i+"</a>"+" " );
			}
			if(endNavi != pageTotalCount) {
				sb.append("<a href='/message/msgOutBoxList.message?cpage="+pageTotalCount+"'> >> </a>");
			}
			return sb.toString();
		}
	
		//쪽지 chk박스로 보관함(수신)
		public int msgInCabinsert(String id, int msg_seq) throws Exception{
			return mdao.msgInCabinsert(id,msg_seq);
		}
		
		//쪽지 chk박스로 보관함(발신)
		public int msgOutCabinsert(String id, int msg_seq) throws Exception{
			return mdao.msgOutCabinsert(id,msg_seq);
		}
		
		//보관함 list(수신)
		public List<Map<String,Object>> msgCabInCpage(String id,int cpage) throws Exception{
			return mdao.msgCabInCpage(id,cpage);
		}
		
		//보관함 list(수신)
		public List<MessageDTO> msgCabOutCpage(String id,int cpage) throws Exception{
			return mdao.msgCabOutCpage(id,cpage);
		}
		
		//보관함 navi 불러오기(수신)
		public String msgCabInNavi(int currentPage,String id) throws Exception{
			int recordTotalCount = mdao.msgCabInList(id).size(); //총 데이터 개수

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
				sb.append("<a href='/message/msgCabList.message?cpage=1> << </a>" + " ");
			}
			if(needPrev) {
				sb.append("<a href='/message/msgCabList.message?cpage=" + (startNavi-1)+"'> < </a>" + " ");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href='/message/msgCabList.message?cpage=" +i+"'>"+i+"</a>"+" " );
			}
			if(endNavi != pageTotalCount) {
				sb.append("<a href='/message/msgCabList.message?cpage="+pageTotalCount+"'> >> </a>");
			}
			return sb.toString();
		}
		
		//보관함 navi 불러오기(발신)
		public String msgCabOutNavi(int currentPage,String id) throws Exception{
			int recordTotalCount = mdao.msgCabOutList(id).size(); //총 데이터 개수

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
				sb.append("<a href='/message/msgCabList.message?cpage=1> << </a>" + " ");
			}
			if(needPrev) {
				sb.append("<a href='/message/msgCabList.message?cpage=" + (startNavi-1)+"'> < </a>" + " ");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href='/message/msgCabList.message?cpage=" +i+"'>"+i+"</a>"+" " );
			}
			if(endNavi != pageTotalCount) {
				sb.append("<a href='/message/msgCabList.message?cpage="+pageTotalCount+"'> >> </a>");
			}
			return sb.toString();
		}
	
	
}
