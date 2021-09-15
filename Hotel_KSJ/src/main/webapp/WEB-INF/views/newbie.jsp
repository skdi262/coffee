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
비밀번호 입력 : <input type="password" id="pass"><br>
비밀번호 확인 : <input type="password" id="check_pass"><br>
이름: <input type="text" id="new_name"><br>
    <input type= button id=submit value="생성">
    <input type=button id=vava value="테스트">
    
 <script>
$(document)
.ready(function(){
})
.on('click','#vava',function(){
	alert("머지")
})
.on('click','#submit',function(){
	let signid=$('#new_id').val()
	let signName=$('#new_name').val()
	let signPass=$('#pass').val()
	alert(signid+""+signName+""+signPass)
	if(signPass==$('#check_pass').val()){
	$.post('http://localhost:8080/app/ssss',{signid:signid ,signName:signName,signPass:signPass},
			function(result){
		if(result=="ok"){
			location.href="http://localhost:8080/app/"
		}
	}
	 )
	}else{
		alert("비밀번호가 일치하지 않습니다.")
	}
}
)    
    
</script>
</body>
</html>
