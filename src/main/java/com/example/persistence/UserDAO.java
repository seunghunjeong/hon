package com.example.persistence;

import java.util.List;
import java.util.Map;

import com.example.domain.ReplyVO;
import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO login(UserVO vo) throws Exception;

	public void replyU(ReplyVO vo) throws Exception;

	public void userFI(String uid, String sid) throws Exception;

	public void userFU(String uid, int favor) throws Exception;

	public List<Map<String, Object>> listUFL(String uid);
}
