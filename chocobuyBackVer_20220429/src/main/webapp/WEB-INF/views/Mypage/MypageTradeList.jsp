<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>글 목록</title>
<style>
body {margin: 0; padding: 0;}
.inner {width: 700px; height: 100%; margin: 100px auto; padding-bottom:20px; border-bottom: 1px solid gray;}
a, a:hover {text-decoration: none; color: inherit;}
h1 {text-align: center; border-bottom: 1px solid gray; padding-bottom: 30px;}
h3 {font-size: 16px; color: #17a2b8;}
.headLine{display:flex; justify-content: space-between; align-items: center; padding: 5px;}
.search tr td {display:flex; align-itmes: center;}
.search tr td select, .search tr td input {margin: 2px;}
#trade {width: 700px; margin: 20px auto; border-spacing: 0; tradeer-collapse: collapse; text-align: center;}
#trade th, #trade td {border-bottom: 1px solid gray; padding: 10px;}
.btn-light {display: block; margin: 0 auto;}
.btn-info {border-radius: 0; height: 30px; padding:5px; font-size: 14px;border-radius: 5px}
button.day {background-color: #1e1f21; color: #fff;}
button.dark {background-color: #fff; color: #1e1f21;}
button.day, button.dark{position: fixed; bottom: 20px; right: 20px;border-radius: 25px; font-size: 14px;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<div class="inner">
	<h1>MypageList</h1>
	<h2>${user_uuid}</h2>
	<h2>${user_nick}</h2>
<!-- 		<form class="form-inline" name="fm" action="getTradeListSearch" method="post"> -->
<!--   		<select class="form-control" id="sel1" name="searchCondition" style="display:inline-block!important;margin-right:10px;"> -->
<%-- 			<c:forEach items="${conditionMap}" var="option"> --%>
<%-- 				<option value="${option.value}"<c:if test="${tradeVO.searchCondition eq option.value}">selected</c:if>>${option.key}</option> --%>
<%-- 			</c:forEach> --%>
<!--     	</select> -->
<%--     		<input  type="text" name="searchKeyword" value="${tradeVO.searchKeyword}" placeholder="검색어를 입력하세요."> --%>
<!-- 			<input type="hidden" name="nowPage"> -->
<!--     		<button class="btn btn-success" type="button" onclick="pageFnc('0')">검색</button> -->
<!--   		</form> -->
	<table class="table table-hover">
    	<thead class="btn-primary">
      		<tr>
        		<th>리뷰작성</th>
        		<th>제목</th>
        		<th>작성자</th>
        		<th>등록일</th>
        		<th>거래상대</th>
       			<th>리뷰</th>
      		</tr>
   		</thead>
    	<tbody>
			<c:forEach items="${tradeList}" var="trade">
				<tr >
	  				<td><input type="button" onclick="location.href='getMypageTrade?trade_seq=${trade.trade_seq}'" value="리뷰작성"></td>
	 				<td>${trade.trade_title}</td>
	 				<td>${trade.trade_nick}</td>
	  				<td>${trade.trade_date}</td>
	  				<td>${trade.trade_buyinfo}</td>
	  				<td>${trade.trade_review}</td>
	  			</tr>
			</c:forEach>
    	</tbody>
  	</table>
	<button type="button" onClick="location.href='getMypageUser?user_nick=${user_nick}'" >Mypagemain.jsp 로 돌아가기</button>
	<div id="btnBox">	
		<div id="pgCnt" >
			<c:if test="${paging.startPage != 1 }">
				<button type="button"  onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<button type="button">${p }</button>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<button type="button" onClick="pageFnc(${p })">${p }</button>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<button type="button" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
			</c:if>
		</div>
  	</div><br>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>
<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "getTradeListSearch";
	frm.method = "post";
	frm.submit();	
}
</script>

</body>
</html>