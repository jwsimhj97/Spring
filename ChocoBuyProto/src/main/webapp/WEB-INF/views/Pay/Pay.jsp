<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BootStrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css.reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css.style.css">
<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>	
<title>결제</title>

<script>
var chk = false;
$(document).ready(function(){
	var IMP=window.IMP;
// 	IMP.init('${impKey}'); // 가맹점 식별코드
	IMP.init('imp76820413'); // 가맹점 식별코드

	// 카드
	$("#pay_card").click(function () {
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: "card",
			merchant_uid: "CHOCOBUY-" + new Date().getTime(),
			name: "초코바이 도움비",
			amount: 400,
			buyer_email: "email@email.com",
			buyer_name: "구매자 이름",
			buyer_tel: "구매자 전화번호",
			buyer_addr: "구매자 주소",
			buyer_postcode: "01192",
// 			<c:forEach items="${AppointmentList }" var="app">
//				amount: ${app.app_price },
//			</c:forEach>
//			buyer_email: "email@email.com",
//			<c:forEach items="${ChatroomList }" var="chat">
//				buyer_name: ${chat.user_nick2 }, // 구매자가 2맞나?
//			</c:forEach>
//			buyer_tel: "010-0000-0000", // 구매자 전화번호
//			buyer_addr: "강남대로 405 통영빌딩", // 구매자 주소 or 거래장소?
//			buyer_postcode: '123-456',			
			m_redirect_url: "http://localhost:8090/payments/complete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
    
	// 계좌이체
	$("#pay_trans").click(function () {
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: "trans",
			merchant_uid: "CHOCOBUY-" + new Date().getTime(),
			name: "초코바이 도움비",
			amount: 400,
			buyer_email: "email@email.com",
			buyer_name: "구매자 이름",
			buyer_tel: "구매자 전화번호",
			buyer_addr: "구매자 주소",
			buyer_postcode: "01192",
// 			<c:forEach items="${AppointmentList }" var="app">
//			amount: ${app.app_price },
//			</c:forEach>
//			buyer_email: "email@email.com",
//			<c:forEach items="${ChatroomList }" var="chat">
//				buyer_name: ${chat.user_nick2 }, // 구매자가 2맞나?
//			</c:forEach>
//			buyer_tel: "010-0000-0000", // 구매자 전화번호
//			buyer_addr: "강남대로 405 통영빌딩", // 구매자 주소 or 거래장소?
//			buyer_postcode: '123-456',			
			m_redirect_url: "http://localhost:8090/payments/complete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});

// 휴대폰 소액결제
	$("#pay_phone").click(function () {
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: "phone",
			merchant_uid: "CHOCOBUY-" + new Date().getTime(),
			name: "초코바이 도움비",
			amount: 400,
			buyer_email: "email@email.com",
			buyer_name: "구매자 이름",
			buyer_tel: "구매자 전화번호",
			buyer_addr: "구매자 주소",
			buyer_postcode: "01192",
// 			<c:forEach items="${AppointmentList }" var="app">
//			amount: ${app.app_price },
//			</c:forEach>
//			buyer_email: "email@email.com",
//			<c:forEach items="${ChatroomList }" var="chat">
//				buyer_name: ${chat.user_nick2 }, // 구매자가 2맞나?
//			</c:forEach>
//			buyer_tel: "010-0000-0000", // 구매자 전화번호
//			buyer_addr: "강남대로 405 통영빌딩", // 구매자 주소 or 거래장소?
//			buyer_postcode: '123-456',			
			m_redirect_url: "http://localhost:8090/payments/complete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
    
// 카카오페이  
	$("#pay_kakao").click(function () {
		IMP.request_pay({
			pg: "kakaopay",
			pay_method: "card",
			merchant_uid: "CHOCOBUY-" + new Date().getTime(),
			name: "초코바이 도움비",
			amount: 400,
			buyer_email: "email@email.com",
			buyer_name: "구매자 이름",
			buyer_tel: "구매자 전화번호",
			buyer_addr: "구매자 주소",
			buyer_postcode: "01192",
// 			<c:forEach items="${AppointmentList }" var="app">
//			amount: ${app.app_price },
//			</c:forEach>
//			buyer_email: "email@email.com",
//			<c:forEach items="${ChatroomList }" var="chat">
//				buyer_name: ${chat.user_nick2 }, // 구매자가 2맞나?
//			</c:forEach>
//			buyer_tel: "010-0000-0000", // 구매자 전화번호
//			buyer_addr: "강남대로 405 통영빌딩", // 구매자 주소 or 거래장소?
//			buyer_postcode: '123-456',			
			m_redirect_url: "http://localhost:8090/payments/complete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
});
		
function orderList(){
	let fm=document.fm;
	fm.action="/Pay/PayComplete";
	fm.method="post";
	fm.submit();
}
	
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<!-- hidden data start -->
<form action="com.chocobuy.view.controller.PayController" method="post">
	<c:forEach items="${ChatroomList }" var="chat">
		<input type="hidden" name="unm" id="unm" value="${chat.user_nick2 }"/> <!-- 구매자 -->
	</c:forEach>
	<input type="hidden" name="utel" id="utel" value="000-0000-0000"/> <!-- 전화번호 있나? -->
	<input type="hidden" name="umail" id="umail" value="email@email.com"/> <!-- 이메일은 있나? -->
	<input type="hidden" name="uaddr" id="uaddr" value="강남대로 405 통영빌딩"/> <!-- 주소도 없는데..? -->
	<c:forEach items="${AppointmentList }" var="app">
		<input type="hidden" name="amount" id="amount" value="${app.app_price }"/> <!-- 금액 -->
</c:forEach>
	<input type="hidden" name="merchant_uid" id="merchant_uid" value="merchant_uid"/> <!-- 주문번호 어떻게? -->
</form>
<!-- hidden data end -->

<form name="fm">
	<h1>결제방법 선택</h1>
	<table class="w-auto mx-auto">
	<tr>
		<td>
			<button id="pay_card" class="btn btn-info btn-lg" type="button">카드결제</button>
			<button id="pay_trans" class="btn btn-info btn-lg" type="button">실시간 계좌이체</button>
			<button id="pay_phone" class="btn btn-info btn-lg" type="button">휴대폰 소액결제</button>
			<button id="pay_kakao" class="btn btn-info btn-lg" type="button">카카오페이</button>
		</td>
	</tr>
	</table>
	<table class="w-auto mx-auto">
	<tr>
		<td>
			<br>
			<a href="/Pay/PayIndex" class="btn btn-light btn-lg" role="button">취소하기</a>
		</td>
	</tr>
	</table>
</form>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>