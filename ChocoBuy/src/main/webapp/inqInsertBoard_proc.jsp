<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.impl.InqDAO" %>
<%@ page import="com.springbook.biz.board.InqVO" %>


<%
	// 1. 사용자 입력 정보 추출
	request.setCharacterEncoding("UTF-8");
	String inq_title=request.getParameter("inq_title");
	String inq_nickname=request.getParameter("inq_nickname");
	String inq_content=request.getParameter("inq_content");
	
	// 2. DB 연동 처리
	InqVO inqVo=new InqVO();
	inqVo.setInq_title(inq_title);
	inqVo.setInq_nickname(inq_nickname);
	inqVo.setInq_content(inq_content);
	
	InqDAO inqDAO=new InqDAO();
	inqDAO.inqInsertBoard(inqVo);
	
	// 3. 화면 네비게이션
	response.sendRedirect("inqGetBoardList.jsp");
	
%>
