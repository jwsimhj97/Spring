<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.impl.InqDAO" %>
<%@ page import="com.springbook.biz.board.InqVO" %>


<%
	// 1. 사용자 입력 정보 추출
	String inq_num=request.getParameter("inq_num");

	// 2. DB 연동 처리
	InqVO vo=new InqVO();
	vo.setInq_num(Integer.parseInt(inq_num));
	
	InqDAO inqDAO=new InqDAO();
	inqDAO.inqDeleteBoard(vo);
	
	// 3. 화면 네비게이션
	response.sendRedirect("inqGetBoardList.jsp");
%>


