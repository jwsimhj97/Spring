<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title><spring:message code="message.user.login.title" /></title>
</head>
<body>
	<div class="container">
		<div class="logBox">
			<h1><spring:message code="message.user.login.title" /></h1>
			<div class="langBox">
				<a class="langPurBtn" href="login.do?lang=en"><spring:message code="message.user.login.language.en" /></a>
				<a class="langPurBtn" href="login.do?lang=ko"><spring:message code="message.user.login.language.ko" /></a>
			</div>
			
			<div class="loginForm">
				<form action="login.do" method="post">
<!-- 			<form action=login_proc.jsp method="post"> -->

					<!-- p.381 -->
					<fieldset>
						<div><label><spring:message code="message.user.login.id" /></label><input type="text" name="id" value="${userVO.id}"></div>
						<div><label><spring:message code="message.user.login.password" /></label><input type="password" name="password" value="${userVO.password}"></div>
						<div><button type="submit"><spring:message code="message.user.login.loginBtn" /></button></div>
					</fieldset>
					
					
				
<!-- 					<fieldset> -->
<!-- 						<div><label>아이디</label><input type="text" name="id"></div> -->
<!-- 						<div><label>비밀번호</label><input type="password" name="password"></div> -->
<!-- 						<div><button type="submit">로그인</button></div> -->
<!-- 					</fieldset> -->
				</form>
			</div>
		</div>
	</div>
</body>
</html>