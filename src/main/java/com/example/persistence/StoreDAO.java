package com.example.persistence;

import java.util.List;
import java.util.Map;

import com.example.domain.ReplyVO;
import com.example.domain.SearchCriteria;
import com.example.domain.StoreVO;

public interface StoreDAO {
	public void insert(StoreVO vo) throws Exception;

	public List<StoreVO> listS() throws Exception;

	public int totalS() throws Exception;

	public StoreVO readS(String sid) throws Exception;

	public List<StoreVO> searchS(SearchCriteria cri) throws Exception;

	public int searchTOT(SearchCriteria cri) throws Exception;

	public void replyS(ReplyVO vo) throws Exception;

	public List<Map<String, Object>> listRpS(int page, String sid) throws Exception;

	public int listRpsTOT(String sid) throws Exception;

	public String FChk(String sid, String uid) throws Exception;
	
	public List<String> listSI(String sid) throws Exception;
	
	public List<Map<String, Object>> listSM(String sid) throws Exception;
}
