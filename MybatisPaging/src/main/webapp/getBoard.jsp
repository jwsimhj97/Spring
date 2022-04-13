<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@ page import="com.springbook.biz.board.BoardVO" %>


<%
	// 세션에 저장된 글 목록을 꺼낸다.
	BoardVO board=(BoardVO) session.getAttribute("board");
	
// 	// 1. 검색할 게시글 번호 추출
// 	String seq=request.getParameter("seq");

// 	// 2. DB 연동 처리
// 	BoardVO vo=new BoardVO();
// 	vo.setSeq(Integer.parseInt(seq));
	
// 	BoardDAO boardDAO=new BoardDAO();
// 	BoardVO board=boardDAO.getBoard(vo);	
// 	// 	3. 응답 화면 구성
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		pId = $("#fileVal").text();
		if(pId!="") { 
			console.log("null아님"); 
		}else{
			$("#fileVal").addClass('hidden');			
		}
	});
</script>
<title>글 상세</title>
</head>
<body>
	<div class="container boardListBox">
		<h1>글 상세</h1>
		<div class="loginState">
<!-- 			<p>테스트님 환영합니다!</p> -->
			<a class="sPurBtn" href="logout_proc.jsp">Log-out</a>
		</div>
		
<!-- 	<form action="updateBoard_proc.jsp" method="post"> -->
		<form action="updateBoard.do" method="post">
			<input name="seq" type="hidden" value="${board.seq}">
			
			<table class="writeBox">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th><label>제목</label></th>
						<td><input name="title" type="text" value="${board.title}"></td>
					</tr>
					<tr>
						<th><label>작성자</label></th>
						<td>${board.writer}</td>
					</tr>
					<tr>
						<th><label>내용</label></th>
						<td><textarea name="content" cols="40" rows="10">${board.content}</textarea></td>
					</tr>
					<tr>
						<th><label>업로드</label></th>
						<td>첨부파일 ${board.fileName }</td>
					</tr>
					<tr>
						<th><label>등록일</label></th>
						<td>${board.regDate}</td>
					</tr>
					<tr>
						<th><label>조회수</label></th>
						<td>${board.cnt}</td>
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
			<a class="dPurBtn" href="deleteBoard.do?seq=${board.seq}">글삭제</a>
			<a class="blackBtn" href="getBoardList.do">글목록</a>
		</div>
	</div>
</body>
</html>