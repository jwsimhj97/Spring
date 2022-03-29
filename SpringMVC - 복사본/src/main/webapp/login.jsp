<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<div class="logBox">
			<h1>로그인</h1>
			<div class="loginForm">
				<form action="login.do" method="post">
<!-- 			<form action=login_proc.jsp method="post"> -->
					<fieldset>
						<div><label>아이디</label><input type="text" name="id"></div>
						<div><label>비밀번호</label><input type="password" name="password"></div>
						<div><button type="submit">로그인</button></div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>