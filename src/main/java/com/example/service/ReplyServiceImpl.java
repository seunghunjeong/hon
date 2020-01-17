package com.example.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ReplyVO;
import com.example.persistence.StoreDAO;
import com.example.persistence.UserDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	UserDAO udao;

	@Inject
	StoreDAO sdao;

	@Transactional
	@Override
	public void insertRp(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		udao.replyU(vo);
		sdao.replyS(vo);
	}

	@Override
	public void deleteUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		sdao.delSU(uid);
		udao.delFU(uid);
		udao.delUR(uid);
		udao.deleteU(uid);
	}

}
