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
            
    <div id="root">
		<header>
			<h1>댓글 수정</h1>
		</header>
		<hr>
		<section id="container">
			<form name="updateForm" action="/board/replyUpdate" method="post">
				<input type="hidden" name="board_no" value="${ replyUpdate.board_no }">
				<input type="hidden" name="reply_no" value="${ replyUpdate.reply_no }">
				<input type="hidden" name="pageNum" value="${ cri.pageNum }">
				<input type="hidden" name="amount" value="${ cri.amount }">
				<input type="hidden" name="type" value="${ cri.type}">
				<input type="hidden" name="keyword" value="${ cri.keyword }">
			
				<div class="form-group">
             		<label for="content" class="col-sm-2 control-label">댓글 내용</label>
              		<div class="col-sm-10">
              			<input type="text" id="replyContent" class="form-control" name="content" value="${ replyUpdate.content }">
						<button type="submit" class="updateBtn btn btn-success">저장</button>
						<button type="button" class="cancelBtn btn btn-danger">취소</button>
					</div>
	           	</div>
			</form>
		</section>
	</div>       
	
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
<script>
//취소버튼 클릭 시, reply_no를 제외한 값 전달
$(document).ready(function(){
	$(".cancelBtn").click(function(){
		location.href="/board/get?board_no=${replyUpdate.board_no }"
					+ "& pageNum=${ cri.pageNum }"
					+ "& amount=${ cri.amount }"
					+ "& type=${ cri.type }"
					+ "& keyword=${ cri.keyword }";
	})
})
</script>
</html>