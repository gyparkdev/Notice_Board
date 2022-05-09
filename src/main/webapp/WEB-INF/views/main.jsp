<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Main</title>
</head>
<body>
	<jsp:include page="includes/header.jsp"/>
	
	<h3 class="panel-title">로그인</h3>
	<form name='mainForm' method="post" action="/member/login">
		<c:if test="${ member == null }">
			<table>
				<tr>
					<th><input class="form-control" placeholder="ID" name="userId" type="text" autofocus></th>
				</tr>
				<tr>
					<th><input class="form-control" placeholder="Password" name="userPw" type="password" value=""></th>
				</tr>
				<tr>
					<th>
				        <button id="submitBtn" type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
			            <button id="joinBtn" type="button" class="btn btn-lg btn-success btn-block">회원가입</button>
					</th>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${ result == false }">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
		</c:if>
		
		<c:if test="${ member != null }">
			<p>${ member.userName }(${ member.userId })님 환영합니다.</p>
			<button><a href="/board/list">게시판으로 가기</a></button>
			<button id="logoutBtn" type="button">로그아웃</button>
		</c:if>
	</form>
	
	<jsp:include page="includes/footer.jsp"/>
</body>
<script>
$(document).ready(function(){
	
	//로그인 시, 유효성 검사
	$("#submitBtn").click(function(){
		if($("input[name=userId]").val() == ""){
			alert("아이디를 입력해주세요.");
			$("input[name='userId']").focus();
			return false;
		}
		if($("input[name=userPw]").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("input[name='userPw']").focus();
			return false;
		}
	});

	//로그아웃
	$("#logoutBtn").on("click", function(){
		self.location="/member/logout";
	});
	
	//회원가입
	$("#joinBtn").click(function(){
		self.location = "/member/join";
	});
})
</script>
</html>
