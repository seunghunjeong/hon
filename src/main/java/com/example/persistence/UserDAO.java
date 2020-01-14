package com.example.persistence;

import java.util.List;
import java.util.Map;

import com.example.domain.ReplyVO;
import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO login(UserVO vo) throws Exception;

	public void replyU(ReplyVO vo) throws Exception;

	public void userFI(String uid, String sid) throws Exception;

	public void userFU(String uid, String sid, int favor) throws Exception;

	public List<Map<String, Object>> listUFL(String uid) throws Exception;

	public List<Map<String, Object>> listURL(String uid) throws Exception;

	public void deleteUR(String uid, int rid) throws Exception;
	
	public void joinU(UserVO vo) throws Exception;
	
	public int idChk(String uid) throws Exception;
	
	public int nickChk(String nick) throws Exception;
	
	public void upU(UserVO vo) throws Exception;
}
