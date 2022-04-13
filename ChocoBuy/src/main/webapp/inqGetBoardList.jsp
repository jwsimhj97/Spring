<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springbook.biz.board.impl.InqDAO" %>
<%@ page import="com.springbook.biz.board.InqVO" %>


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
		<h2>1:1 문의</h2>
		<!-- 검색 시작 -->
		<div class="searchForm">
			<form action="inqGetBoardList.do" method="post">
				<fieldset>
					<select name="inq_searchCondition">
						<!-- p.393 -->
						<c:forEach items="${inqConditionMap }" var="option">
							<option value="${option.value }">${option.key }
						</c:forEach>
					</select>
					<input name="inq_searchKeyword" type="text">
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
				<c:forEach items="${boardList }" var="inqBoard">
				<ul>
					<li>${inq_table.inq_num }</li>
					<li class="ta_L"><a href="inqGetBoard.do?inq_num=${inq_table.inq_num }">${inq_table.inq_title}</a></li>
					<li>${inq_table.inq_nickname }</li>
					<li class="pc">${inq_table.inq_date }</li>
					<li class="pc">${inq_table.inq_cnt }</li>
				</ul>
				</c:forEach>
			</div>
		</div>
		
		
		<div class="btnBox2">
			<a class="blackBtn" href="inqInsertBoard.jsp">문의하기</a>
		</div>
	</div>
</body>
</html>