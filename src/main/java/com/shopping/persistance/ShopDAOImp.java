package com.shopping.persistance;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.GoodsViewVO;
import com.shopping.domain.ReplyListVO;
import com.shopping.domain.ReplyVO;

@Repository
public class ShopDAOImp implements ShopDAO{

	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.shopping.mappers.shopMapper";
	
	// 카테고리별 상품 리스트 : 1차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
	 
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("cateCode", cateCode);
		 map.put("cateCodeRef", cateCodeRef);
		 
		 return sql.selectList(namespace + ".list_1", map);
	}

	// 카테고리별 상품 리스트 : 2차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
	 
		return sql.selectList(namespace + ".list_2", cateCode);
	}
	
	//상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne("com.shopping.mappers.adminMapper" + ".goodsView", gdsNum);
	}
	
	//상품 소감(댓글) 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception{
		sql.insert(namespace + ".registReply", reply);
	}
	
	//상품 소감(댓글) 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return sql.selectList(namespace + ".replyList", gdsNum);
	}
	
	//상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception{
		sql.delete(namespace + ".deleteReply", reply);
	}
		
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}
	
	
	
	
	
	
}