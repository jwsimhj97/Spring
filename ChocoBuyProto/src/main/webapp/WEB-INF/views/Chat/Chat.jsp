<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<title>Chat page</title>
<style>
.media{
	border-top : 1px solid rgba(88,166,166,0.4);
	border-bottom: 1px solid rgba(88,166,166,0.4);
}
div#proBox{
	margin-top: auto !important;
}
.input-group-text{
	background-color :  rgba(88,166,166,0.4) ;
}
.form-control{
	border : 1px solid rgba(88,166,166,0.4);
	border-radius: 0;
}
.custom-select{
	border-radius: 0;

}
.imgBox{
	margin : 0 auto;
	padding : 0 auto;
	 text-align: center;
}


#chatBox { 
	padding-left:0;
    margin:0;
    list-style-type:none;
    display:flex;
    align-content: flex-end;
    flex-direction: column;
    overflow-y:auto;
    width: 100%;
    height:300px;
    border-top:2px solid #fff;
    border-bottom:2px solid #fff;
}

#chatSubmitBtn:hover {cursor:pointer; background-color: #aaa; color: #fff;}

.speech-bubble-left , .speech-bubble-right{
	display: inline-block; padding: 10px; color: #fff;
}

.speech-bubble-left {
	position: relative;
	background: #00aabb;
	border-radius: 0.2em 0.2em 0.2em 0;
}

.speech-bubble-left:after {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 10px solid transparent;
	border-right-color: #00aabb;
	border-left: 0;
	border-bottom: 0;
	margin-top: 0px;
	margin-left: -10px;
}

.speech-bubble-right {
	position: relative;
	background: #00aabb;
	border-radius: 0.2em 0.2em 0 0.2em;
}

.speech-bubble-right:after {
	content: '';
	position: absolute;
	right: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 10px solid transparent;
	border-left-color: #00aabb;
	border-right: 0;
	border-bottom: 0;
	margin-top: 0px;
	margin-right: -10px;
}

.ipml , .ipmr {color:red; cursor: pointer;}
.ipml {padding-left:20px;}
.ipmr {padding-right:20px;}

.alert.alert-warning {
    width: 100%;
}
</style>
<script>
var timerId = null;
var subCnt = 0;
var confCnt = 0;

window.onload = function(){
	getChatBox();
	startInterval();
	
	<c:if test="${chatRoom.chatroom_app eq 'Y'}">
	$("#appBtnName").empty();
	$("#appBtnName").append('<button type="button" id="appBtn" class="btn btn-outline-info" data-toggle="modal" data-target="#appointment">????????????</button>');
	$("#appsave").empty();
	$("#appsave").append('<button type="button" class="btn btn-success" data-dismiss="modal" id="appCorrection">??????</button>');
	$("#msgbox").empty();
	let str = '<div class="alert alert-success">';
		str +='<strong>????????????</strong> [ ???????????? : ${appointment.app_time} ] [ ???????????? :   ${appointment.app_add} ] [ ???????????? :  ${appointment.app_price} ] </div>'; 
	$("#msgbox").append(str);
	$("#app_add").val("${appointment.app_add}");
	$("#app_price").val("${appointment.app_price}");
	</c:if>
	
	<c:if test="${chatRoom.chatroom_report eq 'Y'}">
	$("#reportBtn").empty();
	$("#reportBtn").append('<button type="button" id="reportBtn" class="btn btn-outline-danger" data-toggle="modal" data-target="#notify" disabled>????????????</button>');
	$("#appBtnName").empty();
	$("#appBtnName").append('<button type="button" id="appBtn" class="btn btn-outline-info" data-toggle="modal" data-target="#appointment" disabled>????????????</button>');
	$("#reportPay").empty();
	$("#reportPay").append('<button type="button" class="btn btn-outline-warning ml-3 mr-3" disabled>????????????</button>');
	$("#msg_content_btn").empty();
	
	str = '<div class="alert alert-warning">';
	str +='<strong>Warning!</strong> ????????? ??? ??????????????? ??? ?????? ????????? ???????????????.<br>';
		str +='????????? ????????? <a href="/Inquriy/GetInqList?chatroom_seq=${chatroom.chatroom_seq}" class="alert-link">1:1 ??????</a>??? ?????? ???????????????.</div>'; 
		
	$("#msg_content_btn").append(str);
	</c:if>
	
	$("#chatSubmitBtn").click(function(){
		var formData = {
				"chatroom_seq": $("#chatroom_seq").val(),
				"trade_title": $("#trade_title").val(),
				"user_uuid" : $("#user_uuid").val(),	
				"user_nick" : $("#user_nick").val(),	
				"msg_content" : $("#msg_content").val()
		};
		
		$.ajax({
	        method:"POST", 
	        url : "/Chat/MsgInsert",
	        data: formData,
	        success : function(result) {
	        	if(result > 0 ){
	        		getChatBox();
				$("#msg_content").val("");
	        	}else {
	        		alert("????????? ?????? ??????");       
	        	}
	        },
	        error:function(request,status){
	            alert("????????? ??????????????????.");
	        }
	    });
	});
	

	$("#appSaveBtn").click(function(){
		
		$.ajax({
	        method:"POST", 
	        url : "/Chat/App",
	        data: { 
	        		"chatroom_seq": $("#chatroom_seq").val(),
	        		"app_time": $("#app_time").val(),
	        		"app_add": $("#app_add").val(),
	        		"app_price": $("#app_price").val()
	        },
	        cache :  false,
	        success : function(result) {
	        	alert("?????????????????????!");
	        	if(result > 0 ){
	        		
	        		$("#msgbox").empty();
	        		
	        		str = '<div class="alert alert-success">';
	        		str +='<strong>????????????</strong> [ ???????????? : ${appointment.app_time} ] [ ???????????? :   ${appointment.app_add} ] [ ???????????? :  ${appointment.app_price} ] </div>'; 
	        			
	        		$("#msgbox").append(str);
	        				
	        	}
	        	location.reload();
	        },
	        error : function(result) {
	        	alert("????????????");
	        }
		}); 
		
	});
	
$("#appCorrection").click(function(){
		
		$.ajax({
	        method:"POST", 
	        url : "/Chat/UpdateApp",
	        data: { 
	        		"chatroom_seq": $("#chatroom_seq").val(),
	        		"app_time": $("#app_time").val(),
	        		"app_add": $("#app_add").val(),
	        		"app_price": $("#app_price").val()
	        },
	        cache :  false,
	        success : function(result) {
	        	alert("????????? ?????? ???????????????!");
	        	if(result > 0 ){
	        		
	        		$("#msgbox").empty();
	        		
	        		str = '<div class="alert alert-success">';
	        		str +='<strong>????????????</strong> [ ???????????? : ${appointment.app_time} ] [ ???????????? :   ${appointment.app_add} ] [ ???????????? :  ${appointment.app_price} ] </div>'; 
	        			
	        		$("#msgbox").append(str);
	        				
	        	}
	        	location.reload();
	        },
	        error : function(result) {
	        	alert("????????????");
	        }
		}); 
		
	});
	

$("#reportSaveBtn").click(function(){
	
	if (confirm("?????????????????????????")) {
		$.ajax({
	        method:"POST", 
	        url : "/Chat/Report",
	        data: { 
	        		"chatroom_seq": $("#chatroom_seq").val(),
	        		"chatroom_report_content": $("#chatroom_report_content").val(),
	        },
	        cache :  false,
	        success : function(result) {
	        	if(result > 0 ){
	        		alert("?????????????????????.") ; 
	        		$("#msg_content_btn").empty();
	        		
	        		str = '<div class="alert alert-warning">';
	        		str +='<strong>Warning!</strong> ????????? ??? ??????????????? ??? ?????? ????????? ???????????????.<br>';
	        			str +='????????? ????????? <a href="/Inquriy/GetInqList?chatroom_seq=${chatroom.chatroom_seq}" class="alert-link">1:1 ??????</a>??? ?????? ???????????????.</div>'; 
	        			
	        		$("#msg_content_btn").append(str);
	        	}
	        	location.reload();
	        },
	        error : function(result) {
	        	alert("????????????");
	        }
		}); 
    }
	
});

}


function getChatBox(){
	$.ajax({
        method:"POST", 
        url : "/Chat/MsgList",
        data: {"chatroom_seq": $("#chatroom_seq").val()},
        cache :  false,
        success : function(result) {
        	if(result.code == 'OK' ){
        		$("#chatBox").empty();
        		
        		$.each(result.msgList , function (index, item) {
        			let newClass = '';
        			let chatTag = '';
        			if(item.user_uuid === '${userUser.user_uuid}'){
        				newClass = 'speech-bubble-right';
        				chatTag += "<div style='width:100%;text-align:right;'>" ;
            			chatTag += "<span class='"+newClass+"'>" + item.msg_content + "</span>" ;
        				chatTag += "<span> " + item.user_nick + "</span></div><br>";
        	
        			}else {
        				newClass = 'speech-bubble-left';
        				chatTag += "<div style='width:100%;text-align:left;'><span>" + item.user_nick + " </span>";
            			chatTag += "<span class='"+newClass+"'>" + item.msg_content + "</span></div><br>" ;
        			}
        			
        			$("#chatBox").append(chatTag);
        			
        		});
        		
        	}else {
        		alert("????????? ?????? ??????");
        	}
        	
        },
        error:function(request,status){
            alert("????????? ??????????????????.");
        }
    });
}

        	
function startInterval(){
	timerId = window.setInterval("getChatBox()", 1000);
}


function stopInterval(){
	if(timerId != null) {
        clearInterval(timerId);
    }
}

function enterkey() {
    if (window.event.keyCode == 13) {
         $("#chatSubmitBtn").click();
    }
}


</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>

   <div class="container">
        <div class="warp">
            <section class="">
				<div class="container-fluid">
				
					<form action="/Trade/updateTrade" method="post">
						<div class="imgBox mb-3 mt-3">
							<img src="${pageContext.request.contextPath}/resources/img/upload/${trade.trade_img}">						</div>
							<div class="media p-3" >
									<img src="${pageContext.request.contextPath}/resources/img/profileImg/${trade.trade_profileimg}" alt="John Doe" class="mr-3 rounded-circle" style="width: 60px;">
									<div class="media-body" id="proBox" onClick="location.href='/Trade/getTradeProfile?trade_nick=${trade.trade_nick}'" style="cursor : pointer;" >
										<input type="hidden" id="chatroom_seq" value="${chatRoom.chatroom_seq}">
										<input type="hidden" id="user_nick" value="${userUser.user_nick}">
										<input type="hidden" id="trade_uuid" value="${chatRoom.trade_uuid}">
										<input type="hidden" id="user_uuid" value="${userUser.user_uuid}">
										<input type="hidden" id="user_uuid" value="${chatRoom.trade_area}">
										<h3>${chatRoom.trade_nick}</h3>
										<p><small>${tradeUser.trade_area}</small></p>
										</div>
											<!-- Button to Open the Modal -->
											<div id="appBtnName">
											<button type="button" id="appBtn" class="btn btn-outline-info" data-toggle="modal" data-target="#appointment">????????????</button>
											</div>
											<!-- The Modal -->
											<div class="modal fade" id="appointment">
											  <div class="modal-dialog modal-dialog-centered">
											    <div class="modal-content">
										     <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">????????????</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
	  								         <!-- Modal body -->
										       <div class="modal-body">
												   	  <text> ???????????? :</text>
												      <input type="datetime-local" class="form-control mb-3" id="app_time">
												      
												      <text> ???????????? :</text>
												      <input type="text" class="form-control mb-3" id="app_add" placeholder="????????? ????????? ??????????????????">
												      
												      <text> ???????????? :</text>
												      <div class="input-group mb-3" >
												      <input type="number" class="form-control" id="app_price" placeholder="????????? ????????? ??????????????????">
												      <div class="input-group-append">
												        <span class="input-group-text">???</span>
												      </div>
												   	  </div>
										       </div> 
												     <!-- Modal footer -->
												      <div class="modal-footer">
												       <div id="appsave">
												    	<button type="button" class="btn btn-success" data-dismiss="modal" id="appSaveBtn" >??????</button>
												       </div>
												        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">??????</button>
												     </div>
												    </div>
												   </div>
												  </div>
											<div id="reportPay">	  
											<button type="button" class="btn btn-outline-warning ml-3 mr-3" onclick="location.href='/Pay/PayIndex?app_seq=${app.app_seq}'">????????????</button>
											</div>
											<!-- Button to Open the Modal -->
											<c:if test="${tradeUser.trade_uuid ne userUser.user_uuid}">
											<div id="reportBtn">
											<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#notify">
											   ????????????
											</button>
											</div>
											</c:if>
											<!-- The Modal -->
											<div class="modal fade" id="notify">
											  <div class="modal-dialog modal-dialog-centered">
											    <div class="modal-content">
										     <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">????????????</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
	  								         <!-- Modal body -->
										       <div class="modal-body">
												    <div class="form-group">
												      <label for="comment">????????????:</label>
												      <textarea class="form-control" rows="5" id="chatroom_report_content" name="text" placeholder="??????????????? ??????????????????"></textarea>
												    </div>
												    <center>
												    <button type="button" class="btn btn-danger" id="reportSaveBtn" data-dismiss="modal" >????????????</button>
												    </center>
												  
										       </div>
										     <!-- Modal footer -->
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										     </div>
										    </div>
										   </div>
										  </div>
									</div>
							</div>
						<div class="input-group">
							<div class="input-group-prepend">
						      <span class="input-group-text">?????????:</span>
						    </div>
							 <input type="text" class="form-control" id="trade_title" value="${chatRoom.trade_title }" readonly>
						</div>
						<div id="msgbox">
						 <div class="alert alert-danger alert-dismissible fade show">
						    <button type="button" class="close" data-dismiss="alert">&times;</button>
							    <strong>????????????</strong> ????????????! ?????? ??? ?????? ????????? ?????? ??? ????????? ???????????????
						  </div>
						  </div>
						<div class="form-control" id="chatBox"></div>
						<div class="input-group mb-3" id="msg_content_btn">
							<input type="text" onkeydown="enterkey()" class="form-control innm" id="msg_content" name="msg_content">
							<div class="input-group-append">
							  <span class="input-group-text" id="chatSubmitBtn">??????</span>
							</div>
						</div>
					<button onClick="location.href='getTradeList'" id="conList" type="button" class="btn btn-Basic">?????????</button>
					</form>
				</div>
			</section>
        </div>
    </div>

<%@ include file="../template/footer.jsp"  %>
</body>
</html>