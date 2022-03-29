<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@ page import="com.springbook.biz.board.BoardVO" %>


<%
	// 1. 사용자 입력 정보 추출(검색 기능은 나중에 구현)
	// 2. DB 연동 처리
	BoardVO vo=new BoardVO();
	BoardDAO boardDAO=new BoardDAO();
	List<BoardVO> boardList=boardDAO.getBoardList(vo);
	
	// 3. 응답 화면 구성
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>글 목록</title>
</head>
<body>
	<div class="container boardListBox">
		<h1>글 목록</h1>
		<div class="loginState">
			<p>테스트님 환영합니다!</p>
			<a class="logOutBtn" href="logout_proc.jsp">Log-out</a>
		</div>
		
		<!-- 검색 시작 -->
		<div class="searchForm">
			<form action=getBoardList.jsp method="post">
				<fieldset>
					<select name="searchCondition">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
					</select>
					<input name="searchKeyword" type="text">
					<button type="submit">검색</button>
				</fieldset>
			</form>
		</div>
		<!-- 검색 종료 -->
		
		<div class="boardListTable">
			<div class="thead">
				<ul>
					<li>번호</li>
					<li>제목</li>
					<li>작성자</li>
					<li class="pc">등록일</li>
					<li class="pc">조회수</li>
				</ul>
			</div>
			<div class="tbody">
				<% for(BoardVO board: boardList) { %>
				<ul>
					<li><%= board.getSeq() %></li>
					<li class="ta_L"><a href="getBoard.jsp?seq=<%= board.getSeq()%>"><%= board.getTitle() %></a></li>
					<li><%= board.getWriter() %></li>
					<li class="pc"><%= board.getRegDate() %></li>
					<li class="pc"><%= board.getCnt() %></li>
				</ul>
				<% } %>
			</div>
		</div>
		
		
		<div class="btnBox2">
			<a class="blackBtn" href="insertBoard.jsp">새글 등록</a>
		</div>
	</div>
</body>
</html>