package kh.gw.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
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
	
	@Autowired 
	private ServletContext servletContext;
	
	
	
	//쪽지 작성
	public int msgProc(MessageDTO mdto) throws Exception{
		int msg_seq = mdao.newMsgSeqGet();
		mdto.setMsg_seq(msg_seq);
		String contents = mdto.getMsg_contents();
		mdto.setMsg_contents("temp");
		int result = mdao.msgProc(mdto);
		
		
		if(result > 0) {			
		System.out.println("================="+msg_seq);
		if(mdto.getAttfiles() != null) {
			this.msgUploadFile(mdto.getAttfiles(), msg_seq);
		}
		
		this.makeTempContent(msg_seq, contents);//컨텐츠 파일을 html파일로 저장(이미지삽입 대비)
		
		return 1;//파일업로드까지 성공시 2 출력
		}	
		return -1;//파일 X,일반 글만 업로드 1출력
	}
	
	
	//이미지 삽입용
	private String makeTempContent(int msg_seq, String contents) throws Exception {
		// WARING!!!!!! -> project workspace경로가 아닌 project server가 가동되는 경로에 생되므로
		// Project clean시 생성한 file도 삭제됩니다. clean전에 반드시 backup 해주세요!!!!!
		String sDir = servletContext.getRealPath("/resources/msg_contents");// src/main/webapp/resources/approval_contents폴더
																				// 경로 출력
		String sFileName = msg_seq + ".html";// 저장할 file이름은 seq.html이 될것입니다.
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
	
	
	
	//파일 업로드
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
	public int readDate(int msg_seq,String msg_receive_date_str) throws Exception{
		if(msg_receive_date_str.contentEquals("읽지않음")) {
			return mdao.readDate(msg_seq);}
		return 0;
		
		
	}
	
	//첨부파일 list 받아오기
	public List<Message_attached_filesDTO> attFilesAll(int msg_seq) throws Exception{
		return mdao.attFilesAll(msg_seq);
	}
	
	//쪽지 상세 보기
	public MessageDTO msgView(int msg_seq) throws Exception{
		MessageDTO mdto = mdao.msgView(msg_seq);
		if(this.isHtmlCheck(msg_seq)) {
		mdto.setMsg_contents(this.getHtmlText(msg_seq));//html 파일 내용 불러오기.
		}
		return mdto;
	}
	
	//쪽지 내용에 html파일 유무 확인
	private boolean isHtmlCheck(int msg_seq) throws Exception{
	      //src/main/webapp/resources/write_contents폴더 경로 출력
	      String sDir = servletContext.getRealPath("/resources/msg_contents");
	      //저장할 file이름은 게시판코드_글id.html이 될것입니다.
	      String sFileName = msg_seq+".html";
	      
	      StringBuilder sb = new StringBuilder();
	         //sDir 폴더속 sFileName을 가져온다.
	         File file = new File(sDir, sFileName);
	         if(!file.exists()) {
	        	 return false;
	         }return true;
	}
	
	//html 파일 내용 불러오기.
	public String getHtmlText (int msg_seq) throws Exception {
	      //----------------------html파일 전달하기
	      int cur = 0;
	      
	      //src/main/webapp/resources/write_contents폴더 경로 출력
	      String sDir = servletContext.getRealPath("/resources/msg_contents");
	      //저장할 file이름은 게시판코드_글id.html이 될것입니다.
	      String sFileName = msg_seq+".html";
	      
	      StringBuilder sb = new StringBuilder();
	         //sDir 폴더속 sFileName을 가져온다.
	         File file = new File(sDir, sFileName);

	         FileReader file_reader = new FileReader(file);

	         while((cur = file_reader.read()) != -1){
	            sb.append((char)cur);
	         }
	         
	         file_reader.close();
	     	      
	      return sb.toString() ;
	      
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
		
		//쪽지 캐비넷 유무
		public int msgCabCheck(int msg_seq) throws Exception{
			return mdao.msgCabCheck(msg_seq);
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
		
		//보관함 삭제
		public int delMsgCabList(String id, int msg_seq) throws Exception{
			return mdao.delMsgCabList(id,msg_seq);
		}
		
		//내게쓴쪽지함 list불러오기
		public List<MessageDTO> msgMyBoxCpage(String id,int cpage) throws Exception{
			return mdao.msgMyBoxCpage(id,cpage);
		}
		
		//내게쓴 쪽지함 navi 불러오기
		public String msgMyBoxGetNavi(int currentPage,String id) throws Exception{
			int recordTotalCount = mdao.msgMyBoxList(id).size(); //총 데이터 개수

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
				sb.append("<a href='/message/msgMyBoxList.message?cpage=1> << </a>" + " ");
			}
			if(needPrev) {
				sb.append("<a href='/message/msgMyBoxList.message?cpage=" + (startNavi-1)+"'> < </a>" + " ");
			}
			for(int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href='/message/msgMyBoxList.message?cpage=" +i+"'>"+i+"</a>"+" " );
			}
			if(endNavi != pageTotalCount) {
				sb.append("<a href='/message/msgMyBoxList.message?cpage="+pageTotalCount+"'> >> </a>");
			}
			return sb.toString();
		}
		
		//내게쓴쪽지함 상세페이지 삭제 버튼
		public int delMyMsg(int msg_seq) throws Exception{
			return mdao.delMyMsg(msg_seq);
		}
	
		//msg count
		public String msgCount(String id) throws Exception{
			return mdao.msgCount(id);
		}
		
		//메인 팝업 msg
		public List<MessageDTO> kgsMsgList(String id, int cpage) throws Exception{
			return mdao.kgsMsgList(id,cpage);
		}
		
}
