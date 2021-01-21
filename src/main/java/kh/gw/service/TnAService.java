package kh.gw.service;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonObject;

import kh.gw.dao.TnADAO;
import kh.gw.dto.TnADTO;

public class TnAService {
	@Autowired
	private TnADAO tdao;
}
