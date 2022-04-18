<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/inquiry.css">
<!--     <link rel="stylesheet" href="../css/reset.css"> -->
<!--     <link rel="stylesheet" href="../css/style.css"> -->
<!--     <link rel="stylesheet" href="../css/inquiry.css"> -->
    
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Document</title>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="logoBox">
                <a href="" class="logo">CHOCO-BUY logo</a>
            </div>
            <div class="searchBox">
                <form action="">
                    <input type="text" class="searchInput" placeholder="검색어를 입력해주세요.">
                    <button type="button" class="searchBtn">검색</button>
                </form>
            </div>
            <div class="hdMenuBox">
                <ul>
                    <li><a href="">로그인</a></li>
                    <li><a href="">마이페이지</a></li>
                    <li><a href="">고객센터</a></li>
                </ul>
            </div>
        </div>
    </header>
    