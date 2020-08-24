package com.shopping.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	//관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception{
		Logger.info("get index");
	}
	
	//상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister() throws Exception{
		Logger.info("get goods register");
	}
}
