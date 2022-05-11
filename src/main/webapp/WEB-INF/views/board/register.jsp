<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
	<title>게시글 등록</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
                
    <div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">게시글 등록</h1>
	    </div>
   	</div>
            
    <div class="row">
    	<div class="col-lg-12">
             <div class="panel panel-default">
                 <div class="panel-heading">게시글 등록</div>
                 <div class="panel-body">
                 
                 <c:if test="${member.userId != null }">
					<form action="/board/register" method="post">
						<div class="form-group">
                 			<label>제목</label>
                 			<input class="form-control" name='title'>
                 		</div>
						<div class="form-group">
                 			<label>내용</label>
                 			<textarea id="content" class="form-control" rows="5" cols="50" name="content"></textarea>
                 		</div>
						<div class="form-group">
                 			<label>작성자</label>
                 			<input class="form-control" name='writer' value='<c:out value="${ member.userId }"/>' readonly="readonly">
                 		</div>
                 		<button id="submitBtn" type="submit" class="btn btn-default">등록</button>
                 		<button id="cancelBtn" type="button" class="btn btn-default">취소</button>
					</form>
				</c:if>	
				<c:if test="${member.userId == null }">
					<p>로그인 후에 작성하실 수 있습니다.</p>
				</c:if>
                 </div>
             </div>
         </div>
	</div>
                
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
<script>
$(document).ready(function(){
	//글 등록 유효성 검사
	$("#submitBtn").click(function(){
		if($("input[name='title']").val() == ""){
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();
			return false;
		}
		if($("#content").val() == ""){
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		if($("input[name='writer']").val() == ""){
			alert("작성자를 입력해주세요.");
			$("input[name='writer']").focus();
			return false;
		}
	})
		
	// 취소버튼 클릭 시, 글목록 리스트로 이동
	$("#cancelBtn").click(function(){
		self.location = "/board/list";
	})
})
</script>                              
</html>