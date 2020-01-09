package com.example.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.persistence.StoreDAO;
import com.example.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class DBTest {

	@Inject
	StoreDAO sdao;
	
	@Inject
	UserDAO udao;

	@Test
	public void pcode() throws Exception {
		int page = 0;
		String sid = "8";
		sdao.listRpS(page, sid);
	}
	
	@Test
	public void test() throws Exception{
		String uid = "user01";
		String sid = "9";
		
		sdao.FChk(sid, uid);
	}
}
