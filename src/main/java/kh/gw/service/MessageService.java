package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.MessageDAO;

@Service
public class MessageService {
	@Autowired
	private MessageDAO mdao;
}
