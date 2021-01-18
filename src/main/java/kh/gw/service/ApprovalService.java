package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.ApprovalDAO;

@Service
public class ApprovalService {
	@Autowired
	private ApprovalDAO adao;
}
