package com.shopping.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.MemberVO;
import com.shopping.persistance.MemberDAO;

@Service
public class MemberServiceImp {

	@Inject
	private MemberDAO dao;
	
	//회원 가입
	public void signup(MemberVO vo) throws Exception{
		dao.signup(vo);
	}
}
