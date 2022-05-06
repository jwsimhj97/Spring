<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../template/header.jsp" %>
<%	String sts = ""; %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<c:if test="${userName ne board.writer }"><% sts = "disabled"; %></c:if>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 align="left">고객센터 글쓰기 상세페이지</h1>
		</div>
			
		<div id="popBox">
		</div>
		<div class="">
	  		<form name="fm" action="/Service/insertService">
			    <div class="input-group mb-3">
		      		<div class="input-group-prepend">
			        	<span class="input-group-text">제목</span>
			      	</div>
			      	<input type="text" class="form-control innm" name="service_title" value="${service.service_tilte}">      
			    </div>
			    <div class="input-group mb-3">
			      	<div class="input-group-prepend">
			      	  <span class="input-group-text">작성자</span>
			      	</div>
			      	<input type="text" class="form-control innm" name="service_writer" value="관리자" readonly >      
			    </div>
			    <div class="input-group mb-3">
			      	<div class="input-group-prepend">
			        	<span class="input-group-text">내용</span>
	     	 		</div>
			      	<textarea class="form-control innm" rows="10" id="comment" name="service_content"> ${service.service_content}</textarea>      
			    </div> 
		   
			    <div class="input-group mb-3">
		     		<div class="input-group-prepend">
			        	<span class="input-group-text">등록일</span>
			     	</div>
			      	<input type="text" class="form-control innm" name="service_date" value="" readonly >      
			    </div>     
			    <div id="footer">
			    	<div style="text-align: center;">
						<a href="/Service/getServiceList" class="btn btn-primary pull-Right">글 목록</a> <!-- 5월2일 수정 :.do삭제-->
					</div>
				  	<div style="text-align: right;">
						<button type="submit" class="btn btn-primary pull-Right">글등록</button>
					</div>
				</div>
		  	</form>  
	    </div>
	</div>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
