package com.chocobuy.view.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chocobuy.biz.service.ServiceService;
import com.chocobuy.biz.service.ServiceVO;

@Controller
public class ServiceController {
	@Autowired
	private ServiceService serviceService;

	@RequestMapping("/Service/ServiceController")
	public String getServiceList(ServiceVO vo, Model model) {
		System.out.println("7777");
		//NULL Check
//		if(vo.getSearchCondition()==null) vo.setSearchCondition("TITLE");
//		if(vo.getSearchKeyword()==null) vo.setSearchKeyword("");
		
		// Model 정보 저장
		model.addAttribute("serviceList", serviceService.getServiceList(vo));
		System.out.println("테스트");
		return "/Service/getServiceList";	// View 이름 리턴
	}
	// 검색 조건 목록 설정
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("제목",  "TITLE");
			conditionMap.put("내용", "CONTENT");
			return conditionMap;
		}
		
//	상세페이지 화면 리스트 
		@RequestMapping("/Service/getService")
		public String getService(ServiceVO vo, Model model) {
			model.addAttribute("service", serviceService.getService(vo));	// Model 정보 저장
			return "/Service/ServiceContent";	// View 이름 리턴
	}
		
	// 글 등록
	@RequestMapping("/Service/insertService")
	public String insertService(ServiceVO vo) throws IOException{
		
		serviceService.insertService(vo);
		return "redirect: /Service/ServiceController";
	}
	
	// 글 등록 페이지 이동
		@RequestMapping("/Service/serviceWrite")
		public String serviceWrite(ServiceVO vo) throws IOException{
			
			return "/Service/ServiceWrite";
		}
		
	
	
//	// 글 수정
//		@RequestMapping("/Service//updateBoard")
//		public String updateBoard(@ModelAttribute("service") ServiceVO vo) {
//			System.out.println("번호 : " + vo.getSeq());
//			System.out.println("제목 : " + vo.getTitle());
//			System.out.println("작성자 : " + vo.getWriter());
//			System.out.println("내용 : " + vo.getContent());
//			System.out.println("등록일 : " + vo.getDate());
//			System.out.println("조회수 : " + vo.getCnt());
//			System.out.println("작성자 이름 : " + vo.getWriter());
//			serviceService.updateService(vo);
//			return "getServiceList";
//		}
		
//		// 글 삭제
//		@RequestMapping("/Service/deleteBoard")
//		public String deleteBoard(BoardVO vo) {
//			serviceService.deleteBoard(vo);
//			return "getServiceList";
//		}
//		
//		// 글 상세 조회
//		@RequestMapping("/Service/getService")
//		public String getBoard(BoardVO vo, Model model) {
//			model.addAttribute("service", serviceService.getService(vo));	// Model 정보 저장
//			return "getServiceList";	// View 이름 리턴
//		}
//		//인덱스 글 목록
//		@RequestMapping("index")
//		public String getIndexListPost( Trade vo, Model model) {
//			System.out.println("인덱스 글 목록 검색 처리");
//			if(vo.getSearchCategory() ≠ null) vo.setSearchCategory(vo.getSearchCategory());
//			else vo.setSearchCategory("");
//			model.addAttribute("tradeList",tradeService.getTradeList(vo));
//			return "index";
//		}
//		@RequestMapping("/trade/getSearchIndexList")
//		public String getIndexSearchPost( TradeVO vo, Model model) {
//			System.out.println("글 검색어 검색 처리");
//			if(vo.getSearchInput() ≠ null) vo.serSearchInput(vo.getSearchInput());
//			else vo.setSearchInput("");
//			model.addAttribute("tradeList", tradeService.getSearchTradeList(vo));
//			return "TradeList";
//		}

		
		
}
