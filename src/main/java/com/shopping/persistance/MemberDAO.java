package com.shopping.persistance;

import com.shopping.domain.MemberVO;

public interface MemberDAO {

	//회원가입
	public void signup(MemberVO vo) throws Exception;
}
