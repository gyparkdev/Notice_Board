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
                        
	<h3>회원탈퇴</h3>
	<form id="delForm" action="/member/delete" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="userId" name="userId" value="${ member.userId }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="userPw" name="userPw"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" id="userName" name="userName" readonly="readonly" value="${ member.userName }"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button id="submitBtn" type="submit">회원탈퇴</button>
					<button id="cancelBtn" type="button">취소</button>
				</th>
			</tr>
		</table>
	</form>
	
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
					}
				}
			}
		})
	})
})
</script>
</html>