package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.CompInfoDAO;

@Service
public class CompInfoService {
	@Autowired
	private CompInfoDAO cdao;
}
