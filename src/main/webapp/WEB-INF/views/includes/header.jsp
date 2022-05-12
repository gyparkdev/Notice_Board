<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>게시판</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- MetisMenu CSS -->
	<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	
	<!-- DataTables CSS -->
	<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
	
	<!-- DataTables Responsive CSS -->
	<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
<style>
	li{list-style:none; display:inline; padding:6px;}
</style>
</head>

<body>
	<ul>
		<li><a href="/">홈</a></li>
		<li>
			<c:if test="${member != null }">
				<p>${member.userName}님 (${member.userId }) 접속...</p>
			</c:if>
			<c:if test="${member == null }">
				<p>손님회원 입니다.</p>
			</c:if>
		</li>
	</ul>
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    	<div class="navbar-header">
        	<a class="navbar-brand" href="/board/list">자유 게시판</a>
    	</div>
       <!-- /.navbar-header -->

       <ul class="nav navbar-top-links navbar-right">
           <!-- /.dropdown -->
           <li class="dropdown">
               <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                   <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
               </a>
	           <ul class="dropdown-menu dropdown-user">
               <c:if test="${ member != null }">
					<li>
						<a href="/member/modify"><i class="fa fa-user fa-fw"></i> 회원정보 수정</a>
					</li>
                    <li>
                  	 	<a href="/member/delete"><i class="fa fa-gear fa-fw"></i> 회원탈퇴</a>
                    </li>
               </c:if>
	                
	           		<li class="divider"></li>
	        		<li>
	                   	<c:if test="${ member != null }"><a href="/member/logout">
	                   		<i class="fa fa-sign-out fa-fw"> 로그아웃</i></a>
	                   	</c:if>
	                   	<c:if test="${ member == null }"><a href="/">
	                   		<i class="fa fa-sign-in fa-fw"> 로그인</i></a>
	                   	</c:if>
             		</li>
	           	</ul>
               <!-- /.dropdown-user -->
			</li>
           <!-- /.dropdown -->
       </ul>
       <!-- /.navbar-top-links -->
   </nav>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/dist/js/sb-admin-2.js"></script>

</html>