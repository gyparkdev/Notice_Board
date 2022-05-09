<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세조회</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

	<h1>글보기</h1>
    <table border="1">
 		<tr>
 			<th>글번호</th>
 			<td><input type="text" name='board_no' readonly="readonly" value='<c:out value="${ board.board_no }"/>'></td>
 		</tr>
 		<tr>
 			<th>제목</th>
 			<td><input type="text" name='title' readonly="readonly" value='<c:out value="${ board.title }"/>'></td>
 		</tr>
 		<tr>
 			<th>내용</th>
 			<td>
 				<textarea rows="5" cols="50" name="content" readonly="readonly"><c:out value="${ board.content }"/></textarea>
 			</td>
 		</tr>
 		<tr>
 			<th>작성자</th>
 			<td><input type="text" name='writer' readonly="readonly" value='<c:out value="${ board.writer }"/>'></td>
 		</tr>
 		<tr>
 			<th>조회수</th>
 			<td><input type="text" name='viewCnt' readonly="readonly" value='<c:out value="${ board.viewCnt }"/>'></td>
 		</tr>
 		<tr>
	 		<th colspan="2">
				<button type="button" class="btn btn-default modBtn"><a href='/board/modify?board_no=<c:out value="${ board.board_no }"/>'>글 수정</a></button>
			 	<button type="button" class="btn btn-default listBtn"><a href="/board/list">글 목록</a></button>
		 	</th>
	 	</tr>
    </table>
                		
    <form id="actionForm" action="/board/list" method="get">
		<input type="hidden" name="pageNum" value="${ cri.pageNum }">
		<input type="hidden" name="amount" value="${ cri.amount }">
		<input type="hidden" name="board_no" value="${ board.board_no }">
		<input type="hidden" name="type" value="${ cri.type}">
		<input type="hidden" name="keyword" value="${ cri.keyword }">
	</form>
	<hr>
	
	<!-- 댓글 -->
	<div id="reply">
  		<c:forEach items="${ replyList }" var="reply">
  			<li>
  				<p>
		   			작성자: ${ reply.writer } <br>
		   			등록일: <fmt:formatDate value="${ reply.regdate }"/>
  				</p>
  				<p>${ reply.content }</p>
  				<div>
  					<button type="button" data-reply_no="${ reply.reply_no }">수정</button>
  					<button type="button" data-reply_no="${ reply.reply_no }">삭제</button>
  					<hr>
  				</div>
  			</li>
  		</c:forEach>
	</div>
            
	<form>
		<table>
			<tr>
				<th>댓글 작성자</th>
				<td>
					<input type="text" id="replyWriter" name="writer" value="${ member.userId }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>댓글 내용</th>
				<td><textarea id="replyContent" rows="5" cols="45" name="content"></textarea></td>
				<td><button type="button" class="replyWriteBtn btn btn-success">등록</button></td>
			</tr>
		</table>
	 </form>
	 
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>  
             
<script type="text/javascript">
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	//글 목록 버튼 클릭 시, bno 값만 지우고 list로 가기
	$(".listBtn").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='board_no']").remove();
		actionForm.submit();
	});
	
	//글 수정 페이지로 이동
	$(".modBtn").click(function(e){
		if(${member == null}){
			alert("로그인 후에 이용가능 합니다.");
			return false;
		}else{
			e.preventDefault();
			actionForm.attr("action", "/board/modify");
			actionForm.submit();
		}
	});
	
	//댓글 작성
	$(".replyWriteBtn").click(function(e){
		e.preventDefault();
		
		if($("#replyContent").val() == ""){
			alert("댓글 내용을 입력하세요.");
			$("#replyContent").focus();
			return false;
		};
		
		var content = $("#replyContent").val();
		var writer = $("#replyWriter").val();
		
		actionForm.append("<input type='hidden' name='content' value='" + content + "'>'");
		actionForm.append("<input type='hidden' name='writer' value='" + writer + "'>'");
		actionForm.attr("action", "/board/replyWrite")
		.attr("method", "post").submit();
	});
	
	//댓글 수정
	$(".replyUpdateBtn").click(function(){
		var reply_no = $(this).attr("data-reply_no");
		actionForm.append("<input type='hidden' name='reply_no' value='" + reply_no + "'>'");
		actionForm.attr("action", "/board/replyUpdateView").submit();
	});
	
	//댓글 삭제
	$(".replyDeleteBtn").click(function(){
		var reply_no = $(this).attr("data-reply_no");
		actionForm.append("<input type='hidden' name='reply_no' value='" + reply_no + "'>'");
		
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			actionForm.attr("action", "/board/replyDelete")
			.attr("method", "post").submit();
		}
	});
});
</script>                       
</html>
