  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header">
        <div class="container">
            <div class="logoBox">
                <a href="getTradeList" class="logo">CHOCO-BUY logo</a>
            </div>
            <div class="searchBox">
                <form action="getSearchTradeList">
                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
                    <button type="submit" class="searchBtn">검색</button>
                </form>
            </div>
            <div class="hdMenuBox">
                <ul>
                <c:if test="${user_nick == null}">
                    <li><a href="/Login/login">로그인</a></li>
                </c:if>
                <c:if test="${user_nick != null}">
                    <li><a href="/Login/logout">로그아웃</a></li>
                </c:if>
                    <li><a href="/Mypage/getMypageUser">마이페이지</a></li>
                    <li><a href="/Inquiry/getInqList">고객센터</a></li>
                </ul>
            </div>
        </div>
    </header>
    <div class="menuBox">
        <div class="container">
            <div class="menuBar">
                <ul>
                    <li><a href="/Trade/getTradeList">전체</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=배달">배달</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=쇼핑">쇼핑</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=청소">청소</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=집안일">집안일</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=전문서비스">전문서비스</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=반려동물">반려동물</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=역할대행">역할대행</a></li>
                    <li>
	                    <a href="/Trade/tradeInsert">
	                    	<div class="btnBox"><button type="button" class="writeBtn">글작성하기</button> </div>
	                    </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>