<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<title>회원탈퇴</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
          
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원탈퇴</h3>
                    </div>
                    <div class="panel-body">
						<form id="delForm" action="/member/delete" method="post">
							<div class="form-group">
								<label>아이디</label>
								<input class="form-control" type="text" id="userId" name="userId" value="${member.userId }" readonly="readonly">
							</div>		
							<div class="form-group">
								<label>비밀번호</label>
								<input class="form-control" type="password" id="userPw" name="userPw">
							</div>		
							<div class="form-group">
								<label>성명</label>
								<input class="form-control" type="text" id="userName" name="userName" value="${member.userName }" readonly="readonly">
							</div>		
							<div class="form-group">
								<button id="submitBtn" class="btn btn-success" type="submit">회원탈퇴</button>
								<button class="cancel btn btn-danger" type="button">취소</button>
							</div>		
						</form>
					</div>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	//취소버튼 클릭 시, 메인 화면으로 이동
	$(".cancel").click(function(){
		location.href="/";
	})
	
	//회원탈퇴 비밀번호 체크
	$("#submitBtn").click(function(){
		if($("#userPw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPw").focus();
			return false;
		}
		$.ajax({
			url: "/member/pwChk",
			type: "post",
			data: $("#delForm").serializeArray(),
			success: function(data){
				
				if(data == 0){
					alert("비밀번호가 틀렸습니다.");
					return;
				}else{
					if(confirm("회원탈퇴하시겠습니까?")){
						$("#delForm").submit();
						alert("탈퇴되었습니다.");
					}
				}
			}
		})
	})
})
</script>
</html>