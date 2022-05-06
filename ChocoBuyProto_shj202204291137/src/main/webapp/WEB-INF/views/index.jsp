<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% if(request.getAttribute("tradeList")==null){ --%>
<!-- // 	response.sendRedirect("/index"); -->
<%-- } %> --%>
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
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://kit.fontawesome.com/5661832475.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
$(document).ready(function(){
	$('.slick-track').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  prevArrow: $('.prev'),
		  nextArrow: $('.next')
		});
		$('.slick-background').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  autoplay: true,
		  fade: true,
		  cssEase: 'linear',
		  autoplaySpeed: 2000
		});
	$('.next').click(function(){
		$('.slick-next').click();
	});
	$('.prev').click(function(){
		$('.slick-prev').click();
	});
});
</script>
<style>
/* slick track */
#bannerContainer{background-color: transparent; width : 100%; height: 440px; padding : 0 16px; margin : 20px 0; position:relative;}
.banner_wrap {max-width: 1000px; height: 440px; margin: 0 auto;  padding: 30px 0; }
#bannerContainer .bannerInner {position: relative;}
#bannerContainer .banner_cont {width: 540px; height: 380px; position: absolute; right: 0; z-index: 1;}
#bannerContainer .bannerInner .arrow{ position : absolute; z-index : 100; border-radius: 50% ; width : 40px; height : 40px;  background-color : rgba(255,255,255,0.8)}
#bannerContainer .bannerInner .prev{ right : 520px; top : 50%; transform:translateY(-50%);}
#bannerContainer .bannerInner .prev::before {}
#bannerContainer .bannerInner .next{ right : -20px; top : 50%; transform:translateY(-50%);}
#bannerContainer .bannerInner .next::before {}
#bannerContainer .bannerInner .slick-slider{position:relative;}
#bannerContainer .bannerInner .slick-slider .slick-list{width:540px; height:380px; position:absolute; right:0;}
#bannerContainer .bannerInner .slick-slider .slick-list .slick-track>div{border-radius: 4px; overflow : hidden; }
#bannerContainer .bannerInner .slick-slider .slick-list .slick-track>div .slideImg{border-radius: 4px;  width: 540px; height: 380px}
/* slick-background */
#bannerContainer .slick-background {transition : background-color 350ms ease-out 0s; z-index :0; position : absolute; top:0; left : 0px; width:100%; height: 440px;margin:0 auto;}
#bannerContainer .slick-background .slick-arrow{ position : absolute; left : 0px; top : 30px; z-index:-999; color : transparent;}
#bannerContainer .slick-background  .bannerWrap{ width: 1000px; margin : 70px auto;}
#bannerContainer .slick-background .ban01{color : transparent; background-color : #cf2b3b;	width:100%; height: 440px; }
#bannerContainer .slick-background .ban02{color : transparent; background-color : #601b00;	width:100%; height: 440px; }
#bannerContainer .slick-background .ban03{color : transparent; background-color : #033bc2;	width:100%; height: 440px; }
#bannerContainer .slick-background .ban04{color : transparent; background-color : #007e7e;	width:100%; height: 440px; }
#bannerContainer .slick-background .banColor {}
#bannerContainer .slick-background .banColor .banTextBox {}
#bannerContainer .slick-background .banColor .banText {color : white; font-size: 20px; }



/* index Style*/
.sectionBox{width : 1000px;}
.wrap{/* 	border : 1px solid #ddd; */}
.flexContainer{display: table; /*  	display: flex; */ flex-wrap: wrap; width: calc(100% + 50px); margin-left: -25px;}
.listcontainer{width: 300px; height:258px; padding: 9px; border-radius: 15px; border: 1px solid #cfdddd; display: inline-block; border-color: #cfdddd !important; margin: 0 25px;}
.listcontainer:first-child {margin-top:0 !important;}
.listcontainer:nth-child(3n+1) {margin-top: 50px;}
.listcontainer:hover {/* 	border : 1px solid #0ff; */ border-radius: 15px;  background-color : rgba(88,166,166,0.2); border-color: #fff !important;}
.listContainerhover {border-radius: 15px;}
.listContainerhover:hover::after{background-color : rgba(88,166,166,0.2);}
.textcontent{border-top : 1px solid #ddd;	padding-top : 10px;	margin-top : 10px;}
/*  .untitledchoco{width : 250px; } */
.cardBox{ margin : 0 auto;}

.listContainerhover {width: 280px; position: relative; height: 149px; overflow: hidden;}
.trade-img {width: 280px; position: absolute; left: 0; top: 50%; transform: translateY(-50%);}

 
 
 
 
 
 /* hd menu Bar */
/*  .menuBox .container .menuNavBar { margin-top : 4px; } */
/*  .menuBox .container .menuNavBar .categoryToggle {font-size : 16px;  float : left;} */
/*  .menuBox .container .menuNavBar .categoryToggle .categoryDropdown {} */
/*  .menuBox .container .menuNavBar .categoryToggle .categoryDropdown #bannerContainer{ clear : both;} */
/*  .menuBox .container .menuNavBar .menuLink{ margin : auto 0;} */
.menuBox .container .menuNavBar {}
.menuBox .container .menuNavBar > li {margin-right: 20px; height: 50px; display: table;}
 .menuBox .container .menuNavBar > li > .menuNavTags {padding: 0; display: table-cell; vertical-align: middle; cursor:pointer;}
 
 /* bannerSearchBox */
#bannerContainer .slick-background .banColor .banSearchBox {margin-top : 20px; position : relative;}
#bannerContainer .slick-background .banColor .banSearchBox form { width: 350px; height: 40px; border : 3px solid white; }
#bannerContainer .slick-background .banColor .banSearchBox form .searchInput{text-indent:10px; padding : 2px;  width: 344px; height: 34px; border:0px; background-color: transparent; color : white;}
#bannerContainer .slick-background .banColor .banSearchBox form .searchInput::placeholder{ font-size : 15px; color : white;}
#bannerContainer .slick-background .banColor .banSearchBox form .searchBtn {width: 20px; height: 20px; /* background: url("/resources/img/common/searchBtn.png") no-repeat; */ background-size: contain;  text-indent: -9999px;  position: absolute; left: 370px; top: 50%; transform: translateY(-50%);}


/* 모바일 */
@media screen and (max-width: 1100px) {
	#bannerContainer .slick-background .bannerWrap {margin: 20px auto;}
}
</style>
<title>CHOCOBUY</title>
</head>
<body>

	<!-- header start -->
	<header class="header">
        <div class="container">
            <div class="logoBox">
                <a href="" class="logo">CHOCO-BUY logo</a>
            </div>
            <div class="searchBox">
                <form action="getSearchTradeList">
                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
                    <button type="submit" class="searchBtn"><i class="fas fa-search"></i>검색</button>
                </form>
            </div>
            <div class="hdMenuBox">
                <ul>
                    <li><a href="/Login/login">로그인</a></li>
                    <li><a href="/Login/login">마이페이지</a></li>
                    <li><a href="/Login/login">고객센터</a></li>
                </ul>
            </div>
        </div>
    </header>
	<!-- header end -->
    <div class="menuBox">
        <div class="container">
		    <ul class="nav menuNavBar">
			  	<li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle categoryToggle menuNavTags" href="#" id="navbardrop" data-toggle="dropdown">전체 카테고리 </a>
			      <div class="dropdown-menu categoryDropdown">
			        <a class="dropdown-item" href="index">전체</a>
			        <a class="dropdown-item" href="index?searchCategory=배달">배달</a>
			        <a class="dropdown-item" href="index?searchCategory=쇼핑">쇼핑</a>
			        <a class="dropdown-item" href="index?searchCategory=청소">청소</a>
			        <a class="dropdown-item" href="index?searchCategory=집안일">집안일</a>
			        <a class="dropdown-item" href="index?searchCategory=전문서비스">전문서비스</a>
			        <a class="dropdown-item" href="index?searchCategory=반려동물">반려동물</a>
			        <a class="dropdown-item" href="index?searchCategory=역할대행">역할대행</a>
			      </div>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link menuNavTags" href="#">이벤트</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link menuNavTags" href="#">Link</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link menuNavTags" href="#">Link</a>
			    </li>
			    <li>
	  				<span class="menuLink menuNavTags" onClick="location.href='Login/login'">초코바이에서 원하는 모든 일을 찾으세요! </span>
	  			</li>
	 		</ul>
			 
			<div class="inquiryFixBox">
				<form class="form-signin" action="/Login/login">
					<button type="submit" class="inquiryFixBtn"><span class="hover">1:1</span>문의</button>
				</form>
			</div>
        </div>
    </div>
	<div id="bannerContainer">
		<div class="banner_wrap">
			<div class="bannerInner">
				<div class="banner_cont">
					<button class="arrow next"><span><i class="fas fa-arrow-right"></i></span></button>
					<button class="arrow prev"><span><i class="fas fa-arrow-left"></i></span></button>
					<div class="slick-track">
						<div><img src="${pageContext.request.contextPath}/resources/img/ban/ban1_540_380.png" class = "slideImg"></div>
						<div><img src="${pageContext.request.contextPath}/resources/img/ban/ban2_540_380.png" class = "slideImg"></div>
						<div><img src="${pageContext.request.contextPath}/resources/img/ban/ban3_540_380.png" class = "slideImg"></div>
						<div><a href="/howToUse" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/ban/ban4_540_380.png" class = "slideImg"></a></div>
					</div>
				</div>
			</div>
			<div class="slick-background">
				<div class="banColor ban01">
					<div class="bannerWrap">
						<div class="banTextBox">
							<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
						</div>
						<div class="banSearchBox">
		                <form action="getSearchTradeList">
		                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
		                    <button type="submit" class="searchBtn">검색</button>
		                </form>
		            	</div>
	                </div>	
				</div>
				<div class="banColor ban02">
					<div class="bannerWrap">
					<div class="banTextBox">
						<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
					</div>           
					<div class="banSearchBox">
	                <form action="getSearchTradeList">
	                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
	                    <button type="submit" class="searchBtn">검색</button>
	                </form>
	            	</div>
	           	    </div>
				</div>
				<div class="banColor ban03">
					<div class="bannerWrap">
					<div class="banTextBox">
						<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
					</div>
					<div class="banSearchBox">
	                <form action="getSearchTradeList">
	                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
	                    <button type="submit" class="searchBtn">검색</button>
	                </form>
	            	</div>
	            	</div>
				</div>
				<div class="banColor ban04">
					<div class="bannerWrap">
					<div class="banTextBox">
						<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
					</div>
					<div class="banSearchBox">
	                <form action="getSearchTradeList">
	                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
	                    <button type="submit" class="searchBtn">검색</button>
	                </form>
	                </div>
	            	</div>
				</div>
			</div>
		</div>
	</div>
	
	
	    <div class="container content-container">
	        <div class="warp">
	            <section class="sectionBox">
	            	<div class="flexContainer">
	            		<c:forEach items="${tradeList}" var="trade">
	            			<div  onClick="location.href='/Login/login'"  class="listcontainer border-secondary">
		            			<div class="listContainerhover">
		            				<img src="https://dummyimage.com/280x149/fff/000.png" alt="image" class="trade-img">
								</div>
								<div class="textcontent">
									<h4><span class="sc-fznxKY kfRyXm">${trade.trade_title}</span></h4>
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


<!-- footer -->

<%@ include file="/WEB-INF/views/template/footer.jsp"  %>


</body>
</html>