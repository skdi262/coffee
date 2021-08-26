<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>확인</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js">
    </script>
<h1>
	
</h1>

<P>뉴 인포 확인,
${A},${B},${C},${D}</P>
<input type="button" value="돌아가기" id="btn_back">
   <script>
    $(document).on('click','#btn_back',function(){    	
    	location.href = "/app";    	
    }
    )
    </script>
</body>
</html>
