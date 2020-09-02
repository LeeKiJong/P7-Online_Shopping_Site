package com.shopping.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.domain.GoodsViewVO;
import com.shopping.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	 private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	 
	 @Inject
	 ShopService service;
	 
	//사용자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception{
		logger.info("get index");
	}
	 
	 // 카테고리별 상품 리스트
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getList(@RequestParam("c") int cateCode,
	      @RequestParam("l") int level, Model model) throws Exception {
		  logger.info("get list");
		  
		  List<GoodsViewVO> list = null;
		  list = service.list(cateCode, level);
		 
		  model.addAttribute("list", list);
  
	 }
}