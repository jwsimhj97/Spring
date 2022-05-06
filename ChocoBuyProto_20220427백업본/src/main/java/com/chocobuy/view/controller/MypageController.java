package com.chocobuy.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.trade.TradeVO;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;

@Controller
@SessionAttributes("trade")
public class MypageController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private TradeService tradeService; 
	
	// 회원정보 보기 getUser
	@RequestMapping("/Mypage/getMypageUser")
	public String getUser(UserVO vo, Model model,HttpServletRequest request, HttpSession session) {
		session= request.getSession();
		
		vo.setUser_nick((String)session.getAttribute("user_nick"));
		model.addAttribute("user", userService.getMypageUser(vo));
		System.out.println("userService.getMypageUser(vo)" +vo);
		return "/Mypage/MypageMain";
	}

	// 내정보 수정 페이지 이동
	@RequestMapping("/Mypage/profileUpdate")
	public String ProfileUpdate(UserVO vo, Model model, HttpSession session,HttpServletRequest request) {
		session= request.getSession();
		
		vo.setUser_nick((String)session.getAttribute("user_nick"));
		model.addAttribute("user", userService.getMypageUser(vo));
		System.out.println(userService.getMypageUser(vo));
		return "/Mypage/MyProfileUpdate";
	}
	
	// 회원정보 수정 
	@RequestMapping("/Mypage/updateUser")
	public String updateUser(@ModelAttribute("user") UserVO vo, Model model, HttpSession session,HttpServletRequest request) {

		userService.updateUser(vo);
		return "redirect: /Mypage/getMypageUser";
	}
	// 넥네임 중복확인 
	@RequestMapping("/Mypage/nameCheck") 
	@ResponseBody 
	public int nameCheck(@RequestParam("sm_name") String sm_name) {
		System.out.println("ajaxController");
		System.out.println(sm_name);
		return userService.nameCheck(sm_name); 
	}
	
	// 글 목록 1 getTradeList
	@RequestMapping("/Mypage/getMypageList")
	public String getTradeList( TradeVO vo, Model model, HttpSession session) {
		System.out.println("getMyTradeList");
		System.out.println("내 리뷰목록, 판매구매 리스트 보여주기");
		vo.setTrade_nick((String)session.getAttribute("user_nick"));
		model.addAttribute("tradeList", tradeService.getMyTradeList(vo));
		return "/Mypage/MypageTradeList"; // View 이름 리턴
	}
	
	// 글 보기 getTrade
	@RequestMapping("/Mypage/getMypageTrade")
	public String getTrade(TradeVO vo, Model model) {
		System.out.println(vo.getTrade_seq());
		model.addAttribute("trade", tradeService.getTrade(vo));
		System.out.println("getTrade");
		System.out.println(tradeService.getTrade(vo));
		return "/Mypage/MypageTrade";
	}
	
	// 리뷰 입력/수정 
	@RequestMapping("/Mypage/updateReview")
	public String updateReview(@ModelAttribute("trade") TradeVO vo, Model model, HttpSession session) {
		System.out.println("updateReview 완료"); 
		tradeService.updateTrade(vo);
		return "redirect: /Mypage/getMypageList";
	}
	
}





  
   
   
   
   
   
