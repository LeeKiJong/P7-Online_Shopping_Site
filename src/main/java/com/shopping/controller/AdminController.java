package com.shopping.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.domain.CartVO;
import com.shopping.domain.CategoryVO;
import com.shopping.domain.GoodsVO;
import com.shopping.domain.GoodsViewVO;
import com.shopping.domain.OrderListVO;
import com.shopping.domain.OrderVO;
import com.shopping.domain.ReplyListVO;
import com.shopping.domain.ReplyVO;
import com.shopping.service.AdminService;
import com.shopping.utils.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	AdminService adminService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//상품 등록 GET
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception{
		Logger.info("get goods register");
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	//상품 등록 POST
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
	 Logger.info("post goods register");

	 
	 String imgUploadPath = uploadPath + File.separator + "imgUpload";
	 String fileName = null;

	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
	 } else {
	  fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
	 }

	 vo.setGdsImg(File.separator + "imgUpload" + File.separator + fileName);
	 vo.setGdsThumbImg(File.separator + "imgUpload" + File.separator + "s" + File.separator + "s_" + fileName);
	 
	 
	 adminService.register(vo);
	 
	 return "redirect:/member/signin";
	}
	
	//상품 목록 GET
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception{
		Logger.info("get goods list");
		List<GoodsViewVO> list = adminService.goodslist();
		
		model.addAttribute("list", list);
	}
	
	//상품 조회 GET
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception{
		Logger.info("get goods view");
		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);
		
	}
	
	//상품 수정 GET
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception{
		Logger.info("get goods modify");
		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
			
	}
	
	// 상품 수정 POST
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		Logger.info("post goods modify");


		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
			  new File(uploadPath + req.getParameter("gdsImg")).delete();
			  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
			  
			  // 새로 첨부한 파일을 등록
			  String imgUploadPath = uploadPath + File.separator + "imgUpload";
			  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
			  
			  vo.setGdsImg(File.separator + "imgUpload" + File.separator + fileName);
			  vo.setGdsThumbImg(File.separator + "imgUpload" + File.separator + "s" + File.separator + "s_" + fileName);
			  
		 } else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			  vo.setGdsImg(req.getParameter("gdsImg"));
			  vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		  
		 }

		 adminService.goodsModify(vo);
		 
		 return "redirect:/member/signin";
	}
	
	// 상품 삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
	 Logger.info("post goods delete");
	 adminService.goodsDelete(gdsNum);
		 
	 return "redirect:/member/signin";
	}
		
	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
	 Logger.info("get order list");
	   
	 List<OrderVO> orderList = adminService.orderList();
	 
	 model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId,
	      OrderVO order, Model model) throws Exception {
	 Logger.info("get order view");
	 
	 order.setOrderId(orderId);  
	 List<OrderListVO> orderView = adminService.orderView(order);
	 
	 model.addAttribute("orderView", orderView);
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
	 Logger.info("post order view");
	   
	 adminService.delivery(order);
	 
	 List<OrderListVO> orderView = adminService.orderView(order); 

	 GoodsVO goods = new GoodsVO();
	   
	 for(OrderListVO i : orderView) {
	  goods.setGdsNum(i.getGdsNum());
	  goods.setGdsStock(i.getCartStock());
	  adminService.changeStock(goods);
	 }
	 
	 return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}
	
	// 모든 소감(댓글)
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.GET)
	public void getAllReply(Model model) throws Exception {
	 Logger.info("get all reply");
	   
	 List<ReplyListVO> reply = adminService.allReply();
	 
	 model.addAttribute("reply", reply);
	}
	
	// 모든 소감(댓글) 삭제
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.POST)
	public String postAllReply(ReplyVO reply) throws Exception {
		Logger.info("post all reply");
				
		adminService.deleteReply(reply.getRepNum());
		
		return "redirect:/admin/shop/allReply";
	}	
		
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
	          HttpServletResponse res,
	          @RequestParam MultipartFile upload) throws Exception {
	 Logger.info("post CKEditor img upload");
	 
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("text/html;charset=utf-8");
	 
	 try {
	  
	  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes();
	  
	  // 업로드 경로
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush();  // out에 저장된 데이터를 전송하고 초기화
	  
	  String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	  
	  // 업로드시 메시지 출력
	  printWriter.println("<script type='text/javascript'>"
	     + "window.parent.CKEDITOR.tools.callFunction("
	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	     +"</script>");
	  
	  printWriter.flush();
	  
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
	
	
}
