<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 초코바이</title>
<!-- BOOTSTRAP 4.0 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/user_join.js"></script>
<style>
.inner {width: 400px; height: 100%; margin: 0 auto;}
</style>
</head>
<body>
	<h1>전화번호 인증페이지</h1><!-- 삭제할 것 -->
	
	<div class="inner tel_inner">
		<form id="join_tel" name="join_tel">
			<div class="mobileNo"> 
				<div>
					<h2>휴대폰 번호를 입력하세요</h2>
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
					<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/> 
					<button type="button" id="phoneChk2" class="doubleChk btn btn-info">본인인증</button>
				</div>
			</div> 
			<div>
				<div>
					<span class="point successPhoneChk">휴^_^.</span> 
					<input type="hidden" id="phoneDoubleChk"/> 
				</div> 
			</div>
		</form>
			<div>
				<div>
					<button type="button" class="tel_next_btn next_btn btn btn-info" disabled>다음</button> 
				</div> 
			</div>		
	</div>
</body>
</html>