package com.example.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.CEOVO;
import com.example.domain.UserVO;

@Repository	//500¿¡·¯
public class UserDAOImpl implements UserDAO{

	@Inject
	SqlSession session;
	String namespace="UserMapper";
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".login", vo);
	}
}
