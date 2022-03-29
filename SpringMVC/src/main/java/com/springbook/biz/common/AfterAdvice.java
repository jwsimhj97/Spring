package com.springbook.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//p.199~211	
@Service
@Aspect
public class AfterAdvice {
	@Pointcut("execution(*com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	@After("allPointcut()")
	public void finallyLog() {
		System.out.println("[사후 처리] 비즈니스 로직 수행 후 무조건 동작");
	}
	
	
	
	
	
//	p.189~198
//	public void finallyLog() {
//		System.out.println("[사후 처리] 비즈니스 로직 수행 후 무조건 동작");
//	}
}
