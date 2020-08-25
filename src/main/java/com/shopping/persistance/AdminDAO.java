package com.shopping.persistance;

import java.util.List;

import com.shopping.domain.CategoryVO;

public interface AdminDAO {

	//카테고리
	public List<CategoryVO> category() throws Exception;
}
