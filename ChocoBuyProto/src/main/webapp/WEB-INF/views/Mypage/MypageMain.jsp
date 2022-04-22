<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>글 상세</title>
<style>
body {	margin: 0;	padding: 0;}
.inner {	width: 700px;	height: 100%;	margin: 100px auto;	padding-bottom: 20px;	border-bottom: 1px solid gray;	position: relative;}
a {	text-decoration: none;	color: inherit;}
h1 {	text-align: center;	border-bottom: 1px solid gray;	padding-bottom: 30px;}
.btn-info {	border-radius: 0;	height: 30px;	padding: 5px;	font-size: 14px;	position: absolute;	top: 91px;	right: 5px;	border-radius: 5px}
table {	margin: 60px auto 0px auto;	width: 500px;}
table input, table textarea {	width: 100%;}
table button {	border: none;	background-color: #fff}
.btn-group {	margin: 10px auto 0px auto;	display: flex;	justify-content: center;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/header.jsp" %>              
	<div class="inner">
		<h1>MypageMain</h1>
		<h2>${user_uuid}</h2>
		<h2>${user_nick}</h2>	
            <table>
                <tr>
                    <td >휴대폰번호</td>
                    <td><p>${user.user_tel}</p></td>
                </tr>
                <tr>
                    <td >주소</td>
                    <td><p>${user.user_area}</p></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><p>${user.user_nick}</p></td>
                </tr>
            </table>
		<hr>
		<div class="btn-group btn-group-sm">
			<button type="button" onClick="location.href='getMypageList?trade_nick=${user_nick}'" class="btn btn-light">리뷰보기</button>
			<button type="button" onClick="location.href='profileUpdate?user_nick=${user_nick}'" class="btn btn-light">내정보 수정</button>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>



