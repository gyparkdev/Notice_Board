<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<title>회원정보수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
           
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원정보수정</h3>
                    </div>
                    <div class="panel-body">
						<form action="/member/modify" method="post">
							<div class="form-group">
								<label>아이디</label>
								<input class="form-control" type="text" id="userId" name="userId" readonly="readonly" value="${member.userId }">
							</div>		
							<div class="form-group">
								<label>비밀번호</label>
								<input class="form-control" type="password" id="userPw" name="userPw">
							</div>		
							<div class="form-group">
								<label>성명</label>
								<input class="form-control" type="text" id="userName" name="userName" readonly="readonly" value="${member.userName }">
							</div>		
							<div class="form-group">
								<button id="submitBtn" class="btn btn-success" type="submit">수정</button>
								<button id="cancelBtn" class="cancel btn btn-danger" type="button">취소</button>
							</div>		
						</form>
					</div>
                </div>
            </div>
        </div>
    </div>
                
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
<script>
$(document).ready(function(){
	//회원정보 수정
	$("#submitBtn").click(function(){
		if($("#userPw").val() == ""){
			alert("수정할 내용을 입력하세요.");
			$("#userPw").focus();
			return false;
		}
		alert("수정이 완료되었습니다. 홈 화면으로 이동합니다.");
	})
	
	//취소버튼 클릭 시 홈으로 이동
	$("#cancelBtn").click(function(){
		self.location = "/";
	})
})
</script>
</html>