package kh.gw.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kh.gw.dao.ApprovalDAO;
import kh.gw.dto.Approval_sign_typeDTO;
import kh.gw.dto.Approval_typeDTO;
import kh.gw.statics.ApprovalConfigurator;

@Service
public class ApprovalService {
	@Autowired
	private ApprovalDAO adao;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void resetConfig() {
		//매일 자정에 count, date 초기화
		ApprovalConfigurator.docsCount = 1;
		
		//현재날짜 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		Date today = new Date();
		ApprovalConfigurator.docsDate = sdf.format(today);
	}
	
	public List<Approval_typeDTO> allDocsType (){
		return adao.allDocsType();
	}
	
	public List<Approval_sign_typeDTO> allSignType(){
		return adao.allSignType();
	}
}
