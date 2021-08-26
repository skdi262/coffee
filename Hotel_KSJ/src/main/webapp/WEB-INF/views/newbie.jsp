<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>회원 가입</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js">
    </script>
<h1>
	
</h1>
아이디 입력 : <input type="text" id="new_id"><br>
비밀번호 입력 : <input type="text" id="pass"><br>
비밀번호 확인 : <input type="text" id="check_pass"><br>
모바일 번호 : <input type="text" id="mobile"><br>
<input type="button" id="submit" value="서브밋"> 

 <script>
    
    $(document).on('click','#submit',function(){    	
    	location.href = "/app/newinfo?new_id="+$("#new_id").val()
    			+"&new_password="+$("#pass").val()
    			+"&new_passcheck="+$("#check_pass").val()
    			+"&mob="+$("#mobile").val();
    }
    )    
    
</script>
</body>
</html>
