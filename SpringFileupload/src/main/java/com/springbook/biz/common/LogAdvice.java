package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//p.199~211	
@Service
//p.203
@Aspect // Aspect = Pointcut + Advice
public class LogAdvice {
//	p.201
//	@Pointcut("execution(*com.springbook.biz..*Impl.*(..))")
//	public void allPointcut() {}
//	@Pointcut("execution(*com.springbook.biz..*Impl.get*(..))")
//	public void getPointcut() {}
	
	
//	p.202
	@Pointcut("execution(*com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {}
	@Before("allPointcut()")
	public void printLog() {
		System.out.println("[공통 로그] 비즈니스 로직 수행 전 동작");
	}
	
	
	
	
	
	
	
	
	
	
//	p.189~198
//	public void printLog(JoinPoint jp) {
//		System.out.println("[공통 로그] 비즈니스 로직 수행 전 동작");
//	}
	
	
//	p.177~188
//	public void printLog() {
//		System.out.println("[공통 로그] 비즈니스 로직 수행 전 동작");
//	}
}
