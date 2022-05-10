<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
	
    <form id="loginForm" action="/member/login" method="post">
	    <fieldset>
	    	<legend>로그인</legend>
	        <div>
	            <input type="text" placeholder="ID" name="userId" type="text" autofocus>
	        </div>
	        <div>
	            <input type="text" placeholder="Password" name="userPw" type="password" value="">
	        </div>
	        
	        <button id="submitBtn" type="submit">로그인</button>
	        <button id="joinBtn" type="button">회원가입</button>
	    </fieldset>
    </form>    
    <jsp:include page="/WEB-INF/views/includes/header.jsp"/>
</body>
<script>
$(document).ready(function(){
	
	//로그인 유효성 검사
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
	})

	//회원가입 페이지 이동
	$("#joinBtn").click(function(){
		self.location = "/member/join";
	})
})
</script>
</html>