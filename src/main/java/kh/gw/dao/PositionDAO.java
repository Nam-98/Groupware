package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.PositionDTO;

@Repository
public class PositionDAO {
	@Autowired
	private SqlSession db;
	
	public List<PositionDTO> listPo() {
		return db.selectList("Position.listPo");
	}
}
