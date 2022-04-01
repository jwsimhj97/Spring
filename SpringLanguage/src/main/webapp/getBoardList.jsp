<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>   
<%@ page import="java.util.List" %>
<%@ page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@ page import="com.springbook.biz.board.BoardVO" %>


<%-- <% --%>

<!-- 	// 세션에 저장된 글 목록을 꺼낸다. -->
<!-- // 	List<BoardVO> boardList=(List) session.getAttribute("boardList"); -->

<!-- // 	// 1. 사용자 입력 정보 추출(검색 기능은 나중에 구현) -->
<!-- // 	// 2. DB 연동 처리 -->
<!-- // 	BoardVO vo=new BoardVO(); -->
<!-- // 	BoardDAO boardDAO=new BoardDAO(); -->
<!-- // 	List<BoardVO> boardList=boardDAO.getBoardList(vo);	 -->
<!-- // 	// 3. 응답 화면 구성 -->
<!-- %> -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title><spring:message code="message.board.list.mainTitle" /></title>
</head>
<body>
	<div class="container boardListBox">
		<h1><spring:message code="message.board.list.mainTitle" /></h1>
		<div class="loginState">
			<p>${userName }<spring:message code="message.board.list.welcomeMsg" /></p>
			<a class="sPurBtn" href="logout.do">Log-out</a>
<!-- 		<a class="logOutBtn" href="logout_proc.jsp">Log-out</a> -->
		</div>
		
		<!-- 검색 시작 -->
		<div class="searchForm">
		<form action="getBoardList.do" method="post">
<!-- 		<form action=getBoardList.jsp method="post"> -->
				<fieldset>
					<select name="searchCondition">
						<!-- p.393 -->
						<c:forEach items="${conditionMap }" var="option">
							<option value="${option.value }">${option.key }
						</c:forEach>
						
<!-- 						<option value="TITLE">제목</option> -->
<!-- 						<option value="CONTENT">내용</option> -->
					</select>
					<input name="searchKeyword" type="text">
					<button type="submit"><spring:message code="message.board.list.search.condition.btn" /></button>
				</fieldset>
			</form>
		</div>
		<!-- 검색 종료 -->
		
		<div class="boardListTable">
			<div class="thead">
				<ul>
					<li><spring:message code="message.board.list.table.head.seq" /></li>
					<li><spring:message code="message.board.list.table.head.title" /></li>
					<li><spring:message code="message.board.list.table.head.writer" /></li>
					<li class="pc"><spring:message code="message.board.list.table.head.regDate" /></li>
					<li class="pc"><spring:message code="message.board.list.table.head.cnt" /></li>
				</ul>
			</div>
			<div class="tbody">
				<c:forEach items="${boardList }" var="board">
				<ul>
					<li>${board.seq }</li>
					<li class="ta_L"><a href="getBoard.do?seq=${board.seq }">${board.title}</a></li>
					<li>${board.writer }</li>
					<li class="pc">${board.regDate }</li>
					<li class="pc">${board.cnt }</li>
				</ul>
				</c:forEach>
				
<%-- 				<% for(BoardVO board: boardList) { %> --%>
<!-- 				<ul> -->
<%-- 					<li><%= board.getSeq() %></li> --%>
<%-- 					<li class="ta_L"><a href="getBoard.do?seq=<%= board.getSeq()%>"><%= board.getTitle() %></a></li> --%>
<%-- 					<li><%= board.getWriter() %></li> --%>
<%-- 					<li class="pc"><%= board.getRegDate() %></li> --%>
<%-- 					<li class="pc"><%= board.getCnt() %></li> --%>
<!-- 				</ul> -->
<%-- 				<% } %> --%>
			</div>
		</div>
		
		
		<div class="btnBox2">
			<a class="blackBtn" href="insertBoard.jsp"><spring:message code="message.board.list.link.insertBoard" /></a>
		</div>
	</div>
</body>
</html>