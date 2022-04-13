<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="menuBox">
    <div class="container">
        <div class="menuBar">
            <ul>
                <li><a href="">전체</a></li>
                <li><a href="">배달</a></li>
                <li><a href="">쇼핑</a></li>
                <li><a href="">청소</a></li>
                <li><a href="">집안일</a></li>
                <li><a href="">전문서비스</a></li>
                <li><a href="">반려동물</a></li>
                <li><a href="">역할대행</a></li>
            </ul>
        </div>
        <div class="btnBox">
            <button type="button" class="writeBtn">글작성하기</button>
        </div>
    </div>
</div>

<div class="inquiryFixBox">
	<form class="form-signin" action="/Inquiry/getInqList.do" method="post">
		<button type="submit" class="inquiryFixBtn"><span class="hover">1:1</span>문의</button>
	</form>
</div>