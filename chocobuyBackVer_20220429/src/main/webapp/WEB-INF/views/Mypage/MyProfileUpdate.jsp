<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>글 상세</title>
<style>
body {margin: 0;padding: 0;}
/* .inner {width: 700px;height: 100%;margin: 100px auto;padding-bottom: 20px;border-bottom: 1px solid gray;position: relative;} */
a {text-decoration: none;color: inherit;}
h1 {text-align: center;border-bottom: 1px solid gray;padding-bottom: 30px;}
.btn-info {border-radius: 0;height: 30px;padding: 5px;font-size: 14px;position:absolute;top: 91px;right: 5px;border-radius: 5px;}
table {margin: 60px auto 0px auto;width: 500px;}
table input, table textarea {width: 100%;}
table button {border: none;background-color: #fff}
.btn-group {display: flex;justify-content: center;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/header.jsp" %>
	<div class="inner">
		<h1>ProfileUpdate</h1>
		<h2>${userUuid}</h2>
		<h2>${userNick}</h2>
	</div>
	<form action="updateUser" method="post" name="fr" onsubmit="return check();">
            <table>
                <tr>
                    <td >휴대폰번호</td>
                    <td>
                        <input type="text"  name="user_tel" value="${user.user_tel}" placeholder="${user.user_tel}" maxlength="20" >
                        <input type="button" value="휴대폰번호 중복확인"  >    
                    </td>
                </tr>
                <tr>
<!--                     <td >주소</td> -->
<!--                     <td> -->
<%--                         <input type="text" name="user_area" value="${user.user_area}" placeholder="${user.user_area}" maxlength="50"> --%>
<!--                         <input type="button" value="주소중복확인" > -->
<!--                     </td> -->
                </tr>
                <tr> 
                	<td>닉네임</td>
	                <td> 
	                	<input id="user_nick" type="text" name="user_nick" value="${user.user_nick}" placeholder="${user.user_nick}" maxlength="20" title="8자 까지 입력" required autofocus/> 
	                	<input id="dup_btn" type="button" value="닉네임 중복확인" >
	                	<span class="point successNameChk">이름은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
	                	<input type="hidden" id="nameDoubleChk"/> 
	                </td> 
                </tr>
            </table>
            <hr>
 		<input type="submit" value="수정완료"/>  <button onClick="location.href='getUser?user_nick=${userNick}'" type="button" >취소</button>
	</form>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
<script>
$(document).ready(function(){
	var dup_btn=$("#dup_btn");
	$(dup_btn).on("click", function(){
		var sm_name = $("#user_nick").val();
		console.log(dup_btn);
		console.log(sm_name);
		console.log("aaaaaa");
	 		if(sm_name == "" || sm_name.length < 2){
	 			$(".successNameChk").text("이름은 2자 이상 8자 이하로 설정해주세요 :)"); 
	 			$(".successNameChk").css("color", "red"); 
	 			$("#nameDoubleChk").val("false"); 
	 		}else{  
				$.ajax({ 
	 				url : '${pageContext.request.contextPath}/Mypage/nameCheck.do?sm_name='+sm_name,
	 				type : 'post', 
					cache : false, 
					success : function(data) {
						if (data==0) { 
							$(".successNameChk").text("사용가능한 이름입니다."); 
							$(".successNameChk").css("color", "green"); 
							$("#nameDoubleChk").val("true"); 
						} else {
							console.log("cccc");
							$(".successNameChk").text("사용중인 이름입니다 :p"); 
							$(".successNameChk").css("color", "red"); 
							$("#nameDoubleChk").val("false"); 
						} 
					}, 
					error : function() {
						console.log("error"); 
					} 
				}); 
	 		} 
	});
	
});
</script>
</html>
