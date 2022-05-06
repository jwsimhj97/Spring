<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- BOOTSTRAP 4.0 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>회원가입 | 초코바이</title>
<style>
body {margin: 0; padding: 0;}
.inner {width: 500px; height: 100%; margin: 100px auto;}
.inner h1 {text-align: center;}
</style>

</head>
<body>

<div class="inner">
<!-- 이용약관 동의...? -->

	<h1>별명</h1>
	<hr>
	
	<form id="form" name="form" > 
		<div id="content">
<!-- 중복확인 버튼 -->
			<div>
				<input type="text" id="user_nick" name="user_nick" placeholder="별명을 입력하세요" maxlength="16" title="8자 까지 입력" required/> 
				<span class="point successNameChk">이름은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
				<input type="hidden" id="nameDoubleChk"/>
			</div>
			<div>
				<button type="button" id="dup_btn" class="btn btn-light">중복확인</button>
			</div>
<!-- 다음 버튼 -->
			<div>
			<button type="button" class="nick_next_btn btn btn-info" disabled>다음</button>
			</div>
		</div>	
	</form>

</div>

<script type="text/javascript" src="/js/user_join.js"></script>
</body>
</html>