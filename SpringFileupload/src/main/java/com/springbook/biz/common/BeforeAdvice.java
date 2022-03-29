package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//p.199~
@Service
@Aspect
public class BeforeAdvice {
//	p.212~214
	@Before("PointcutCommon.allPointcut()")
	public void beforeLog(JoinPoint jp) {
		String method = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		
		System.out.println("[사전 처리]" + method + "() 메소드 ARGS 정보 : " + args[0].toString());
	}
	
	
	
	
//	p.199~211	
//	@Pointcut("execution(*com.springbook.biz..*Impl.*(..))")
//	public void allPointcut() {}
//	
//	@Before("allPointcut()")
//	public void beforeLog(JoinPoint jp) {
//		String method = jp.getSignature().getName();
//		Object[] args = jp.getArgs();
//		
//		System.out.println("[사전 처리] " + method + "() 메소드 ARGS 정도 : " + args[0].toString());
//	}
	
	
//	p.189~198
//	public void beforeLog(JoinPoint jp) {
//		String method = jp.getSignature().getName();
//		Object[] args = jp.getArgs();
//		
//		System.out.println("[사전 처리]" + method + "() 메소드 ARGS 정보 : " + args[0].toString());
//	}
	
	
	
//	p.177~188
//	public void beforeLog() {
//		System.out.println("[사전 처리] 비즈니스 로직 수행 전 동작");
//	}
}
