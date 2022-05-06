package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/Login/login", method = RequestMethod.GET)
	public String loginView(UserVO vo) {
		System.out.println("로그인 화면으로 이동");
		vo.setId("test");
		vo.setPassword("test1234");
		return "/Login/login";
	}

	@RequestMapping(value = "/Login/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		System.out.println("로그인 인증 처리...");

		if (userService.getUser(vo) != null) {
			session.setAttribute("userId", userService.getUser(vo).getId());
			session.setAttribute("userName", userService.getUser(vo).getName());
			return "/Board/getBoardList";
//			return "/Inquiry/GetInqList";
		} 
		else {
			return "/Login/login?error=1";
		}
	}

	@RequestMapping("/Login/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/Login/login";
	}
}
