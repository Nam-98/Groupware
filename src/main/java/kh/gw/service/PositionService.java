package kh.gw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.PositionDAO;
import kh.gw.dto.PositionDTO;

@Service
public class PositionService {

	@Autowired
	private PositionDAO pdao;
	
	public List<PositionDTO> listPo() throws Exception{
		return pdao.listPo();
	}
}
