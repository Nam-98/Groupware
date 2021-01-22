package kh.gw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.Break_typeDTO;

@Repository
public class BreakDAO {
	@Autowired
	private SqlSession db;
	
	public List<Break_typeDTO> getAllType(){
		return db.selectList("Break.getAllType");
	}
}
