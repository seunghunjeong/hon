package com.example.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.CEOVO;
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

}
