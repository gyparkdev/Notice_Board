<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>메인 페이지</title>
</head>
<body>
	<jsp:include page="includes/header.jsp"/>
	
	<form name='mainForm' method="post" action="/member/login">
		<c:if test="${ member == null }">
			<div class="container">
		        <div class="row">
		            <div class="col-md-4 col-md-offset-4">
		                <div class="login-panel panel panel-default">
		                    <div class="panel-heading">
		                        <h3 class="panel-title">로그인</h3>
		                    </div>
		                    <div class="panel-body">
		                        <div class="form-group">
		                            <input class="form-control" placeholder="ID" name="userId" type="text" autofocus>
		                        </div>
		                        <div class="form-group">
		                            <input class="form-control" placeholder="Password" name="userPw" type="password" value="">
		                        </div>
		                        
		                        <button id="submitBtn" type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
		                        <button id="joinBtn" type="button" class="btn btn-lg btn-success btn-block">회원가입</button>
		                    </div>
		                </div>
		            </div>
		        </div>
	  	  	</div>
		</c:if>
		
		<c:if test="${ result == false }">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
		</c:if>
		
		<c:if test="${ member != null }">
			<div>
				<p>${member.userName}(${member.userId })님 환영합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
				<div class="container">
					<div class="jumbotron">
						<div class="container">
							<h1>웹 사이트 소개</h1>
							<p>이 웹 사이트는 부트스트랩으로 만든 스프링 웹 사이트입니다. 게시판, 댓글, 회원관리, 검색, 페이징 기술을 적용했습니다.</p>
							<p><a class="btn btn-primary btn-pull" href="/board/list" role="button">게시판 보기</a></p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</form>
	
	<jsp:include page="includes/footer.jsp"/>
</body>
<script>
$(document).ready(function(){
	
	//로그인 유효성 검사
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
	})

	//로그아웃
	$("#logoutBtn").on("click", function(){
		self.location="/member/logout";
	})
	
	//회원가입
	$("#joinBtn").click(function(){
		self.location = "/member/join";
	})
})
</script>
</html>
