package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.GoodsVO;
import com.shopping.domain.GoodsViewVO;
import com.shopping.persistance.AdminDAO;

@Service
public class AdminServiceImp implements AdminService{
	
	

	@Inject
	private AdminDAO dao;
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	//상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception{
		dao.register(vo);
	}
		
	//상품목록
	@Override
	public List<GoodsVO> goodslist() throws Exception{
		return dao.goodslist();
	}
	
	//상품조회 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	//상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		dao.goodsModify(vo);
	}
}

