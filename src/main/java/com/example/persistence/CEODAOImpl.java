package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.CEOVO;
import com.example.domain.MenuVO;
import com.example.domain.StoreVO;

@Repository
public class CEODAOImpl implements CEODAO {

	@Inject
	SqlSession session;
	String namespace = "CEOMapper";

	@Override
	public CEOVO login(CEOVO vo) throws Exception {
		return session.selectOne(namespace + ".clogin", vo);
	}

	@Override
	public void updateS(StoreVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".updateS", vo);
	}

	@Override
	public void insertS(StoreVO vo) {
		session.insert(namespace + ".insertRS", vo);
	}

	@Override
	public void deleteS(String sid) throws Exception {
		session.delete(namespace + ".deleteRS", sid);
	}

	@Override
	public List<StoreVO> listS() throws Exception {
		return session.selectList(namespace + ".listRS");
	}

	@Override
	public StoreVO readS(String sid) throws Exception {
		return session.selectOne(namespace + ".readRS", sid);
	}

	@Override
	public void insertM(MenuVO vo) throws Exception {
		session.insert(namespace + ".insertM", vo);
	}

	@Override
	public void deleteM(String sid, int mcount) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sid", sid);
		map.put("mcount", mcount);
		session.delete(namespace + ".deleteM", map);
	}

	@Override
	public List<MenuVO> listM(String sid) throws Exception {
		return session.selectList(namespace + ".listM", sid);
	}

	@Override
	public List<MenuVO> readM(String sid) throws Exception {
		return session.selectList(namespace + ".readM", sid);
	}

}
