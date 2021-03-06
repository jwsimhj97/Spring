//package com.springbook.biz.user;
//
//import java.util.List;
//
//import org.springframework.context.support.AbstractApplicationContext;
//import org.springframework.context.support.GenericXmlApplicationContext;
//
//public class UserServiceClient {
//	public static void main(String[] args) {
//		// 1. Spring 컨테이너를 구동한다.
//		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
//
//		// 2. Spring 컨테이너로부터 UserServiceImpl 객체를 Lookup 한다.
//		UserService userService = (UserService) container.getBean("userService");
//		
//		// 3. 로그인 기능 테스트
//		UserVO vo = new UserVO();
//		vo.setId("test");
//		vo.setPassword("test1234");
//		
//		UserVO user  = userService.getUser(vo);
//		if(user != null) {
//			System.out.println(user.getName() + "님 환영합니다.");
//		}else {
//			System.out.println("로그인 실패");
//		}
//		
//		// 3-1. insert into users values(?,?,?,?);
////		UserVO vo1=new UserVO();
////		vo1.setId("hoggd");
////		vo1.setPassword("h1234");
////		vo1.setName("홍길동");
////		vo1.setRole("User");
////		userService.insertUser(vo1);
//		
//		// 3-2. update id기준 update
////		UserVO voUp=new UserVO();
////		voUp.setId("hoggd");
////		voUp.setPassword("h1234");
////		voUp.setName("홍길동");
////		voUp.setRole("User");
////		userService.updateUser(voUp);
//		
//		// 3-3. delete id기준 delete from users where id=?
////		UserVO voDel=new UserVO();
////		voDel.setId("hoggd");
////		userService.deleteUser(voDel);
//		
//		// 3-4. 전체목록 보여주기
////		List<UserVO> userList = userService.getUserList(user);
////		for(UserVO uList: userList) {
////			System.out.println("--->"+uList.toString());
////		}
//		
//		// 3-5. 선택한 아이디 정보만 보여주기		
//		List<UserVO> selList = userService.selectList(user);
//		for(UserVO uList: selList) {
//			System.out.println("--->"+uList.toString());
//		}		
//		
//		
//		// 4. Spring 컨테이너를 종료한다.
//		container.close();
//	}
//}
