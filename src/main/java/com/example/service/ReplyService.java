package com.example.service;

import com.example.domain.ReplyVO;

public interface ReplyService {
	public void insertRp(ReplyVO vo) throws Exception;

	public void deleteUser(String uid) throws Exception;
}
