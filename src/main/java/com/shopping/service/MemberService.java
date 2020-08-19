package com.shopping.service;

import com.shopping.domain.MemberVO;

public interface MemberService {

	//회원가입
	public void signup(MemberVO vo) throws Exception;
}
