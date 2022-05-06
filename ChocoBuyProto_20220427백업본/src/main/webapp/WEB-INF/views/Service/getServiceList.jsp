<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<script>
	$(function() {
		console.log($('.hide-tr'));
		$('.hide-tr').hide();
		$('.click-tr').click(function() {
			$(this).next().toggle();
		});
	});
</script>
<title>초코바이 고객센터</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 


	<h1 align="center">초코바이 고객센터</h1>
	
	<div class="container">
		<div class="row">
			<table class="table table-bordered" style="text-align:center">
				
				<thead>
				
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">글번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<c:forEach items="${serviceList }" var="service">
				<tr>
					<td>${service.service_seq }</td>
					<td><a href="/Service/getService?service_seq=${service.service_seq }">${service.service_title }</a></td>
					<td>${service.service_writer }</td>
					<td>${service.service_date }</td>
					<td>${service.service_cnt }</td>
				</tr>
				</c:forEach>
				<tbody>
					
				</tbody>
			</table>
<!-- 			페이징 처리 -->
<!-- 					<div id="btnBox"  style="text-align: center;"> -->
<!-- 		<div id="pgCnt" class="btn-group">< -->
<%-- 		<c:if test="${paging.startPage != 1 }"> --%>
<%-- 			<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button> --%>
<%-- 		</c:if> --%>
<%-- 		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p"> --%>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${p == paging.nowPage }"> --%>
<%-- 					<button type="button" class="btn btn-primary" style="color:#f00;">${p }</button> --%>
<%-- 				</c:when> --%>
<%-- 				<c:when test="${p != paging.nowPage }"> --%>
<%-- 					<button type="button" class="btn btn-primary" onClick="pageFnc(${p })">${p }</button> --%>
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:if test="${paging.endPage != paging.lastPage}"> --%>
<%-- 			<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.endPage+1})">&gt;</button> --%>
<%-- 		</c:if> --%>
<!-- 		</div> -->
<!--   </div> -->
  <br>
		</div>
		<div id="search">
			<!-- 검색 시작 -->
			<form action="getBoardList.do" method="post">
				<table>
					<tr>
						<td>
						<select name="searchCondition"	>
							<c:forEach items="${conditionMap}" var="option">
								<option value="${option.value}">${option.key}</option>
							</c:forEach>
							</select>
							<input name="searchKeyword" type="text" placeholder="검색어를 입력해주세요."/>
							<input id="searchSubmit" type="submit" class="btn btn-outline-primary" value="검색" />
						</td>
					</tr>
				</table>
			</form>
			<!-- 검색 종료 -->
		</div>
		<div style="text-align: right;">
			<a href="/Service/serviceWrite" class="btn btn-primary pull-Right">글쓰기</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>