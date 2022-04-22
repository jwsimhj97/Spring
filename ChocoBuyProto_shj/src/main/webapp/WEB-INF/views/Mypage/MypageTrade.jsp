<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>글 상세</title>
<style>
body {margin: 0;padding: 0;}
.inner {width: 700px;height: 100%;margin: 100px auto;padding-bottom: 20px;border-bottom: 1px solid gray;position: relative;}
a {text-decoration: none;color: inherit;}
h1 {text-align: center;border-bottom: 1px solid gray;padding-bottom: 30px;}
.btn-info {border-radius: 0;height: 30px;padding: 5px;font-size: 14px;position:absolute;top: 91px;right: 5px;border-radius: 5px;}
table {margin: 60px auto 0px auto;width: 500px;}
table input, table textarea {width: 100%;}
table button {border: none;background-color: #fff}
.btn-group {display: flex;justify-content: center;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/header.jsp" %>
	<div class="inner">
		<h1>getTrade</h1>
		<h2>${userUuid}</h2>
		<h2>${userNick}</h2>
	</div>
	<form action="updateReview" method="post" name="fr" onsubmit="return check();">
            <table>
                <tr>
                    <td >글번호:</td>
                    <td><p>${trade.trade_seq}</p></td>
                </tr>
                <tr>
                    <td >작성자:</td>
                    <td><p>${trade.trade_nick}</p></td>
                </tr>
                <tr>
                    <td >제목:</td>
                    <td><p>${trade.trade_title}</p></td>
                </tr>
                <tr>
                    <td >금액:</td>
                    <td><p>${trade.trade_money}</p></td>
                </tr>
                <tr>
                    <td >구매자:</td>
                    <td><p>${trade.trade_buyinfo}</p></td>
                </tr>
                <tr>
                    <td >거래일:</td>
                    <td><p>${trade.trade_date}</p></td>
                </tr>
                <tr> 
                	<td>리뷰입력: </td>
	                <td> 
	                	<input id="user_nick" type="text" name="trade_review" value="${trade.trade_review}" placeholder="${trade.trade_review}" maxlength="50" title="8자 까지 입력" required autofocus/> 
	                </td> 
                </tr>
            </table>
            <hr>
 		<input type="submit" value="수정완료"/><button onClick="location.href='getMypageList'" type="button" >취소</button>
	</form>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>