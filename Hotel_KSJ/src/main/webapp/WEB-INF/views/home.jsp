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
    <form action ="check_user" method = post id = formLogin>
    아이디 입력 : <input type="text" id="homeId" name="homeId"><br>
    비밀번호 입력 : <input type="text" id="passcode" name=passcode><br>
    <input type= submit value="로그인">
    <input type= button value="회원가입" id=newbie>
    </form>
    <script>
    $(document)
    .on('click','#newbie',function(){
    	location.href="/app/newbie";
    })
    
    .on('submit','#formLogin',function(){
    	
    	let pstr=$.trim($('#homeId').val());
    	$('#homeId').val(pstr);
    	pbtr=$.trim($('#passcode').val());
    	$('#passcode').val(pbtr);
    	if($('#homeId').val()==''){
    		alert("아이디를 입력하세요")
    		return false;
    	}
    	if($('#passcode').val()==''){
    		alert("비밀번호를 입력하세요")
    		return false;
    	}    	
    })
    </script>
    </body>
    </html>