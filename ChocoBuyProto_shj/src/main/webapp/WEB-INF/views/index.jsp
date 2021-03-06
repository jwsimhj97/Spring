<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% if(request.getAttribute("tradeList")==null){
	response.sendRedirect("/index");
	
} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/inquiry.css">
<script>



</script>
<style>

.sectionBox{
	width : 1000px;	
}
.wrap{
/* 	border : 1px solid #ddd; */
}
.flexContainer{
	display : flex;
	flex-wrap: wrap;
	
	
	
}
.listcontainer{
	margin-top : 15px;
	width : 300px;
	padding : 10px;
	margin : 15px;
	border-radius: 15px; 
	border: 1px solid #cfdddd;
	border-color: #cfdddd !important;
}
.listcontainer:hover {
/* 	border : 1px solid #0ff; */
 	border-radius: 15px; 
	background-color : rgba(88,166,166,0.2);
    border-color: #fff !important;
}
.listContainerhover:hover::after{
	background-color : rgba(88,166,166,0.2);
}

.textcontent{
	border-top : 1px solid #ddd;
	padding : 5px;
	margin : 10px;
}
 .untitledchoco{
 width : 250px;
 }
</style>
<title>Insert title here</title>
</head>
<body>

<header class="header">
        <div class="container">
            <div class="logoBox">
                <a href="" class="logo">CHOCO-BUY logo</a>
            </div>
            <div class="searchBox">
                <form action="getSearchTradeList">
                    <input type="text" class="searchInput" name="searchInput" placeholder="???????????? ??????????????????." value="${trade.searchInput}">
                    <button type="submit" class="searchBtn">??????</button>
                </form>
            </div>
            <div class="hdMenuBox">
                <ul>
                    <li><a href="/Login/login">?????????</a></li>
                    <li><a href="">???????????????</a></li>
                    <li><a href="">????????????</a></li>
                </ul>
            </div>
        </div>
    </header>
    <div class="menuBox">
        <div class="container">
            <div class="menuBar">
                <ul>
                    <li><a href="index">??????</a></li>
                    <li><a href="index?searchCategory=??????">??????</a></li>
                    <li><a href="index?searchCategory=??????">??????</a></li>
                    <li><a href="index?searchCategory=??????">??????</a></li>
                    <li><a href="index?searchCategory=?????????">?????????</a></li>
                    <li><a href="index?searchCategory=???????????????">???????????????</a></li>
                    <li><a href="index?searchCategory=????????????">????????????</a></li>
                    <li><a href="index?searchCategory=????????????">????????????</a></li>
                    <li>
	                    <a href="/Login/login">
	                    	<div class="btnBox">
								<button type="button" class="writeBtn">???????????????</button>
				           </div>
	                    </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    
	<div class="inquiryFixBox">
		<form class="form-signin" action="/Login/login">
			<button type="submit" class="inquiryFixBtn"><span class="hover">1:1</span>??????</button>
		</form>
	</div>
<!-- header -->
    <div class="container content-container">
        <div class="warp">
            <section class="sectionBox">
            
                        <div class="flexContainer">
            
            <c:forEach items="${tradeList}" var="trade">
            	<div  onClick="location.href='/Login/login'"  class="listcontainer border-secondary">
            		            		<div class="listContainerhover">
            		<img src="https://dummyimage.com/280x149/fff/000.png" alt="untitledchoco" class="trade-img">
					</div>
					<div class="textcontent">
					<h4><span class="sc-fznxKY kfRyXm">${trade.trade_title}</span></h4>
					<small><i>${trade.trade_area}</i></small>
					<p>${trade.trade_money}???</p>
					</div>
				</div>
			</c:forEach>
            	
                        </div>
				
				
			</section>
        </div>
        <div style="clear:both"></div>
    </div>



<!-- footer -->

<%@ include file="/WEB-INF/views/template/footer.jsp"  %>


</body>
</html>