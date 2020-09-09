package com.shopping.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.GoodsVO;
import com.shopping.domain.GoodsViewVO;
import com.shopping.domain.OrderListVO;
import com.shopping.domain.OrderVO;
import com.shopping.domain.ReplyListVO;

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
	public List<GoodsViewVO> goodslist() throws Exception{
		return sql.selectList(namespace + ".goodslist");
	}
	
	//상품조회 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	//상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		sql.update(namespace + ".goodsModify" ,vo);
	}
	
	//상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		sql.delete(namespace + ".goodsDelete", gdsNum);
	}
	
	//주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception{
		return sql.selectList(namespace + ".orderList");
	}
		
	//특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace + ".orderView", order);
	}
		
	//배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception{
		sql.update(namespace + ".delivery", order);
	}
	
	//상품 수량 조절
	@Override
	public void changeStock(GoodsVO goods) throws Exception{
		sql.update(namespace + ".changeStock", goods); 
	}
	
	//주문 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception{
		return sql.selectList(namespace + ".allReply");
	}
	
	//소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception{
		sql.delete(namespace + ".deleteReply", repNum);
	}
}

