<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<title>고객센터 내용 상세보기</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %>
	<div class="container">
		<div class="">
			<h1 style="display: flex; justify-content: center;">자주 묻는 질문 상세페이지</h1>
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"></div> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<table class="table table-hover"> -->
	  		  	<div class="input-group mb-3">
		      		<div class="input-group-prepend"></div>
		      	</div>
				<form name="fm" action="/Service/UpdateQna"><!-- POST방식 -->
					<table class="table table-bordered" style="text-align:center">
						<tr>
							<td>번호</td>
							<input type="hidden" name="qna_seq" value="${qna.qna_seq}">
							<td>${qna.qna_seq}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${qna.qna_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							
							<td><div style="white-space:pre;"><c:out value="${qna.qna_content}" /></div></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${qna.qna_writer}</td>
						</tr>
	<!-- 					<div id="footer"> -->
					</table>
					<div align="left">
					<a href="/Service/QnaController" class="btn btn-primary pull-Right">글 목록</a><!--GET방식  -->
					</div>
					<div align="right">
<!-- 						<a href="/Service/ServiceController.do" class="btn btn-primary pull-Right">글 목록</a> -->
						<button type="submit" class="btn btn-primary pull-Right">수정</button>
						<a href="/Service/deleteQna?service_seq=${qna.qna_seq}" class="btn btn-primary pull-Right">삭제</a>
<!-- 						<button type="submit" class="btn btn-primary pull-Right">삭제</button> -->
					</div>
				</form>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>