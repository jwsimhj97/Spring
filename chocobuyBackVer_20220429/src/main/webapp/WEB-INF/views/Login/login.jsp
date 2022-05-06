<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 초코바이</title>
<!-- BOOTSTRAP 4.0 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user_login.js"></script>
</head>
<body>
<h1 class="title">chocobuy</h1>
<div class="inner">
	<div class="inner tel_inner">
		<form id="login_tel" name="login_tel">
			<div class="mobileNo"> 
				<div>
					<h2>로그인 <br>휴대폰 번호를 입력하세요</h2>
				</div> 
			</div>
			<div>
				<div>
					<input id="phone" type="text" name="user_tel" title="전화번호 입력" required/> 
					<button type="button" id="phoneChk" class="doubleChk btn btn-info">인증번호 보내기</button>
				</div>
			</div>
			<div> 
				<div>
					<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled="true" required/> 
					<button type="button" id="phoneChk2" class="doubleChk btn btn-info" disabled="true">본인인증</button>
				</div>
			</div> 
			<div>
				<div>
					<span class="point successPhoneChk">휴^_^.</span> 
					<input type="hidden" id="phoneDoubleChk"/> 
				</div> 
			</div>
			<div>
				<div>
					<button type="button" class="login_next_btn btn btn-info" disabled="true">로그인</button> 
				</div> 
			</div>		
		</form>
	</div>
	<hr>
	<div class="join_btn">
		<a href="/join/join_tel.jsp" class="btn btn-light">회원가입</a>
	</div>
</div>
</body>
</html>