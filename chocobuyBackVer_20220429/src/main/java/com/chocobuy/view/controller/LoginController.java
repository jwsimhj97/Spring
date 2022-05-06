package com.chocobuy.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;
import com.chocobuy.biz.util.CertifiedPhoneNumber;

@Controller
@SessionAttributes("UserInfo")
public class LoginController {
	@Autowired
	private UserService userService;
	/* LOGOUT */
	@RequestMapping("/Login/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리");
		return "redirect: /index";
	}
//	/* LOGOUT-END */
	///////////////////////////////////////////////////////////////////////* LOGIN */	
	@RequestMapping(value="/Login/login",method=RequestMethod.GET)
	public String loginView(@ModelAttribute("user") UserVO vo) {
		System.out.println("로그인화면으로 이동");
		return "Login/login";
	}
	
	/* 로그인 번호 확인 */
	@RequestMapping(value={"/Login/getTelInfo","/Join/getTelInfo"})
	@ResponseBody 
	public int getTelInfo(@RequestParam("user_tel") String user_tel) {
		System.out.println("컨트롤러> 입력한 휴대폰 번호가 db에 있는지 확인합니다.");
		System.out.println("user_tel:"+user_tel);
		int a= userService.userTelCheck(user_tel);
		System.out.println(a);
		return a; 
	}
	
	@RequestMapping(value="/Login/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
	System.out.println("컨트롤러> 로그인 인증 처리");
		UserVO user=userService.getUser(vo);
		System.out.println("user: "+user);
		if(userService.getUser(vo)!=null){
			//로그인 성공 시 세션에 정보 저장
			session.setAttribute("user_uuid", user.getUser_uuid());
			
			
			return "redirect:/Trade/getTradeList";
		}else{
			//로그인 실패
			System.out.println("로그인 실패");
			return "/Login/login?msg=input_Failed";
		}
	}
	/* LOGIN-END */
	
	///////////////////////////////////////////////////////////////////////* 휴대폰 번호 인증 */
	@RequestMapping(value={"/Join/phoneCheck","/Login/phoneCheck"}) 
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber, CertifiedPhoneNumber ctp) { 
		System.out.println("컨트롤러> 휴대폰 번호 인증");
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		ctp.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		String msg=Integer.toString(randomNumber); 
		return msg;
	}
	
	///////////////////////////////////////////////////////////////////////* JOIN */	
	/* user_uuid, user_tel DB insert / Session */
	@RequestMapping("/Join/join_tel" )
	public String join_Tel(UserVO vo, HttpSession session, HttpServletRequest request) throws InterruptedException {
		System.out.println("컨트롤러> 전화번호 DB 처리");
		/* 세션이 있고, 해당 세션이라면 삭제 */
		session = request.getSession(false);
		if(session != null && session.getAttribute("UserInfo") != null) {
			session.invalidate();
		}
		UserVO user=userService.getUser(vo);
		System.out.println(user);
		if(user==null) {
			userService.insertUser(vo);
		}
		UserVO user2=userService.getUser(vo);
		/* 세션이 없을 때, 세션 생성해서 UserInfo를 넣어줌  */
		if(session == null){			
			session=request.getSession();
			session.setAttribute("UserInfo", user2);
		}
		return "redirect:/Join/join_area.jsp";
	}
	
	/* 주소인증 */
	@RequestMapping("/Join/join_area")
	public String join_Area(UserVO vo, HttpSession session) {
		System.out.println("컨트롤러> 주소 인증");
		userService.updateUserArea(vo);
		return "/Join/join_nick";
	}
	
	/* 닉네임  중복 처리 */
	@RequestMapping("/nameCheck") 
	@ResponseBody 
	public int nameCheck(@RequestParam("user_nick") String user_nick) {
		System.out.println("컨트롤러> 별명 중복 처리");
		int a= userService.nickDupCheck(user_nick);
		System.out.println(a);
		return a; 
	}	
	
	/* 닉네임 추가  */
	@RequestMapping("/Join/join_done")
	public String join_Nick(UserVO vo) {
		System.out.println("컨트롤러> 별명 db 입력");
		userService.updateUserNick(vo);
		return "redirect:/Join/join_done.jsp";
	}
	
	/*   */
	@RequestMapping("/Join/login" )
	public String join_Done(UserVO vo) {
		System.out.println("컨트롤러> join에서 사용한 세선 삭제");
		
		return "redirect:/Login/login.jsp";
	}
	
		
}
