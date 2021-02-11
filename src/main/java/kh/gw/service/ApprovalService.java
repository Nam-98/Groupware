package kh.gw.service;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import kh.gw.dao.ApprovalDAO;
import kh.gw.dto.ApprovalDTO;
import kh.gw.dto.Approval_attached_filesDTO;
import kh.gw.dto.Approval_commentsDTO;
import kh.gw.dto.Approval_signDTO;
import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.Approval_typeDTO;
import kh.gw.statics.ApprovalConfigurator;
import kh.gw.statics.ApprovalComparator;

@Service
public class ApprovalService {
	@Autowired
	private ApprovalDAO adao;
	@Autowired 
	private ServletContext servletContext;
	@Autowired
	private HttpSession session;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void resetConfig() {
		//매일 자정에 count, date 초기화
		ApprovalConfigurator.docsCount = 1;
	}
	
	public List<Approval_typeDTO> allDocsType (){
		return adao.allDocsType();
	}
	public List<Approval_sign_typeDTO> allSignType(){
		return adao.allSignType();
	}
	public int writeApp(ApprovalDTO dto) throws Exception {
		dto.setApp_id((String)session.getAttribute("id"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		Date today = new Date();
		String docsNum = sdf.format(today)+"-"+ApprovalConfigurator.docsCount;
		ApprovalConfigurator.docsCount++;
		dto.setApp_docs_num(docsNum);
		String contents = dto.getApp_contents();
		int result = adao.writeApp(dto);
		if(result>0) {
			int app_seq = adao.getLatestSeqById((String)session.getAttribute("id"));
			//첨부파일 저장
			if(dto.getAttachedfiles()!=null) {
				this.uploadAttachedFiles(dto.getAttachedfiles(), app_seq);	
			}
			//내용파일 저장
			String sFileName = this.makeTempContent(app_seq, contents);
			//// db에 temp로 저장되어 있는 contents를 파일 저장명으로 수정
			adao.contentsUpdate(app_seq, sFileName);
			return app_seq;
		}
		return -1; 
	}
	
	public int setInitAppSign(Approval_signDTO approval_signDTOList, int appSeq) {
		List<Approval_signDTO> signList = approval_signDTOList.getApproval_signDTOList();
		for(Approval_signDTO dto : signList) {
			dto.setApp_seq(appSeq);
			int result = adao.setInitAppSign(dto);
			if(result==0) {return -1;}
		}
		return 0;
	}
	
	
	private int uploadAttachedFiles(List<MultipartFile> attachedfiles, int app_seq) throws Exception {
		String realPath = servletContext.getRealPath("/resources/Approval_attached_files");
		for (MultipartFile file : attachedfiles) {
			if(file.isEmpty()) {return -1;}
			File filesPath = new File(realPath);
			// 이 file객체는 realPath에 실제로 해당 객체가 있을지 없을지 모르지만 이런 객체를 임의로 만들어 두고

			if (!filesPath.exists()) {
				filesPath.mkdir();
			}
			// 만약 clean등을 통해 filesPath에 실제로 폴더가 없다면 만들어 주라는 구문.

			String oriName = file.getOriginalFilename();
			String uid = UUID.randomUUID().toString().replaceAll("-", "");
			String savedName = uid + "_" + oriName;
			Approval_attached_filesDTO aaf = new Approval_attached_filesDTO(app_seq,oriName,savedName);
			int result = adao.insertAf(aaf);
			if(result>0) {
				File targetLoc = new File(filesPath.getAbsoluteFile() + "/" + savedName);
				file.transferTo(targetLoc);	
				return 0;
			}
		}
		return -1;
	}
	
	public List<ApprovalDTO> allMyWriteApp(){
		return adao.allMyWriteApp((String)session.getAttribute("id"));
	}
	public int isMyCheckTurn(int app_seq) {
		List<Approval_signDTO> signList = adao.getAppSignBySeq(app_seq);
		for (Approval_signDTO dto : signList) {
			int checkorder = dto.getApp_sign_order()-1;
			int befOrderCount = adao.countBefAgree(checkorder, dto.getApp_seq());
			int yCount = adao.isSignTurn(checkorder, dto.getApp_seq());
			
			//내 결재차례이고, 아직 결재를 하지 않았으며, 이전 결재자의 수와 동의자의 수가 같다면   
			if(dto.getApp_sign_id().contentEquals((String)session.getAttribute("id")) && dto.getApp_sign_date()==null && yCount==befOrderCount ) {
				//내 차례가 맞다고 return 함
				return 1;
			}
		}
		//내 결재차례가 아님을 돌려줌. 
		return 0;

	}
	public List<HashMap<Integer,String>> isMyCheckTurnList(List<ApprovalDTO> list) {
		List<HashMap<Integer,String>> result = new ArrayList<HashMap<Integer,String>>();
		for(ApprovalDTO adto : list) {
			int app_seq = adto.getApp_seq();
			List<Approval_signDTO> signList = adao.getAppSignBySeq(app_seq);
			for (Approval_signDTO dto : signList) {
				int checkorder = dto.getApp_sign_order()-1;
				int befOrderCount = adao.countBefAgree(checkorder, dto.getApp_seq());
				int yCount = adao.isSignTurn(checkorder, dto.getApp_seq());
				HashMap<Integer,String> map = new HashMap();
				//내 결재차례이고, 아직 결재를 하지 않았으며, 이전 결재자의 수와 동의자의 수가 같다면   
				if(dto.getApp_sign_id().contentEquals((String)session.getAttribute("id")) && dto.getApp_sign_date()==null && yCount==befOrderCount ) {
					//내 차례가 맞음
					map.put(app_seq, "승인 요청중");
					result.add(map);
				}else if(dto.getApp_sign_id().contentEquals((String)session.getAttribute("id")) && dto.getApp_sign_date()==null && yCount!=befOrderCount ){
					map.put(app_seq, "결재 대기중");
					result.add(map);
				}
				
			}
		}
		
		for(int i = 0; i<result.size(); i++) {
			System.out.println(result.get(i));
		}
		return result;

	}
	public List<ApprovalDTO> getMySignedList(int cPage){
		//올라간 기안 중 내가 결재라인에 포함되어 있는 모든 내역의 Seq를 들고온다.(참조 제외)
		List<Approval_signDTO> signList = adao.getMySignApp((String)session.getAttribute("id"));
		List<Integer> confirmList =  new ArrayList<Integer>(); 
		List<Integer> seqList =  new ArrayList<Integer>(); 
		List<ApprovalDTO> resultList = new ArrayList<ApprovalDTO>();
		if(signList.size()==0) {
			return resultList;}
		
		for (Approval_signDTO dto : signList) {
			
			if(dto.getApp_sign_date()==null){
				//결재하지 않은 내역이라면
				//내가 결재하기 전에 해당 내역이 반송된 것인지 확인하기 위한 리스트에 app_seq를 추가함
				confirmList.add(dto.getApp_seq());
			}else if(dto.getApp_sign_date()!=null) {
				//내가 결재 완료한 내역을 넣음
				seqList.add(dto.getApp_seq());
			}
		}
		
		//내가결재하지 않았는데 반송된 내역도 approval을 뽑아올 내역에 추가한다.
		for(int seq : adao.confirmReject(confirmList)) {
			seqList.add(seq);}

		//cPage기준으로 뽑아올 양 선택
		int startnum = (cPage-1)*ApprovalConfigurator.APP_RECORD_COUNT_PER_PAGE+1;
		int endnum = startnum + ApprovalConfigurator.APP_RECORD_COUNT_PER_PAGE-1;
		
		resultList = adao.getAppByCpage(seqList,startnum,endnum);
		
		//리스트에 표시 할 내 결재완료 여부 저장
		for(ApprovalDTO dto : resultList) {
			for(Approval_signDTO asdto : signList) {
				if(asdto.getApp_seq()==dto.getApp_seq()) {
					//이전 차례에서 반송되었을 때
					if(asdto.getApp_sign_date()==null) {
						dto.setApp_sign_accept("rejeced");
					}else {
						dto.setApp_sign_accept(asdto.getApp_sign_accept());	
					}
					
				}
			}
		}
			//resultList 정렬하기(app_reg_date기준)
		Collections.sort(resultList, new ApprovalComparator());
		return resultList;
	}
	public List<ApprovalDTO> getMyCCList(int cPage){
		List<Integer> seqList = adao.allMyCCList((String)session.getAttribute("id"));
		List<ApprovalDTO> resultList = new ArrayList<ApprovalDTO>();

		if(seqList.size()==0) {
			return resultList;}
		//cPage기준으로 뽑아올 양 선택
		int startnum = (cPage-1)*ApprovalConfigurator.APP_RECORD_COUNT_PER_PAGE+1;
		int endnum = startnum + ApprovalConfigurator.APP_RECORD_COUNT_PER_PAGE-1;
		resultList = adao.getAppByCpage(seqList,startnum,endnum);
		
		
		//resultList 정렬하기(app_reg_date기준)
		Collections.sort(resultList, new ApprovalComparator());
		Collections.reverse(resultList);//최신의 글이 앞에 보이도록 내림차순 정렬함. 
		return resultList;
	}
	
	public List<ApprovalDTO> getTobeSignList(int cPage){
		List<Approval_signDTO> signList = adao.getTobeSignApp((String)session.getAttribute("id"));
		List<Integer> seqList =  new ArrayList<Integer>(); 
		List<ApprovalDTO> resultList = new ArrayList<ApprovalDTO>();
		if(signList.size()==0) {
			return resultList;}
		for (Approval_signDTO dto : signList) {
			//app_seq만 따로 가져옴.
			seqList.add(dto.getApp_seq());
		}
		
		//cPage기준으로 뽑아올 양 선택
		int startnum = (cPage-1)*ApprovalConfigurator.APP_RECORD_COUNT_PER_PAGE+1;
		int endnum = startnum + ApprovalConfigurator.APP_RECORD_COUNT_PER_PAGE-1;
		
		resultList = adao.getAppByCpage(seqList,startnum,endnum);
		for(ApprovalDTO dto : resultList) {
			for(Approval_signDTO asdto : signList) {
				if(asdto.getApp_seq()==dto.getApp_seq()) {
					dto.setApp_sign_accept(asdto.getApp_sign_accept());
					// 내 결제차례 정보 넣기
					int checkorder = asdto.getApp_sign_order()-1;
					int befOrderCount = adao.countBefAgree(checkorder, dto.getApp_seq());
					int yCount = adao.isSignTurn(checkorder, dto.getApp_seq());
					HashMap<Integer,String> map = new HashMap();
					//내 결재차례이고, 아직 결재를 하지 않았으며, 이전 결재자의 수와 동의자의 수가 같다면   
					if(asdto.getApp_sign_id().contentEquals((String)session.getAttribute("id")) && asdto.getApp_sign_date()==null && yCount==befOrderCount ) {
						//내 차례가 맞음
						dto.setApp_is_my_sign_turn("승인 요청중");
					}else if(asdto.getApp_sign_id().contentEquals((String)session.getAttribute("id")) && asdto.getApp_sign_date()==null && yCount!=befOrderCount ){
						dto.setApp_is_my_sign_turn("결재 순서 대기중");
					}
				}
			
			}
			
		}
			//resultList 정렬하기(app_reg_date기준)
		Collections.sort(resultList, new ApprovalComparator());
		return resultList;
	}
	
	public String getNavi(int currentPage, String hrefText, String from) throws Exception{
		int recordTotalCount = 0;
		String id = (String)session.getAttribute("id");
		if(from.contentEquals("tobe")) {
			recordTotalCount = adao.countTobeSignApp(id); //총 데이터 개수
		}else if(from.contentEquals("CC")) {
			recordTotalCount = adao.countMyCCList(id); //총 데이터 개수
		}else {
			recordTotalCount = adao.countMySignedApp(id); //총 데이터 개수
		}
		
		int recordCountPerPage = ApprovalConfigurator.APP_RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = ApprovalConfigurator.APP_NAVI_COUNT_PER_PAGE;

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
		sb.append("<li><a href='/approval/"+hrefText+"?cPage=1'><span>&laquo;</span></li>");
		}
		if(needPrev) {
			sb.append("<li><a href='/approval/"+hrefText+"?cPage="+(startNavi-1)+"'> <span><</span> </a></li>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<li><a href='/approval/"+hrefText+"?cPage="+i+"'>"+i+"</a></li>");
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/approval/"+hrefText+"?cPage="+pageTotalCount+"'><span> > </span></a></li>");
		}
		return sb.toString();
	}
	
	public ApprovalDTO getAppBySeq(int app_seq) {
		return adao.getAppBySeq(app_seq);
	}
	public List<Approval_signDTO> getAppSignBySeq(int app_seq){
		System.out.println(app_seq);
		return adao.getAppSignBySeq(app_seq);
	}
	public List<Approval_attached_filesDTO> getAppFileBySeq(int app_seq){
		return adao.getAppFileBySeq(app_seq);
	}
	public List<Approval_commentsDTO> getAppCmtBySeq(int app_seq){
		return adao.getAppCmtBySeq(app_seq);
	}
	private String makeTempContent(int app_seq, String contents) throws Exception {
		// WARING!!!!!! -> project workspace경로가 아닌 project server가 가동되는 경로에 생되므로
		// Project clean시 생성한 file도 삭제됩니다. clean전에 반드시 backup 해주세요!!!!!
		String sDir = servletContext.getRealPath("/resources/approval_contents");// src/main/webapp/resources/approval_contents폴더
																				// 경로 출력
		String sFileName = app_seq + ".html";// 저장할 file이름은 게시판코드_글id.html이 될것입니다.
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
	
	
	public String getHtmlText (int app_seq) throws Exception {
	      //----------------------html파일 전달하기
	      int cur = 0;
	      
	      //src/main/webapp/resources/write_contents폴더 경로 출력
	      String sDir = servletContext.getRealPath("/resources/approval_contents");
	      //저장할 file이름은 게시판코드_글id.html이 될것입니다.
	      String sFileName = app_seq+".html";
	      
	      StringBuilder sb = new StringBuilder();
	         //sDir 폴더속 sFileName을 가져온다.
	         File file = new File(sDir, sFileName);
	         if(!file.exists()) {
	        	 return app_seq+"_contents";
	         }
	         FileReader file_reader = new FileReader(file);

	         while((cur = file_reader.read()) != -1){
	            sb.append((char)cur);
	         }
	         
	         file_reader.close();
	     	      
	      return sb.toString() ;
	      
	}
	public int updateSign(int app_seq, String isAccept) {
		Approval_signDTO dto = new Approval_signDTO();
		dto.setApp_seq(app_seq);
		dto.setApp_sign_id((String)session.getAttribute("id"));
		dto.setApp_sign_accept(isAccept);
		int result = adao.updateSign(dto);
		
		//만약 내가 마지막 결재순서이고, accept했다면 approval에 결재완료를 넣는다. 
		if(isAccept.contentEquals("N")) {
			adao.updateAppStatus(2, app_seq);
		}else if(isAccept.contentEquals("Y")) {
			int accepted = adao.countAgree(app_seq);
			int total = adao.totalSign(app_seq);
			if(accepted==total) {
				adao.updateAppStatus(0, app_seq);
			}
		}
		
		return result; 
	}
	public int writeCmt(Approval_commentsDTO dto) {
		dto.setApp_cmt_writer((String)session.getAttribute("id"));
		return adao.writeCmt(dto);
	}
	public int delAppCmtBySeq(int app_cmt_seq) {
		return adao.delAppCmtBySeq(app_cmt_seq);
	}
	public String getTemplate(int app_docs_type) throws Exception {
		//----------------------html파일 전달하기
	      int cur = 0;
	      
	      //src/main/webapp/resources/write_contents폴더 경로 출력
	      String sDir = servletContext.getRealPath("/resources/approval_template");
	      //저장할 file이름은 게시판코드_글id.html이 될것입니다.
	      String sFileName = app_docs_type+".html";
	      
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
	public List<ApprovalDTO> getMainTobeList(){
		List<Approval_signDTO> signList = adao.getTobeSignApp((String)session.getAttribute("id"));
		List<Integer> seqList =  new ArrayList<Integer>(); 
		List<ApprovalDTO> resultList = new ArrayList<ApprovalDTO>();
		if(signList.size()==0) {
			return resultList;}
		//올라간 기안 중 내가 결재라인에 포함되어 있는 모든 내역의 Seq를 들고온다.(참조 제외)
		for (Approval_signDTO dto : signList) {
			int checkorder = dto.getApp_sign_order()-1;
			int befOrderCount = adao.countBefAgree(checkorder, dto.getApp_seq());
			int yCount = adao.isSignTurn(checkorder, dto.getApp_seq());
			//내가 결재 하지 않은 내역을 넣음
			if(dto.getApp_sign_date()==null && yCount==befOrderCount ) {
				seqList.add(dto.getApp_seq());
			}
		}

		//cPage기준으로 뽑아올 양 선택
		int startnum = 1;
		int endnum = 5;
		
		resultList = adao.getAppByCpage(seqList,startnum,endnum);
		for(ApprovalDTO dto : resultList) {
			for(Approval_signDTO asdto : signList) {
				if(asdto.getApp_seq()==dto.getApp_seq()) {
					dto.setApp_sign_accept(asdto.getApp_sign_accept());
					// 내 결제차례 정보 넣기
					HashMap<Integer,String> map = new HashMap();
					dto.setApp_is_my_sign_turn("승인 요청중");
				
				}
			
			}
			
		}
			//resultList 정렬하기(app_reg_date기준)
		Collections.sort(resultList, new ApprovalComparator());
		return resultList;
	}
	
	public List<ApprovalDTO> getMainWriteList(int max){
		return adao.getAppForMainWrite((String)session.getAttribute("id"),max);		
	}
	public List<ApprovalDTO> getMainCCList(){
		return adao.getAppForMainCC((String)session.getAttribute("id"));		
	}
	
	public HashMap<String, Object> knrMainTobeSignList(){
		List<Approval_signDTO> signList = adao.getTobeSignApp((String)session.getAttribute("id"));
		List<Integer> seqList =  new ArrayList<Integer>(); 
		List<ApprovalDTO> resultList = new ArrayList<ApprovalDTO>();
		HashMap<String, Object> map = new HashMap();
		
		if(signList.size()==0) {
			map.put("error", -1);
			return map;}
		for (Approval_signDTO dto : signList) {
			//현재 내 결제차례인 리스트만 가져옴
			int checkorder = dto.getApp_sign_order()-1;
			int befOrderCount = adao.countBefAgree(checkorder, dto.getApp_seq());
			int yCount = adao.isSignTurn(checkorder, dto.getApp_seq());
			if(dto.getApp_sign_date()==null && yCount==befOrderCount) {
				seqList.add(dto.getApp_seq());
			}
			
		}
		map.put("toBeSignCount", seqList.size());
		//cPage기준으로 뽑아올 양 선택
		int startnum = 1;
		int endnum = 3;
		
		resultList = adao.getAppByCpage(seqList,startnum,endnum);
		for(ApprovalDTO dto : resultList) {
			for(Approval_signDTO asdto : signList) {
				if(asdto.getApp_seq()==dto.getApp_seq()) {
					dto.setApp_sign_accept(asdto.getApp_sign_accept());
					// 내 결제차례 정보 넣기
					int checkorder = asdto.getApp_sign_order()-1;
					int befOrderCount = adao.countBefAgree(checkorder, dto.getApp_seq());
					int yCount = adao.isSignTurn(checkorder, dto.getApp_seq());
					//내 결재차례이고 == 아직 결재를 하지 않았으며, 이전 결재자의 수와 동의자의 수가 같음   
					if(asdto.getApp_sign_id().contentEquals((String)session.getAttribute("id")) && asdto.getApp_sign_date()==null && yCount==befOrderCount ) {
						dto.setApp_is_my_sign_turn("승인 요청중");
					//내 결재차례가 아니지만 미래에 결재를 하게될 수도 있음 == 아직 결재를 하지 않았으며, 이전 결재자의 수와 동의자의 수가 다름
					}else if(asdto.getApp_sign_id().contentEquals((String)session.getAttribute("id")) && asdto.getApp_sign_date()==null && yCount!=befOrderCount ){
						dto.setApp_is_my_sign_turn("결재 순서 대기중");
					}
				}
			
			}
			
		}
			//resultList 정렬하기(app_reg_date기준)
		Collections.sort(resultList, new ApprovalComparator());
		map.put("resultList", resultList);
		map.put("error", 0);
		return map;
	}
}
