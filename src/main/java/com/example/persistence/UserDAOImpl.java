package com.example.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.example.domain.ReplyVO;
import com.example.domain.UserVO;

@Repository // 500¿¡·¯
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession session;
	String namespace = "UserMapper";

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".login", vo);
	}

	@Override
	public void replyU(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".replyU", vo);
	}

	@Override
	public void userFI(String uid, String sid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("sid", sid);
		session.insert(namespace + ".userFI", map);
	}

	@Override
	public void userFU(String uid, int favor) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("favor", favor);
		session.update(namespace + ".userFU", map);
	}

	@Override
	public List<Map<String, Object>> listUFL(String uid) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listUFL", uid);
	}
}
