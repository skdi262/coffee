<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href=resources/ksjcss.css type="text/css">
<html>
<head>
	<title>Home</title>
</head>
 <body>
 <script src="https://code.jquery.com/jquery-3.4.1.js">
    </script>

        <div id="wrap">
        <input type="button" name='moun' id='moun' value="객실관리" style="float: left; margin-right: 50px;">
        <input type="button" name='reserv' id='reserv' value="예약관리" style="float: left;"> 
        <br>
        <br>
        <div>
        <div id="roomList">        
            <div>
                객실목록
            </div>
            <div id="click_room_list">
                방 목록
<table id="clickroom">
    <tr>
    <td>
    <select size=10 style="width:250px" name="roomselect" id="roomselect">
       <c:forEach items="${list}" var="room">
<option value="${room.roomname}" style="font:#000" >${room.roomname}
</option>
</c:forEach>
</select>
                </td>
                
                </tr>
                </table>            
    
</div>
</div>
<div id="roomname">
<table id="ttable"; style="align-content: center;">

<tr>
<td>객실이름</td><td><input type="text" id="room_select_name"></td>
</tr>
<tr>
    <td>
객실분류</td>
<td><input type="text" id="boon">

</td>
</tr>
<tr>
<td>숙박가능인원</td><td><input type="number">
</td>
</tr>
<tr>
    <td>1박요금</td><td><input type="text">원
    </td>
    </tr>



</table>
<ul id="one_btns">
<li>
<input type="button" name='ok' id='ok' value="등록">
</li>
<li>
<input type="button" name='delete' id='delete' value="삭제"> 
</li>
<li>
<input type="button" name='clear' id='clear' value="Clear"> 
</li>
</ul>
</div>
            
    </div>
            
       
   
    
    
</div>
<script>
$(document)
.ready(function(){
	$.post("http://localhost:8080/app/getRoomList",{},function(result){
		
	},'json')
})

.on('click','#roomselect',function(){
	$('#room_select_name').val($('#roomselect').val())
	$('#boon').val(${romm.typename})
    
})
;
</script>
    </body>
    </html>
