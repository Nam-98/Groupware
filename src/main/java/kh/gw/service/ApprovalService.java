package kh.gw.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import kh.gw.dto.Approval_signDTO;
import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.Approval_typeDTO;
import kh.gw.statics.ApprovalConfigurator;

@Service
public class ApprovalService {
	@Autowired
	private ApprovalDAO adao;
	@Autowired 
	private ServletContext servletContext;
	@Autowired
	private HttpSession session;
	
	@Scheduled(cron = "0 0 0 * * *")
	public String resetConfig() {
		//매일 자정에 count, date 초기화
		ApprovalConfigurator.docsCount = 1;
		
		//현재날짜 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		Date today = new Date();
		ApprovalConfigurator.docsDate = sdf.format(today);
		return sdf.format(today);
	}
	public List<Approval_typeDTO> allDocsType (){
		return adao.allDocsType();
	}
	public List<Approval_sign_typeDTO> allSignType(){
		return adao.allSignType();
	}
	public int writeApp(ApprovalDTO dto) throws Exception {
		dto.setApp_id((String)session.getAttribute("id"));
		String docsNum = ApprovalConfigurator.docsDate+"-"+ApprovalConfigurator.docsCount;
		ApprovalConfigurator.docsCount++;
		dto.setApp_docs_num(docsNum);
		System.out.println(dto.getApp_docs_num());
		int result = adao.writeApp(dto);
		if(result>0) {
			int app_seq = adao.getLatestSeqById((String)session.getAttribute("id"));
			//첨부파일 저장
			if(dto.getFiles().get(0)!=null) {
				this.uploadAttachedFiles(dto.getFiles(), app_seq);	
			}
			return app_seq;
		}
		return -1; 
	}
	
	public void setInitAppSign(Approval_signDTO approval_signDTOList, int appSeq) {
		List<Approval_signDTO> signList = approval_signDTOList.getApproval_signDTOList();
		for(Approval_signDTO dto : signList) {
			dto.setApp_seq(appSeq);
			adao.setInitAppSign(dto);
		}
	}
	
	private void uploadAttachedFiles(List<MultipartFile> files, int app_seq) throws Exception {
		for (MultipartFile file : files) {
			if(file.isEmpty()) {return;}
			String realPath = servletContext.getRealPath("/resources/Approval_attached_files");
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
			}
		}
	}
}
