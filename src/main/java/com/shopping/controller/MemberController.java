package com.shopping.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.shopping.domain.MemberVO;
import com.shopping.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 회원 가입 GET
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception{
		Logger.info("get signup");
	}
	
	// 회원 가입 POST
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
	 Logger.info("post signup");
	  
	 String inputPass = vo.getUserPass();
	 String pass = passwordEncoder.encode(inputPass);
	 vo.setUserPass(pass);
	 
	 service.signup(vo);

	 return "redirect:/member/signin";
	}
	
	// 로그인 GET
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception{
		Logger.info("get signin");
	}
	
	// 로그인 POST
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		Logger.info("post signin");
		
		MemberVO login = service.signin(vo);
		
		if(login==null){
			rttr.addFlashAttribute("msg", "존재하지 않는 아이디입니다.");
			return "redirect:/member/signin";
		}
		HttpSession session = req.getSession();
		
		
		boolean passMatch = passwordEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		if(login != null && passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/member/signin";
		}
		
		return "redirect:/member/signin";
		
	}
	
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception{
		Logger.info("get logout");
		
		service.signout(session);
		
		return "redirect:/member/signin";
	}
}
