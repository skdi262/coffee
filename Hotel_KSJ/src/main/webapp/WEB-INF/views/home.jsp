<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ksjcss.css" type="text/css">
<html>
<head>
	<title>Home</title>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.4.1.js">
    </script>
    <div>
     <h1 class="h1">
        <a href="http://localhost:8080/app/">호텔 예약관리</a>
    </h1>
    </div>
    <div class="divlogin">
        로그인
    <form action ="check_user" method = post id = formLogin>
    <input type="text" class=homeid id="homeId" name="homeId" value="아이디 입력" onfocus="a(this)"><br>
    <input type="text" class=passcode id="passcode" name=passcode value="비밀번호 입력" onfocus="a(this); type='password'"><br>
    <input type= submit class=submit value="로그인">
    <input type= button class=newbie value="회원가입" id=newbie>
    </form>
</div>
    <script>
        function a(y){
   if (y.defaultValue==y.value) {
      y.value = "";
   }
}
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