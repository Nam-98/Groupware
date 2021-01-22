package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.BreakDAO;
import kh.gw.dto.Break_typeDTO;

@Service
public class BreakService {
	@Autowired
	private BreakDAO bdao;
	
	public List<Break_typeDTO> getAllType(){
		return bdao.getAllType();
	}
}
