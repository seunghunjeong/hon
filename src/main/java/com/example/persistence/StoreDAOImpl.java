package com.example.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;
import com.example.domain.SearchCriteria;
import com.example.domain.StoreVO;
import com.example.domain.UserVO;

@Repository
public class StoreDAOImpl implements StoreDAO {
	@Inject
	SqlSession session;
	private static final String namespace = "StoreMapper";

	@Override
	public void insert(StoreVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertS", vo);
	}

	@Override
	public List<StoreVO> listS() throws Exception {
		return session.selectList(namespace + ".listS");
	}

	@Override
	public int totalS() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".totalS");
	}

	@Override
	public StoreVO readS(String sid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".readS", sid);
	}

	@Override
	public List<StoreVO> searchS(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".searchS", cri);
	}

	@Override
	public int searchTOT(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".searchToT", cri);
	}

	@Override
	public void replyS(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".replyS", vo);
	}

	@Override
	public List<Map<String, Object>> listRpS(int page, String sid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("sid", sid);
		return session.selectList(namespace + ".listRpS", map);
	}

	@Override
	public int listRpsTOT(String sid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".RpSTOT", sid);
	}

	@Override
	public String FChk(String sid, String uid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("sid", sid);
		return session.selectOne(namespace + ".FChk", map);
	}

	@Override
	public List<Map<String, Object>> listSM(String sid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSM", sid);
	}

	@Override
	public List<String> listSI(String sid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSI", sid);
	}

	@Override
	public void delSU(String uid) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delSU", uid);
	}
}
