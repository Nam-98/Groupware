package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.BizLogDAO;

@Service
public class BizLogService {
	@Autowired
	private BizLogDAO bdao;
}
