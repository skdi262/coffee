<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.4.1.js">
    </script>
    <h1>
        Welcome to the Hotel California  
    </h1>
    아이디 입력 하셈 : <input type ="text"  id="dkdlel"><br>
    비밀번호 입력 하셈 : <input type ="text"  id="pass"><br>
    <input type="button" id="login" value="로그인">
    <input type="button" id="create" value="회원가입">
    ${m_name}
    <script>
    $(document).on('click','#login',function(){    	
    	location.href = "/app/viewinfo?id="+$("#dkdlel").val()
    			+"&password="+$("#pass").val();    	
    }
    )
    .on("click","#create",function(){
    	location.href="/app/newbie"
    })
</script>
    </body>
    </html>
