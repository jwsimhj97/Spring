package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserVO;

//p.199~	
@Service
@Aspect
public class AfterReturningAdvice {
//	p.212~214
	@AfterReturning(pointcut="PointcutCommon.getPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) {
		String method = jp.getSignature().getName();
		
		if(returnObj instanceof UserVO) {
			UserVO user = (UserVO) returnObj;
			if(user.getRole().equals("Admin")) {
				System.out.println(user.getName() + " 로그인(Admin)");
			}
		}
		
		System.out.println("[사후 처리]" + method + "() 메소드 리턴값 : " + returnObj.toString());
	}
	
	
	
	
	
//	p.199~211	
//	@Pointcut("execution(*com.springbook.biz..*Impl.get*(..))")
//	public void getPointcut() {}
	
	
//	@AfterReturning(pointcut="execution(*com.springbook.biz..*Impl.get*(..))", returning="returnObj") 	=> @Pointcut과 @AfterReturning을 합친
//	@AfterReturning(pointcut="getPointcut()", returning="returnObj")
//	public void afterLog(JoinPoint jp, Object returnObj) {
//		String method = jp.getSignature().getName();
//		
//		if(returnObj instanceof UserVO) {
//			UserVO user = (UserVO) returnObj;
//			if(user.getRole().equals("Admin")) {
//				System.out.println(user.getName() + " 로그인(Admin)");
//			}
//		}
//		
//		System.out.println("[사후 처리]" + method + "() 메소드 리턴값 : " + returnObj.toString());
//	}
	
	
	
	
	
	
//	p.189~198
//	public void afterLog(JoinPoint jp, Object returnObj) {
//		String method = jp.getSignature().getName();
//		
//		if(returnObj instanceof UserVO) {
//			UserVO user = (UserVO) returnObj;
//			if(user.getRole().equals("Admin")) {
//				System.out.println(user.getName() + " 로그인(Admin)");
//			}
//		}
//		System.out.println("[사후 처리] " + method + "() 메소드 리턴값 : " + returnObj.toString());
//	}
	
	
	
//	p.177~188
//	public void afterLog() {
//		System.out.println("[사후 처리] 비즈니스 로직 수행 후 동작");
//	}
}
