package com.shopping.persistance;

import java.util.List;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.GoodsVO;

public interface AdminDAO {

	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register(GoodsVO vo) throws Exception;
}
