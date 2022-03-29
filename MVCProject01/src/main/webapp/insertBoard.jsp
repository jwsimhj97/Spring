<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>새글 등록</title>
</head>
<body>
	<div class="container boardListBox">
		<h1>글 등록</h1>
		<div class="loginState">
<!-- 			<p>테스트님 환영합니다!</p> -->
			<a class="logOutBtn" href="logout_proc.jsp">Log-out</a>
		</div>
		
		<form action="insertBoard_proc.jsp" method="post">
			<table class="writeBox">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th><label>제목</label></th>
						<td><input name="title" type="text"></td>
					</tr>
					<tr>
						<th><label>작성자</label></th>
						<td><input name="writer" type="text" size="10"></td>
					</tr>
					<tr>
						<th><label>내용</label></th>
						<td><textarea name="content" cols="40" rows="10"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="btnBox2">
								<button class="purBtn" type="submit">새글 등록</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		
		<div class="btnBox">
			<a class="blackBtn" href="getBoardList.jsp">글 목록 가기</a>
		</div>
	</div>
</body>
</html>