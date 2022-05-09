<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

    <h3>회원가입</h3>
    <form id="joinForm" action="/member/join" method="post">
	     <div>
	         <input type="text" placeholder="ID" id="userId" name="userId" type="text" autofocus>
	         <button class="btn btn-success" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
	     </div>
	     <div>
	         <input type="text" placeholder="Password" name="userPw" type="password" value="">
	     </div>
	     <div>
	         <input type="text" placeholder="Name" name="userName" type="text" value="">
	     </div>
	     <div>
	         <input type="text" placeholder="E-mail" name="userEmail" type="email" value="">
	     </div>
     
	     <button id="submitBtn" type="submit">가입하기</button>                           
	     <button id="cancelBtn" type="button">취소</button>                          
    </form>
    
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>

<script>
$(document).ready(function(){
	
	//취소버튼 클릭 시 홈 화면으로 이동
	$("#cancelBtn").click(function(){
		self.location = "/";
	})
	
	//회원가입 유효성 검사
	$("#submitBtn").click(function(){
		if($("input[name=userId]").val() == ""){
			alert("아이디를 입력해주세요.");
			$("input[name=userId]").focus();
			return false;
		}
		if($("input[name=userPw]").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("input[name=userPw]").focus();
			return false;
		}
		if($("input[name=userName]").val() == ""){
			alert("이름을 입력해주세요.");
			$("input[name=userName]").focus();
			return false;
		}
		if($("input[name=userEmail]").val() == ""){
			alert("이메일을 입력해주세요.");
			$("input[name=userEmail]").focus();
			return false;
		}
		
		//아이디 중복확인
		var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}else if(idChkVal == "Y"){
			$("#joinForm").submit();
		}
		alert("회원가입이 완료되었습니다.");
	})
})

	//아이디 중복확인 메서드
	function fn_idChk(){
		if($("input[name=userId]").val() == ""){
			alert("유효한 아이디를 입력하세요.");
			return;
		}
		
		$.ajax({
			url: "/member/idChk",
			type: "post",
			data: {"userId" : $("#userId").val()},
			success: function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
</script>
</html>