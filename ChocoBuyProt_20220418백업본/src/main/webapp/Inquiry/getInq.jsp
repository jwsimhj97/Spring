<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.springbook.biz.inquiry.InqVO" %>
<%@ include file="../template/header.jsp" %>
<%	String sts = ""; %>
<c:if test="${userName ne inq.inq_nickname }"><% sts = "disabled"; %></c:if>
<%@ include file="../template/menu.jsp" %>
<!-- <div id="popBox"> -->
<%-- <img src="img/${inq.inq_filename}"> --%>
<!-- </div> -->
<!-- <div class="container-fluid"> -->


	<div class="container" align="center">
		<div class="warp">
			<div class="inq_tit">
			   <h1>1:1 문의 작성하기</h1>      
			</div>
			
			<form name="fm" action="updateInq.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="inq_num" value="${inq.inq_num}">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control innm" name="inq_title" value="${inq.inq_title}" <%=sts %>>      
				</div>
				<div class="input-group mb-3">
				    <div class="input-group-prepend">
				    	<span class="input-group-text">작성자</span>
				    </div>
				    <input type="text" class="form-control innm" name="inq_nickname" value="${inq.inq_nickname}" readonly <%=sts %>>      
				</div>
				<div class="input-group mb-3">
				    <div class="input-group-prepend">
				    	<span class="input-group-text">내용</span>
				    </div>
				    <textarea class="form-control innm" rows="10" id="comment" name="inq_content" <%=sts %>>${inq.inq_content}</textarea>      
				</div> 
				<div class="input-group mb-3">
				    <div class="input-group-prepend">
				    	<span class="input-group-text">파일보기</span>
				    </div>
				  	<span id="imgShow">${inq.inq_filename}</span>
				<%--       	<a href="img/${board.filename}" download="파일오리지널이름으로(확장자포함)" style="padding-left:10px;">${board.filename}</a>&nbsp;&nbsp; --%>
					<c:choose>
						<c:when test="${inq.inq_filename eq ''}">파일없음</c:when>
						<c:otherwise><span onclick="downloadFile('${inq.inq_filename}')">[파일다운]</span></c:otherwise>
					</c:choose>
				</div>
				<div class="input-group mb-3">
				    <div class="input-group-prepend">
				    	<span class="input-group-text">등록일</span>
				    </div>
				    <input type="text" class="form-control innm" name="regDate" value="${inq.inq_date}" readonly <%=sts %>>      
				</div>
				<!--     <div class="input-group mb-3"> -->
				<!--       <div class="input-group-prepend"> -->
				<!--         <span class="input-group-text">조회수</span> -->
				<!--       </div> -->
				<%--       <input type="text" class="form-control innm" name="cnt" value="${inq.inq_cnt}" readonly <%=sts %>>       --%>
				<!--     </div> -->
				<div class="inqBtnBox">
					<button type="submit" class="btn btn-primary" <%=sts %>>수정하기</button>
				 	<a class="grayBtn" href="insertInq.jsp">새글 작성하기</a>
					<a class="dPurBtn" href="deleteInq.do?inq_num=${inq.inq_num}">삭제하기</a>
					<a class="blackBtn" href="getInqList.do">글목록가기</a>
				</div>
			 </form>  
  
  
		 	<!-- 댓글 -->
		 	<div class="inqReplyBox">
		 		<h4>댓글</h4>
		 		<form action="/Inquiry/insertInqReply.do" method="post" enctype="multipart/form-data">
					<div class="input-group mb-3 hidden">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">작성글번호</span>
					    </div>
					    <input type="text" class="form-control innm" name="inqRe_bno" value="${inq.inq_num}" >      
					</div>
					
					<div class="input-group mb-3 hidden">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">댓글번호</span>
					    </div>  
					</div>
					
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">작성자</span>
					    </div>
					    <input type="text" class="form-control innm" name="inqRe_nickname" value="${userName}" readonly>      
					</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">내용</span>
					    </div>
					    <textarea class="form-control" rows="10" id="comment" name="inqRe_content"></textarea>      
					</div>
					<div class="inqBtnBox">
						<button id="conComplete" type="submit" class="btn btn-primary">답변등록</button>
					</div>
				</form>
			 		
				<div id="inqReply">
					<ol class="inqReplyList">
						<c:forEach items="${inqReplyList}" var="getInqReply">
							<li>
								<p>
									  작성자 : ${getInqReply.inqRe_nickname}<br />
									작성 날짜 :  <fmt:formatDate value="${getInqReply.inqRe_date}" pattern="yyyy-MM-dd" />
								</p>
								
								
								<p><textarea name="content" cols="40" rows="10">${getInqReply.inqRe_content}</textarea></p>
								
								<div class="btnBox">
			<%-- 							<a class="dPurBtn" href="/Inquiry/updateInqReply.do?bno=${getInqReply.inqRe_bno}&rno=${getInqReply.inqRe_rno}">답변수정</a> --%>
									<a class="dPurBtn" href="/Inquiry/deleteInqReply.do?bno=${getInqReply.inqRe_bno}&rno=${getInqReply.inqRe_rno}">답변삭제</a>
								</div>
							</li>
						</c:forEach>   
					</ol>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../template/footer.jsp" %>

<script type="text/javascript">
function downloadFile(inq_filename){
    window.location ='inqDownload.do?inq_filename='+inq_filename;
}

// $(functION(){
//     $("#TXT").ATTR("READONLY",TRUE);        // READONLY 처리
//     $("#TXT").REMOVEATTR("READONLY");       // READONLY 삭제
// }

</script>

</body>
</html>
