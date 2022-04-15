<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,com.springbook.biz.inquiry.InqVO" %>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<div class="container" align="center">
		<div class="warp">
			<div class="inq_tit">
			   <h1>1:1 문의사항</h1>      
			</div>
			<nav class="inquiry_searchBox">
			  <form class="" name="fm" action="getInqList.do" method="post">
			  	<select class="" id="sel1" name="inq_searchCondition" style="display:inline-block!important;margin-right:10px;">
					<c:forEach items="${inqConditionMap}" var="option">
						<option value="${option.value}" <c:if test="${inqVo.inq_searchCondition eq option.value}">selected</c:if>>${option.key}</option>
					</c:forEach>
			    </select>
			    <input class="" type="text" name="inq_searchKeyword" value="${inqVo.inq_searchKeyword}" placeholder="검색어를 입력하세요.">
			<!--     <button class="btn btn-success" type="submit">검색</button> -->
				<input type="hidden" name="nowPage">
			    <button class="btn btn-success" type="button" onclick="pageFnc('0')">검색</button>
			    <a class="blackBtn" href="insertInq.jsp">새글 등록</a>
			  </form>
			</nav>
			
			<div class="">
			  <table class='table table-bordered'>
			  	<colgroup>
			  		<col width="10%">
			  		<col width="50%">
			  		<col width="15%">
			  		<col width="">
			  	</colgroup>
			    <thead class="">
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>등록일</th>
<!-- 			        <th>조회수</th> -->
			      </tr>
			    </thead>
			    <tbody>
			<c:forEach items="${inqList}" var="inq">
				<tr>
				  <td>${inq.inq_num}</td>
				  <td><a href="getInq.do?inq_num=${inq.inq_num}">${inq.inq_title}</a></td>
				  <td>${inq.inq_nickname}</td>
				  <td>${inq.inq_date}</td>
<%-- 				  <td class="tdCenter">${inq.inq_cnt}</td> --%>
				</tr>
			</c:forEach>
			    </tbody>
			  </table><br><br>
			  
			  <div id="btnBox"  style="text-align: center;">
				<div id="pgCnt" class="btn-group">
				<c:if test="${paging.startPage != 1 }">
					<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<button type="button" class="btn btn-primary" style="color:#f00;">${p }</button>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<button type="button" class="btn btn-primary" onClick="pageFnc(${p })">${p }</button>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
				</c:if>
				</div>
			  </div><br>
			  
			</div>
		</div>
	</div>
		
<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "getInqList.do";
	frm.method = "post";
	frm.submit();	
}
</script>

</body>
</html>
