package com.example.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.CEOVO;

@Repository
public class CEODAOImpl implements CEODAO{

	@Inject
	SqlSession session;
	String namespace="CEOMapper";
	
	@Override
	public CEOVO login(CEOVO vo) throws Exception {
		return session.selectOne(namespace + ".clogin", vo);
	}

}
