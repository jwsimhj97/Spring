<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 

    <div class="container content-container">
        <div class="warp">
            <section class="sectionBox">
            <div class="flexContainer">
            <c:forEach items="${tradeList}" var="trade">
            	<div  onClick="location.href='getTrade?trade_seq=${trade.trade_seq}'"  class="listcontainer border-secondary">
            		<div class="listContainerhover">
            		<img src="https://dummyimage.com/280x149/fff/000.png" alt="untitledchoco" class="trade-img">
					</div>
					<div class="textcontent">
					<h4><span>${trade.trade_title}</span></h4>
					<small><i>${trade.trade_area}</i></small>
					<p>${trade.trade_money}원</p>
					</div>
				</div>
			</c:forEach>
            </div>
			</section>
        </div>
        <div style="clear:both"></div>
    </div>
<%@ include file="/WEB-INF/views/template/footer.jsp"  %>
</body>
</html>