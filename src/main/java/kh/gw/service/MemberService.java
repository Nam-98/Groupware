package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.MemberDAO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO mdao;
}
