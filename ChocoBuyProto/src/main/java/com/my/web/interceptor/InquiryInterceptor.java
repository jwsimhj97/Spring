package com.my.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chocobuy.biz.inquiry.InqService;
import com.chocobuy.biz.inquiry.InqVO;


public class InquiryInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private InqService inqService;
	
	// INQUIRY URL LIST
	static final String[] URL_INQLIST = {
		"/Inquiry/GetInq"
	};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String reqUrl = request.getRequestURL().toString();	// 요청한 전체 경로를 string으로 받아옴
		String uri = request.getRequestURI(); 				// 요청한 프로젝트 + 파일경로까지 받아옴
		String context = request.getContextPath();			// 프로젝트 Path (컨텍스트 path) 만 가져옴
		
//		인덱스 패스
		String path = uri.substring(context.length()); 		// 요청한 프로젝트 + 파일경로에서 프로젝트 Path를 제외한 그 이후의 경로만 가져옴
		if(path.equals("/")) {
			return true;
		}
		
		
		for (String target : URL_INQLIST) {
			HttpSession session = request.getSession();
			String UserInfo = (String)session.getAttribute("UserInfo");
			
			if (reqUrl.indexOf(target) > -1) {
//				if(UserInfo != ) {
//					return false;
//				}else {
//					return true;
//				}
			}
		}
		
		return true;
	}

}
