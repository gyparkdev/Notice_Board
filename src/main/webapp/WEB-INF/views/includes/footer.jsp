<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>
	html, body {
	  margin: 0;
	  padding: 0;
	}
	
	#wrap {
	  min-height: 35vh;
	  position: relative;
	  width: 100%; 
	  background-color: #f2f2f2;
	}
	
	footer {
	  width: 100%;
	  height: 90px;
	  bottom: 0px;
	  position: absolute;
	  border-top: 1px solid #c4c4c4;
	  padding-top: 15px;
	  color: #808080;
	  font-size: 11px;
	}
	
	footer a {
	  display: inline-block;
	  margin: 0 20px 10px 20px;
	  color: #808080; font-size: 11px;
	}
	
	footer a:visited {
	  color: #808080;
	}
	
	footer p {
	  margin-top: 0; margin-bottom: 0;   
	}
	
	footer p span {
	  display: inline-block;
	  margin-left: 20px;
	}
</style>
</head>
<body>
    <div id='wrap'>
    	<footer>
		    <nav>
		        <a href='https://gypark-dev.tistory.com' target='_blank'>Blog</a> |
		        <a href='https://github.com/gyparkdev' target='_blank'>Github</a>
		    </nav>
		    <p>
		        <span>저자 : 박 경 연</span><br/>
		        <span>이메일 : gyparkdev@gmail.com</span><br/>
		        <span>Copyright 2022. PKY. All Rights Reserved.</span>
		    </p>
	    </footer>
    </div>
</body>
</html>