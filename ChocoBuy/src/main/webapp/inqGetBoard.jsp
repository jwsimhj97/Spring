<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.impl.InqDAO" %>
<%@ page import="com.springbook.biz.board.InqVO" %>


<%
	// 세션에 저장된 글 목록을 꺼낸다.
	InqVO inqBoard=(InqVO) session.getAttribute("inqBoard");
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
			<a class="sPurBtn" href="logout_proc.jsp">Log-out</a>
		</div>
		
		<form action="inqUpdateBoard.do" method="post">
			<input name="inq_num" type="hidden" value="${inq_table.inq_num}">
			
			<table class="writeBox">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th><label>제목</label></th>
						<td><input name="title" type="text" value="${inq_table.title}"></td>
					</tr>
					<tr>
						<th><label>작성자</label></th>
						<td>${inq_table.inq_nickname}</td>
					</tr>
					<tr>
						<th><label>내용</label></th>
						<td><textarea name="inq_content" cols="40" rows="10">${inq_table.inq_content}</textarea></td>
					</tr>
					<tr>
						<th><label>업로드</label></th>
						<td>첨부파일 ${inq_table.inq_fileName }</td>
					</tr>
					<tr>
						<th><label>등록일</label></th>
						<td>${inq_table.inq_date}</td>
					</tr>
					<tr>
						<th><label>조회수</label></th>
						<td>${inq_table.inq_cnt}</td>
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
			<a class="grayBtn" href="inqInsertBoard.jsp">글등록</a>
			<a class="dPurBtn" href="inqDeleteBoard.do?inq_num=${inq_table.inq_num}">글삭제</a>
			<a class="blackBtn" href="inqGetBoardList.do">글목록</a>
			
		</div>
	</div>
</body>
</html>