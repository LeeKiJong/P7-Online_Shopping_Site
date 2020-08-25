package com.shopping.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.CategoryVO;

@Repository
public class AdminDAOImp implements AdminDAO{

	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.shopping.mappers.adminMapper";
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return sql.selectList(namespace + ".category");
	}
}
