package com.shopping.persistance;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.MemberVO;

@Repository
public class MemberDAOImp implements MemberDAO{
	
	@Inject 
	private SqlSession sqlSession; 
	
	private static String namespace = "com.shopping.mappers.memberMapper";
	
	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception{
		sqlSession.insert(namespace + ".signup", vo);
	}

	
}
