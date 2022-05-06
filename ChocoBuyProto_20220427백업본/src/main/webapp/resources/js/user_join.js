/* 전화번호 인증 */
$(document).ready(function (){
	var code2 = ""; 
	$("#phoneChk").on("click",function(){ 
	console.log("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
		
		var phone = $("#phone").val(); 
		$.ajax({ 
			url:"phoneCheck.do", 
			type:"POST",
			data:{"phone":phone},
			cache : false, 
			success:function(data){ 
				alert("data: "+data);
// 				if(data == "error"){ 
// 					alert("휴대폰 번호가 올바르지 않습니다.") $(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
// 					$(".successPhoneChk").css("color","red"); $("#phone").attr("autofocus",true); 
// 				}else{ 
					$("#phone2").attr("disabled",false); 
					$("#phoneChk2").css("display","inline-block"); 
					$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
					$("#phone").attr("readonly",true); 
					code2 = data; 
// 				} 
			} 
		}); 
	});

	$("#phoneChk2").on("click",function(){ 
		if($("#phone2").val() == code2){ 
			alert("일치합니다.");
			$(".successPhoneChk").text("인증번호가 일치합니다."); 
			 $("#phoneDoubleChk").val("true");
			$("#phone2").attr("disabled",true);   
			$(".next_btn").attr("disabled", false);
		}else{ 
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
			$(".successPhoneChk").css("color","red"); 
			$("#phoneDoubleChk").val("false"); 
			$(this).attr("autofocus",true); 
		}
	});

	$(".tel_next_btn").on("click", function(){
		document.join_tel.action='join_tel.do';
		document.join_tel.method='post';
		document.join_tel.submit();
	});
	
});

/* 주소 인증 */
	function goPopup(){
		var pop = window.open("../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	};

	function jusoCallBack(siNm,sggNm,emdNm){
		$('.area_next_btn').attr('disabled',false);
		document.form.user_siNm.value=siNm;
		document.form.user_sggNm.value=sggNm;
		document.form.user_emdNm.value=emdNm;
	};
	
$(document).ready(function (){
	$(".area_next_btn").on("click", function(){
		if($("#user_siNm")!=null&&$("#user_sggNm")!=null&&$("#user_emdNm")!=null){
			document.form.action ='/join/join_area.do';
			document.form.method='post';
			document.form.submit();
		}
	});
});


/* 닉네임 인증 */
$(document).ready(function(){
	$("#dup_btn").on("click",function(){ 
		var user_nick=$("#user_nick").val(); 
		console.log(user_nick);
		if(user_nick == "" || user_nick.length < 2){ 
			$(".successNameChk").text("이름은 2자 이상 8자 이하로 설정해주세요 :)"); 
			$(".successNameChk").css("color", "red"); 
			$("#nameDoubleChk").val("false"); 	
		}else{ 
			$.ajax({ 
				url : '/nameCheck.do',
				data:{"user_nick":user_nick},
				cache : false, 
				success : function(data) { 
					if (data == 0) { 
						$(".successNameChk").text("사용가능한 이름입니다."); 
						$(".successNameChk").css("color", "green"); 
						$("#nameDoubleChk").val("true"); 
						$(".nick_next_btn").attr("disabled", false);
					} else { 
						
						console.log(data);
						$(".successNameChk").text("사용중인 이름입니다 :p"); 
						$(".successNameChk").css("color", "red"); 
						$("#nameDoubleChk").val("false"); 
					} 
				}, 
				error : function() { 
					console.log("실패"); 
				} 
			}); 
		} 
	});

	$(".nick_next_btn").on("click", function(){
	console.log("다음 버튼");
		if(user_nick!=null){
			console.log("if");
			document.form.action ='/join/join_done.jsp';
			document.form.method='post';
			document.form.submit();
		}
	});
});

/* join_done.jsp */

	$(".done_next_btn").on("click", function(){
	console.log("다음 버튼");
		if(user_nick!=null){
			console.log("if");
		
			document.form.action ='/join/login.do';
			document.form.method='post';
			document.form.submit();
		}
	});
