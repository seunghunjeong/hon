package com.example.persistence;

import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO login(UserVO vo) throws Exception;
}
