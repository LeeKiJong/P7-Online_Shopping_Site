package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.CartListVO;
import com.shopping.domain.CartVO;
import com.shopping.domain.GoodsViewVO;
import com.shopping.domain.ReplyListVO;
import com.shopping.domain.ReplyVO;
import com.shopping.persistance.ShopDAO;

@Service
public class ShopServiceImp implements ShopService{
	
	@Inject
	private ShopDAO dao;
	
	//카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception{
		 int cateCodeRef = 0;  // 카테고리 참조 코드. 없어도 무관
		 
		 if(level == 1) {  // lavel 1 = 1차 분류.
		  
		  cateCodeRef = cateCode;
		  return dao.list(cateCode, cateCodeRef);
		  // 두가지 모두 cateCode로 해도 무관
		  
		 } else {  // lavel 2 = 2차 분류
		  
		  return dao.list(cateCode);
		  
		 }
	}
	
	//상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
		
		
	//상품 소감(댓글) 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception{
		dao.registReply(reply);
	}
	
	//상품 소감(댓글) 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return dao.replyList(gdsNum);
	}
	
	//상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception{
		dao.deleteReply(reply);
	}
			
	@Override
	//아이디 체크
	public String idCheck(int repNum) throws Exception{
		return dao.idCheck(repNum);
	}
	
	//상품 소감(댓글) 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception{
		dao.modifyReply(reply);
	}
	
	//카트 담기
	@Override
	public void addCart(CartListVO cart) throws Exception{
		dao.addCart(cart);
	}
	
	//카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return dao.cartList(userId);
	}
}

