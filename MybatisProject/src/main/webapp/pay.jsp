<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>	
<style>
	*{
  		font-family: 'Sunflower', sans-serif;
  	}
	h1{
   		text-align:center;
   		font-weight:800;
   		color:#FFC107;
   		text-decoration:underline;
   		text-underline-position: under;
   		padding-top: 20px;
   		padding-bottom: 20px;
   	}
</style>
<title>주문 페이지</title>
</head>
<body>
	<h1>결제방법 선택</h1>
	<table class="w-auto mx-auto">
	<tr>
		<td>
			<button onclick="requestPay1()" class="btn btn-warning btn-sm" role="button">카드결제(test)</button>
			<button onclick="requestPay2()" class="btn btn-warning btn-sm" role="button">실시간계좌이체(test)</button>
			<button onclick="requestPay3()" class="btn btn-warning btn-sm" role="button">휴대폰결제(test)</button>
			<button onclick="requestPay4()" class="btn btn-warning btn-sm" role="button">카카오페이(test)</button>
		</td>
	</tr>
	</table>
<script type="text/javascript">
	var IMP=window.IMP;
	IMP.init("imp76820413"); // 가맹점 식별코드

    function requestPay1() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "CHOCOBUY-" + new Date().getTime(),
          name: "초코바이 도움비",
          amount: 1000,
          buyer_email: "email@email.com",
          buyer_name: "구매자 이름",
          buyer_tel: "구매자 전화번호",
          buyer_addr: "구매자 주소",
          buyer_postcode: "01192"
      }, function (rsp) { // callback
          if (rsp.success) {
        	// 결제 성공 시 로직,
     			var msg="결제가 완료되었습니다.\r\n";
       			msg+="주문번호 : "+rsp.merchant_uid+"\r\n";
       			msg+="결제금액 : "+rsp.paid_amount+"원";
          } else {
			// 결제 실패 시 로직,
			var msg="결제에 실패하였습니다.\r\n";
			msg+="실패사유 : "+rsp.error_msg;
          }
      	  alert(msg);
          });
      };
    

	function requestPay2() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "trans",
          merchant_uid: "CHOCOBUY-" + new Date().getTime(),
          name: "초코바이 도움비",
          amount: 1000,
          buyer_email: "email@email.com",
          buyer_name: "구매자 이름",
          buyer_tel: "구매자 전화번호",
          buyer_addr: "구매자 주소",
          buyer_postcode: "01192"
      }, function (rsp) { // callback
          if (rsp.success) {
        	// 결제 성공 시 로직,
     			var msg="결제가 완료되었습니다.\r\n";
       			msg+="주문번호 : "+rsp.merchant_uid+"\r\n";
       			msg+="결제금액 : "+rsp.paid_amount+"원";
          } else {
			// 결제 실패 시 로직,
			var msg="결제에 실패하였습니다.\r\n";
			msg+="실패사유 : "+rsp.error_msg;
          }
      	  alert(msg);
          });
      };
    

	function requestPay3() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "phone",
          merchant_uid: "CHOCOBUY-" + new Date().getTime(),
          name: "초코바이 도움비",
          amount: 1000,
          buyer_email: "email@email.com",
          buyer_name: "구매자 이름",
          buyer_tel: "구매자 전화번호",
          buyer_addr: "구매자 주소",
          buyer_postcode: "01192"
      }, function (rsp) { // callback
          if (rsp.success) {
        	// 결제 성공 시 로직,
     			var msg="결제가 완료되었습니다.\r\n";
       			msg+="주문번호 : "+rsp.merchant_uid+"\r\n";
       			msg+="결제금액 : "+rsp.paid_amount+"원";
          } else {
			// 결제 실패 시 로직,
			var msg="결제에 실패하였습니다.\r\n";
			msg+="실패사유 : "+rsp.error_msg;
          }
      	  alert(msg);
      });
    };
    
    function requestPay4() {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kakaopay",
            pay_method: "card",
            merchant_uid: "CHOCOBUY-" + new Date().getTime(),
            name: "초코바이 도움비",
            amount: 1000,
            buyer_email: "email@email.com",
            buyer_name: "구매자 이름",
            buyer_tel: "구매자 전화번호",
            buyer_addr: "구매자 주소",
            buyer_postcode: "01192"
        }, function (rsp) { // callback
            if (rsp.success) {
           	// 결제 성공 시 로직,
   			var msg="결제가 완료되었습니다.\r\n";
     			msg+="주문번호 : "+rsp.merchant_uid+"\r\n";
     			msg+="결제금액 : "+rsp.paid_amount+"원";
            } else {
  			// 결제 실패 시 로직,
  			var msg="결제에 실패하였습니다.\r\n";
  			msg+="실패사유 : "+rsp.error_msg;
            }
        	  alert(msg);
        });
      };
</script>
</body>
</html>