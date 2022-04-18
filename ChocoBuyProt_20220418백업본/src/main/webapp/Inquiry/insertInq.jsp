<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("userId") == null){
	response.sendRedirect("login.jsp");	
}else{
%>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu.jsp" %>  


	<div class="container" align="center">
		<div class="warp">
			<div class="inq_tit">
			   <h1>1:1 문의 작성하기</h1>      
			</div>
			
			
			<form action="insertInq.do" method="post" enctype="multipart/form-data">
			    <div class="input-group mb-3">
				    <div class="input-group-prepend">
				        <span class="input-group-text">제목</span>
				    </div>
				    <input type="text" class="form-control" name="inq_title" placeholder="제목을 입력하세요." required>      
			    </div>
			    <div class="input-group mb-3">
				    <div class="input-group-prepend">
				        <span class="input-group-text">작성자</span>
				    </div>
				    <input type="text" class="form-control innm" name="inq_nickname" value="${userName}" readonly>      
			    </div>
			    <div class="input-group mb-3">
				    <div class="input-group-prepend">
				        <span class="input-group-text">파일선택</span>
				    </div>
				     <input type="file" class="inquiry_fileBtn" name="inq_uploadFile">      
			    </div>
			    <div class="input-group mb-3">
				    <div class="input-group-prepend">
				        <span class="input-group-text">내용</span>
				    </div>
				    <textarea class="form-control" rows="10" id="comment" name="inq_content"></textarea>      
			    </div>
			    <div class="inqBtnBox">
			 		<button id="conComplete" type="submit" class="btn btn-primary">새글 등록</button>
					<button class="inquiry_brownBtn" onclick="location.href='getInqList.do'">글 목록 가기</button>
				</div>
			</form>
		</div>
	</div>


<%@ include file="../template/footer.jsp" %>

</body>
<%} %>
</html>
