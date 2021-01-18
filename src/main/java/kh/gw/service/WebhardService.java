package kh.gw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.gw.dao.WebhardDAO;

@Service
public class WebhardService {
	@Autowired
	private WebhardDAO wdao;
}
