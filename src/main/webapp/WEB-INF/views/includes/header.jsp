<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h3>header</h3>
	<c:if test="${member != null }">
        <li>
        	<a href="/member/modify">회원정보 수정</a>
        </li>
        <li>
        	<a href="/member/delete">회원탈퇴</a>
        </li>
    </c:if>
    <c:if test="${member != null }">
    	<a href="/member/logout">로그아웃</a>
   	</c:if>
   	<c:if test="${member == null }">
   		<a href="/">로그인</a>
   	</c:if>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</html>