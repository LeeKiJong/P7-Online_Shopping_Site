package com.shopping.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.GoodsVO;

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
	
	//상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception{
		sql.insert(namespace + ".register", vo);
	}
	
	//상품목록
	@Override
	public List<GoodsVO> goodslist() throws Exception{
		return sql.selectList(namespace + ".goodslist");
	}
	
	//상품조회
	@Override
	public GoodsVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
}
