<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<title>댓글 수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
                        
	<h3>댓글 수정</h3>
	<hr>
	<form name="updateForm" action="/board/replyUpdate" method="post">
		<input type="hidden" name="board_no" value="${ replyUpdate.board_no }">
		<input type="hidden" name="reply_no" value="${ replyUpdate.reply_no }">
		<input type="hidden" name="pageNum" value="${ cri.pageNum }">
		<input type="hidden" name="amount" value="${ cri.amount }">
		<input type="hidden" name="type" value="${ cri.type}">
		<input type="hidden" name="keyword" value="${ cri.keyword }">
	
   		<input type="text" id="replyContent" name="content">댓글 내용
   		<div>
  			<input type="text" id="replyContent" name="content" value="${replyUpdate.content }">
  		</div>
  		
		<button type="submit" class="updateBtn btn btn-success">저장</button>
		<button type="button" class="cancelBtn btn btn-danger">취소</button>
	</form>
	
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>

<script>
	$(document).ready(function(){
		$(".cancelBtn").click(function(){
			location.href="/board/get?bno=${replyUpdate.bno }"
						+ "&pageNum=${cri.pageNum}"
						+ "&amount=${cri.amount}"
						+ "&type=${cri.type}"
						+ "&keyword=${cri.keyword}";
		})
	})
</script>
</html>