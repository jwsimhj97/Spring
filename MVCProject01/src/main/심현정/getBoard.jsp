<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@ page import="com.springbook.biz.board.BoardVO" %>


<%
	// 1. 검색할 게시글 번호 추출
	String seq=request.getParameter("seq");

	// 2. DB 연동 처리
	BoardVO vo=new BoardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDAO=new BoardDAO();
	BoardVO board=boardDAO.getBoard(vo);
	
	// 3. 응답 화면 구성
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>글 상세</title>
</head>
<body>
	<div class="container boardListBox">
		<h1>글 상세</h1>
		<div class="loginState">
<!-- 			<p>테스트님 환영합니다!</p> -->
			<a class="logOutBtn" href="logout_proc.jsp">Log-out</a>
		</div>
		
		<form action="updateBoard_proc.jsp" method="post">
			<input name="seq" type="hidden" value="<%= board.getSeq()%>">
			
			<table class="writeBox">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th><label>제목</label></th>
						<td><input name="title" type="text" value="<%= board.getTitle()%>"></td>
					</tr>
					<tr>
						<th><label>작성자</label></th>
						<td><input name="title" type="text" value="<%= board.getWriter()%>"></td>
					</tr>
					<tr>
						<th><label>내용</label></th>
						<td><textarea name="content" cols="40" rows="10"><%= board.getContent()%></textarea></td>
					</tr>
					<tr>
						<th><label>등록일</label></th>
						<td><%= board.getRegDate()%></td>
					</tr>
					<tr>
						<th><label>조회수</label></th>
						<td><%= board.getCnt()%></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="btnBox2">
								<button class="purBtn" type="submit">글 수정</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		
		<div class="btnBox">
			<a class="grayBtn" href="insertBoard.jsp">글등록</a>
			<a class="dPurBtn" href="deleteBoard_proc.jsp?seq=<%= board.getSeq()%>">글삭제</a>
			<a class="blackBtn" href="getBoardList.jsp">글목록</a>
		</div>
	</div>
</body>
</html>