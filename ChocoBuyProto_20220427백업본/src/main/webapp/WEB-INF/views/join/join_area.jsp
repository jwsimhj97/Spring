<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<style>
tabel input{width: 400px;}
</style>
<!-- BOOTSTRAP 4.0 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/user_join.js"></script>
<title>회원가입 | 초코바이</title>
</head>
<body>
	<h1>주소인증페이지</h1>
	
	<form id="form" name="form" > 
		<input type="button" class="btn btn-light" onClick="goPopup();" value="인증하기"/>
		<div id="list"></div>
		<div id="callBackDiv">
			<table>
				<tr><td>시도명        	</td><td><input type="text" id="user_siNm"  name="user_siNm" disabled /></td></tr>
				<tr><td>시군구명        	</td><td><input type="text" id="user_sggNm"  name="user_sggNm" disabled /></td></tr>
				<tr><td>읍면동명        	</td><td><input type="text" id="user_emdNm"  name="user_emdNm" disabled /></td></tr>			
			</table>
			<button type="button" class="area_next_btn btn btn-info" disabled>다음</button>
		</div>
	</form>
</body>
</html>