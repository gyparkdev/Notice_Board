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

	<div class="row">
		<div class="col-lg-12">
		    <h1 class="page-header">글보기</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">글보기</div>

				<div class="panel-body">
					<div class="form-group">
              			<label>글번호</label>
              			<input class="form-control" name='board_no' readonly="readonly" value='<c:out value="${ board.board_no }"/>'>
           			</div>
					<div class="form-group">
               			<label>제목</label>
               			<input class="form-control" name='title' readonly="readonly" value='<c:out value="${ board.title }"/>'>
                 	</div>
					<div class="form-group">
               			<label>내용</label>
               			<textarea class="form-control" rows="5" cols="50" name="content"readonly="readonly" ><c:out value="${ board.content }"/></textarea>
                 	</div>
					<div class="form-group">
               			<label>작성자</label>
               			<input class="form-control" name='writer' readonly="readonly" value='<c:out value="${ board.writer }"/>'>
                 	</div>
					<div class="form-group">
               			<label>조회수</label>
               			<input class="form-control" name='viewCnt' readonly="readonly" value='<c:out value="${ board.viewCnt }"/>'>
                 	</div>
	  				<button type="button" class="btn btn-default modBtn"><a href='/board/modify?board_no=<c:out value="${board.board_no }"/>'>글 수정</a></button>
					<button type="button" class="btn btn-default listBtn"><a href="/board/list">글 목록</a></button>
                </div>
                
				
                <!-- 댓글 리스트 조회 -->
			    <div id="reply">
			    	<ol class="replyList">
			    		<c:forEach items="${ replyList }" var="reply">
			    			<li>
			    				<p>
					     			작성자: ${ reply.writer } <br>
					     			등록일: <fmt:formatDate value="${ reply.regdate }"/>
			    				</p>
			    				<p>${ reply.content }</p>
			    				<div>
			    					<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${ reply.reply_no }">수정</button>
			    					<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${ reply.reply_no }">삭제</button>
			    					<hr>
			    				</div>
			    			</li>
			    		</c:forEach>
			    	</ol>
			    </div>
    
			    <!-- 댓글 작성 -->
			    <form class="form-horizontal">
			    	<div class="form-group">
			    		<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
			    		<div class="col-sm-10">
			     			<input type="text" id="replyWriter" name="writer" class="form-control" value="${ member.userId }" readonly="readonly">
			            </div>
			        </div>
			       	<div class="form-group">
			       		<label for="content" class="col-sm-2 control-label">댓글 내용</label>
			       		<div class="col-sm-10">
			       			<textarea id="replyContent" class="form-control" rows="5" cols="5" name="content"></textarea>
						</div>
			        </div>
			      	<div class="form-group">
			      		<div class="col-sm-offset-2 col-sm-10">
			      			<button type="button" class="replyWriteBtn btn btn-success">등록</button>
			      		</div>
			      	</div>
				</form>
                
			    <!-- 페이지 값 전달 -->                		
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${ cri.pageNum }">
					<input type="hidden" name="amount" value="${ cri.amount }">
					<input type="hidden" name="board_no" value="${ board.board_no }">
					<input type="hidden" name="type" value="${ cri.type}">
					<input type="hidden" name="keyword" value="${ cri.keyword }">
				</form>
        	</div>
		</div>
	</div>	
	

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
	})
	
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
	})
	
	//댓글 작성
	$(".replyWriteBtn").click(function(e){
		e.preventDefault();
		
		if($("#replyContent").val() == ""){
			alert("댓글 내용을 입력하세요.");
			$("#replyContent").focus();
			return false;
		}
		
		var content = $("#replyContent").val();
		var writer = $("#replyWriter").val();
		
		actionForm.append("<input type='hidden' name='content' value='" + content + "'>'");
		actionForm.append("<input type='hidden' name='writer' value='" + writer + "'>'");
		actionForm.attr("action", "/board/replyWrite")
		.attr("method", "post").submit();
		alert("댓글이 등록되었습니다.");
	})
	
	//댓글 수정
	$(".replyUpdateBtn").click(function(){
		var reply_no = $(this).attr("data-rno");
		actionForm.append("<input type='hidden' name='reply_no' value='" + reply_no + "'>'");
		actionForm.attr("action", "/board/replyUpdateView").submit();
	})
	
	//댓글 삭제
	$(".replyDeleteBtn").click(function(){
		var reply_no = $(this).attr("data-rno");
		actionForm.append("<input type='hidden' name='reply_no' value='" + reply_no + "'>'");
		
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			actionForm.attr("action", "/board/replyDelete")
			.attr("method", "post").submit();
		}
	})
})
</script>                       
</html>
