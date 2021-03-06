package com.chocobuy.view.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.chocobuy.biz.pay.PayService;
import com.chocobuy.biz.pay.PayVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes("pay")
public class PayController {
	
	@Autowired
	private PayService payService;

	// test...
	@RequestMapping("/Pay/PayIndex")
	public String payIndex() {
		return "/Pay/PayIndex";
	}
	@RequestMapping("/Pay/Pay")
	public String payPay() {
		return "/Pay/Pay";
	}
	@RequestMapping("/Pay/PayComplete")
	public String payComplete() {
		return "/Pay/PayComplete";
	}
	@RequestMapping("/index")
	public String index() {
		return "/index";
	}
	
	// insert
	@RequestMapping("/Pay/insertPay")
	public String insertPay(PayVO vo) {
		payService.insertPay(vo);
		return "redirect:/Pay/getPay"; // list아님
	}
	// update
	@RequestMapping("/Pay/updatePay")
	public String updatePay(@ModelAttribute("pay") PayVO vo, HttpSession session) {
		if( vo.getPay_sell().equals(session.getAttribute("trade_nick").toString()) ){ // ??
			payService.updatePay(vo);
			return "redirect:/Pay/getPayList";
		}else {
			return "getPay?error=1";
		}
		
	}
	// delete
	@RequestMapping("/Pay/deletePay")
	public String deletePay(PayVO vo) {
		payService.deletePay(vo);
		return "/Pay/getPayList";
	}
	// get
	@RequestMapping("/Pay/getPay")
	public String getPay(PayVO vo, Model model) {
		model.addAttribute("pay", payService.getPay(vo));
		return "/Pay/PayComplete";
	}
	//
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("카테고리", "pay_category");
		conditionMap.put("주문번호", "pay_ordernum");
		return conditionMap;
	}
	// list
	@RequestMapping("/Pay/getPayList")
	public String getPayListPost(PayVO vo, Model model) {
		System.out.println("결제내역 검색 처리");
		
		// null Check
		if(vo.getSearchCondition()==null) vo.setSearchCondition("pay_ordernum");
		if(vo.getSearchKeyword()==null) vo.setSearchKeyword("");
		// model 정보 저장
		model.addAttribute("payList", payService.getPayList(vo));
		return "/Pay/getPayList";
	}
	
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	//"아임포트 Rest Api key";
	public static final String KEY = "4838686133176154";
	//"아임포트 Rest Api Secret"; 
	public static final String SECRET = "2dd5298b5f266390639487861daa1caebf4bb79719f88a0627d7d9b809d3bd828dc32b3b3670112e"; 
	
	// 아임포트 인증(토큰)을 받아주는 함수 
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET); 
		try { 
			post.setEntity( new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			result = resNode.get("access_token").asText(); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return result;
	}
		
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet();
		for(Entry<String,String> entry : entries) {
		 paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} 
		return paramList; 
	} 
		
	// 아임포트 결제금액 변조를 방지하는 함수 
		 public void setHackCheck(String amount,String mId,String token) { 
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
			Map<String,String> m =new HashMap<String,String>();
			post.setHeader("Authorization", token);
			m.put("amount", amount);
			m.put("merchant_uid", mId);
			try { 
				post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
				HttpResponse res = client.execute(post);
				ObjectMapper mapper = new ObjectMapper();
				String body = EntityUtils.toString(res.getEntity());
				JsonNode rootNode = mapper.readTree(body);
				System.out.println(rootNode); 
			} catch (Exception e) {
				e.printStackTrace(); 
			} 
		} 
	
	//상품결제 폼 호출
	@RequestMapping(value="Pay", method=RequestMethod.GET)
	public String pay(HttpServletRequest request, Model model) {
		String nm = request.getParameter("unm");
		model.addAttribute("impKey", "imp76820413"); // 가맹점 식별코드
		return "Pay";
	}
	
	//결제 진행 폼=> 이곳에서 DB저장 로직도 추가하기
	@RequestMapping(value="Pay", method=RequestMethod.POST)
	public void payment(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String nm = request.getParameter("unm");
		String amount = request.getParameter("amount");
		String mid = request.getParameter("mid");
		String token = getImportToken();
		setHackCheck(amount, mid, token);
		
//		PrintWriter out = response.getWriter();
//		response.setContentType("text/html; charset=utf-8");
//		out.println("<html>");
//		out.println("<head><title>주문완료</title></head>");
//		out.println("<body>");
//		out.print(nm+"님의 주문이 완료 되었습니다.<br>");
//		out.print("상점 거래ID: "+mid+"<br>");
//		out.print("결제 금액: "+amount+"<br>");
//		out.print("<a href='/pay'>쇼핑 계속하기</a>");
//		out.print("<a href='javascript:(\"준비중입니다.\");'>나의 주문내역</a>");
//		out.println("</body></html>");
	}
}