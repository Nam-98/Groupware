package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.PositionDTO;

@Repository
public class PositionDAO {
	@Autowired
	private SqlSession db;
	
	public List<PositionDTO> listPo() {
		return db.selectList("Position.listPo");
	}
	public int nxPosiAdd(PositionDTO dto) {
		return db.insert("Position.nxPosiAdd", dto);
	}
	public int nxPosiDel(int position_seq) {
		return db.delete("Position.nxPosiDel",position_seq);
	}
	public int nxPosiUdt(PositionDTO dto) {
		return db.update("Position.nxPosiUdt", dto);
	}
}
