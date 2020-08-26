package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.GoodsVO;
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
		
}

