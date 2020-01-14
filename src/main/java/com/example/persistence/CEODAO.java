package com.example.persistence;

import com.example.domain.CEOVO;
import com.example.domain.StoreVO;

public interface CEODAO {
	public CEOVO login(CEOVO vo) throws Exception;

	public void updateS(StoreVO vo) throws Exception;
}
