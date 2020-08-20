package com.shopping.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.shopping.domain.MemberVO;
import com.shopping.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	/*@Autowired
	BCryptPasswordEncoder passEncoder;*/
	
	// 회원 가입 GET
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception{
		Logger.info("get signup");
	}
	
	// 회원 가입 POST
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
	 Logger.info("post signup");
	  
	 /*String inputPass = vo.getUserPass();
	 String pass = passEncoder.encode(inputPass);
	 vo.setUserPass(pass);*/
	 
	 String inputPass = vo.getUserPass();
	 vo.setUserPass(inputPass);

	 service.signup(vo);

	 return "redirect:/";
	}
}
