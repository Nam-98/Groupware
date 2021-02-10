package kh.gw.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.dao.BizLogDAO;
import kh.gw.dto.Approval_attached_filesDTO;
import kh.gw.dto.BizLogDTO;
import kh.gw.dto.BizLog_attached_filesDTO;
import kh.gw.dto.BizLog_signDTO;
import kh.gw.dto.BizLog_typeDTO;
import kh.gw.dto.MemberDTO;

@Service
public class BizLogService {
	@Autowired
	private BizLogDAO bdao;
	@Autowired
	private HttpSession session;
	@Autowired 
	private ServletContext servletContext;
	
	public List<MemberDTO> getMyDeptMem(){
		return bdao.getMyDeptMem((String)session.getAttribute("id"));
	}
	public List<BizLog_typeDTO> getDocsType(){
		return bdao.getDocsType();
	}
	public int writeBizlog(BizLogDTO dto) throws Exception {
		dto.setBiz_id((String)session.getAttribute("id"));

		
		String contents = dto.getBiz_contents();
		int writeResult = bdao.writeBizlog(dto);
		if(writeResult<=0) {
			return -1;
		}else if(writeResult>0) {
			int app_seq = bdao.getLatestSeqById((String)session.getAttribute("id"));
			//첨부파일 저장
			if(dto.getAttachedfiles()!=null) {
				this.uploadAttachedFiles(dto.getAttachedfiles(), app_seq);
				//내용파일 저장
				String sFileName = this.makeTempContent(app_seq, contents);
				//// db에 temp로 저장되어 있는 contents를 파일 저장명으로 수정
				bdao.contentsUpdate(app_seq, sFileName);
				return app_seq;
			}
		}
		return -1; 
		
	}
	public int setInitAppSign(List<BizLog_signDTO> list) {
		int seq = bdao.getLatestSeqById((String) session.getAttribute("id"));
		for(BizLog_signDTO dto : list) {
			dto.setBiz_seq(seq);
			int result = bdao.setInitAppSign(dto);
			if(result<=0) {return -1;}
		}
		return 1;
		
	}
	private void uploadAttachedFiles(List<MultipartFile> attachedfiles, int app_seq) throws Exception {
		String realPath = servletContext.getRealPath("/resources/BizLog_attached_files");
		for (MultipartFile file : attachedfiles) {
			if(file.isEmpty()) {return;}
			File filesPath = new File(realPath);
			// 이 file객체는 realPath에 실제로 해당 객체가 있을지 없을지 모르지만 이런 객체를 임의로 만들어 두고

			if (!filesPath.exists()) {
				filesPath.mkdir();
			}
			// 만약 clean등을 통해 filesPath에 실제로 폴더가 없다면 만들어 주라는 구문.

			String oriName = file.getOriginalFilename();
			String uid = UUID.randomUUID().toString().replaceAll("-", "");
			String savedName = uid + "_" + oriName;
			BizLog_attached_filesDTO aaf = new BizLog_attached_filesDTO(app_seq,oriName,savedName);
			int result = bdao.insertAf(aaf);
			if(result>0) {
				File targetLoc = new File(filesPath.getAbsoluteFile() + "/" + savedName);
				file.transferTo(targetLoc);	
			}
		}
	}

	private String makeTempContent(int biz_seq, String contents) throws Exception {
		// WARING!!!!!! -> project workspace경로가 아닌 project server가 가동되는 경로에 생섣되므로
		// Project clean시 생성한 file도 삭제됩니다. clean전에 반드시 backup 해주세요!!!!!
		String sDir = servletContext.getRealPath("/resources/bizlog_contents");// src/main/webapp/resources/approval_contents폴더
																				// 경로 출력
		String sFileName = biz_seq + ".html";// 저장할 file이름은 게시판코드_글id.html이 될것입니다.
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
		/*
		 * /////실 사용시에 하단의 코드는 지워주세요(혹은 주석) String dir2 =
		 * "D:\\02_Coding\\FinalWorkspace\\FinalBackWorkspace\\Groupware\\src\\main\\webapp\\resources\\approval_contents";
		 * File filesPath2 = new File(dir2); if (!filesPath2.exists()) {
		 * filesPath2.mkdir(); }
		 * 
		 * File conFile2 = new File(dir2, sFileName); BufferedWriter fw2 = new
		 * BufferedWriter(new FileWriter(conFile2));
		 * 
		 * // 파일안에 문자열 쓰기 fw2.write(contents); fw2.flush();
		 * 
		 * // 객체 닫기 fw2.close();
		 */
		return sFileName;
	}                            
	
}
