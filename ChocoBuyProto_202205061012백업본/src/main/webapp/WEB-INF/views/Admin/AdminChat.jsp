<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>채팅창 관리</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<%int num=1; %>
	
	<div class="container-fluid">
		<nav class="admin-search-bar">
			<form name="fm" action="/Admin/adminMain" method="post">
				<div><strong>종료 상태</strong></div>
				<div class="checkbox-condition">
					<label>
						<input type="checkbox" name="role100" value=1 <%if((String)request.getParameter("role100")!=null) out.print("checked"); %>>
						<span>진행 중</span>
					</label>
					<label>
						<input type="checkbox" name="role0" value=1 <%if((String)request.getParameter("role0")!=null) out.print("checked"); %>>
						<span>종료</span>
					</label>
				</div>
				<div><strong>신고 상태</strong></div>
				<div class="checkbox-condition">
					<label>
						<input type="checkbox" name="role100" value=1 <%if((String)request.getParameter("role100")!=null) out.print("checked"); %>>
						<span>신고</span>
					</label>
					<label>
						<input type="checkbox" name="role0" value=1 <%if((String)request.getParameter("role0")!=null) out.print("checked"); %>>
						<span>미신고</span>
					</label>
				</div>
				<div class="text-center">
					<p>총 ${paging.total }건의 검색 결과</p>
					<input type="text" name="searchKeyword" value="" placeholder="검색어를 입력하세요">
					<button class="btn btn-success" onclick="pageFnc('0')">검색</button>
				</div>
				<input type="hidden" name="nowPage">
			</form>
		</nav>
		
		<div class="buttons">
		</div>
		
		<div class="list">
			<table class="table-bordered">
				<thead>
					<tr>
						<th><input type="checkbox" id="all_select" ></th>
						<th>번호</th>
						<th>채팅방 번호</th>
						<th>구매글 번호</th>
						<th>유저1 닉네임</th>
						<th>유저2 닉네임</th>
						<th>대화 수</th>
						<th>신고 여부</th>
						<th>종료 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminChat }" var="chat">
						<tr>
							<td><input type="checkbox"></td>
							<td><%out.print(num++); %></td>
							<td><a target="_blank" href="/Admin/adminChat?user_uuid=${chat.chat_num }">${chat.chat_numum }</a></td>
							<td>${chat.trade_seq }</td>
							<td>${chat.user_nick1 }</td>
							<td>${chat.user_nick2 }</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		
		<div id="btnBox"  style="text-align: center;">
	<div id="pgCnt" class="btn-group">
	<c:if test="${paging.startPage != 1 }">
		<button type="button" class="pageBtn btn btn-primary" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<button type="button" class="btn btn-primary" style="color:#f00;">${p }</button>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<button type="button" class="pageBtn btn btn-primary" onClick="pageFnc(${p })">${p }</button>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<button type="button" class="pageBtn btn btn-primary" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
	</c:if>
	</div>
  </div><br>
  
	</div>

<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "/Admin/adminChat";
	frm.method = "post";
	frm.submit();	
}
</script>	

</body>
</html>