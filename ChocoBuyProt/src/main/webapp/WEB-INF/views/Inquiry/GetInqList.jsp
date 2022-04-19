<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,com.springbook.biz.inquiry.InqVO" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %>



	<div class="container" align="center">
		<div class="warp">
			<div class="inq_tit">
			   <h1>1:1 문의사항</h1>      
			</div>
			<nav class="inquiry_searchBox">
			  <form class="" name="fm" action="/Inquiry/GetInqList" method="post">
			  	<select class="inqSearchSelect" id="sel1" name="inq_searchCondition">
					<c:forEach items="${inqConditionMap}" var="option">
						<option value="${option.value}" <c:if test="${inqVo.inq_searchCondition eq option.value}">selected</c:if>>${option.key}</option>
					</c:forEach>
			    </select>
			    <input class="inqSearchInput" type="text" name="inq_searchKeyword" value="${inqVo.inq_searchKeyword}" placeholder="검색어를 입력하세요.">
			<!--     <button class="btn btn-success" type="submit">검색</button> -->
				<input type="hidden" name="nowPage">
			    <button class="btn btn-success" type="button" onclick="pageFnc('0')">검색</button>
			    <button class="btn btn-inqWrite" type="button" onclick="location.href='/Inquiry/InsertInq'">새 문의글 작성</button>
			  </form>
			</nav>
			
			<div class="inqListTable">
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
				  <td class="title"><a href="GetInq?inq_num=${inq.inq_num}">${inq.inq_title}</a></td>
				  <td>${inq.inq_nickname}</td>
				  <td>${inq.inq_date}</td>
<%-- 				  <td class="tdCenter">${inq.inq_cnt}</td> --%>
				</tr>
			</c:forEach>
			    </tbody>
			  </table><br><br>
			  
			  <div id="btnBox" class="inq_pgBtnBox">
				<div id="pgCnt" class="btn-group">
				<c:if test="${paging.startPage != 1 }">
					<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<button type="button" class="btn btn-primary">${p }</button>
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
		
<%@ include file="/WEB-INF/views/template/footer.jsp" %>

<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "GetInqList";
	frm.method = "post";
	frm.submit();	
}
</script>

</body>
</html>
