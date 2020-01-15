package com.example.persistence;

import java.util.List;

import com.example.domain.CEOVO;
import com.example.domain.MenuVO;
import com.example.domain.StoreVO;

public interface CEODAO {
	public CEOVO login(CEOVO vo) throws Exception;

	public void updateS(StoreVO vo) throws Exception;

	public void insertS(StoreVO vo) throws Exception;

	public void deleteS(String sid) throws Exception;

	public List<StoreVO> listS() throws Exception;

	public StoreVO readS(String sid) throws Exception;

	// 스토어메뉴
	public void insertM(MenuVO vo) throws Exception;

	public void deleteM(String sid, int mcount) throws Exception;

	public List<MenuVO> listM(String sid) throws Exception;

	public List<MenuVO> readM(String sid) throws Exception;
}
