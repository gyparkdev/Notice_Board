<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<title>회원정보 수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
                        
    <h3>회원정보수정</h3>
	<form action="/member/modify" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="userId" name="userId" readonly="readonly" value="${ member.userId }"></td>
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
					<button id="submitBtn" type="submit">수정</button>
					<button id="cancelBtn" type="button">취소</button>
				</th>
			</tr>
		</table>
	</form>
	
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>

<script type="text/javascript">
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