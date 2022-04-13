<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.springbook.biz.inquiry.InqVO" %>
<%@ include file="../template/header.jsp" %>
<%	String sts = ""; %>
<c:if test="${userName ne inq.inq_nickname }"><% sts = "disabled"; %></c:if>
<body>
<div class="jumbotron">
   <h1>상세 보기</h1>      
</div>
<%@ include file="../template/menu.jsp" %>
<div id="popBox">
<img src="img/${inq.inq_filename}">
</div>
<div class="container-fluid">
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
	   		<c:otherwise><span style="cursor:pointer;" onclick="downloadFile('${inq.inq_filename}')">[파일다운]</span></c:otherwise>
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
    <div id="footer">
	  	<button type="submit" class="btn btn-primary" <%=sts %>>글수정</button>
	  	<a class="grayBtn" href="insertInq.jsp">글등록</a>
		<a class="dPurBtn" href="deleteInq.do?inq_num=${inq.inq_num}">글삭제</a>
		<a class="blackBtn" href="getInqList.do">글목록</a>
	</div>
  </form>  
  
  
  	<!-- 댓글 -->
  	<div class="inqReplyBox">
  		<h4>댓글</h4>
  		<form action="insertInqReply.do" method="post" enctype="multipart/form-data">
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
			<div id="footer">
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
						
						<p>${getInqReply.inqRe_content}</p>
					</li>
				</c:forEach>   
			</ol>
		</div>
		<div class="btnBox">
			<a class="dPurBtn" href="deleteInqReply.do?inqRe_bno=${inqReply.inqRe_bno}">답변삭제</a>
			<a class="blackBtn" href="getInqReplyList.do">글목록</a>
		</div>
	</div>
  
</div>
<script type="text/javascript">
function downloadFile(inq_filename){
    window.location ='inqDownload.do?inq_filename='+inq_filename;
}
</script>

</body>
</html>
