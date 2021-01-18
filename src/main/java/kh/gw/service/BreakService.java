package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.BreakDAO;

@Service
public class BreakService {
	@Autowired
	private BreakDAO bdao;
}
