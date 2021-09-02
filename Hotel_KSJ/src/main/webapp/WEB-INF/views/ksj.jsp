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
    
<%--        <c:forEach items="${list}" var="room"> --%>
       
<%-- <option value="${room.typename},${room.roomname},${room.howmany},${room.howmuch}"  style="font:#000" >${room.roomname} --%>
<!-- </option> -->
<%-- </c:forEach> --%>
</select>
                </td>
                
                </tr>
                </table>            
    
</div>
</div>
<div id="roomname">
<table id="ttable"; style="align-content: center;">

<tr>
<td>객실이름</td><td><input type="text" id="room_select_name">

</td>
</tr>
<tr>
    <td>
객실분류</td>
<td>
  <select size=10 style="width:250px" name="rrrr" id="boon">
       <c:forEach items="${list}" var="room">
       
<option id ="rSelect" value="${room.typecode}"  style="font:#000" >${room.typename}
</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td>숙박가능인원</td><td><input type="number" id="hMany">
</td>
</tr>
<tr>
    <td>1박요금</td><td><input type="text" id="hMuch">원
    </td>
    </tr>



</table>
<ul id="one_btns">
<li>
<input type="button" name='btn-add' id='btn-add' value="등록">
</li>
<li>
<input type="button" name='btn-delete' id='btn-delete' value="삭제"> 
</li>
<li>
<input type="button" name='clear' id='btnEmpty' value="Clear"> 
</li>
</ul>
</div>
            
    </div>
            
       
   
    
    
</div>
<script>

$(document)
.ready(function(){
	$.post("http://localhost:8080/app/getRoomList",{},function(result){
		console.log(result);
		$.each(result,function(ndx,value){
			str='<option value="'+value['roomcode']+','+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'">'+value['roomname']+
			','+value['typename']+','+value['howmany']+','+value['howmuch']+
			'</option>';
			$('#roomselect').append(str);
		});		
	},'json')
})


.on('click','#roomselect',function(){
	var bad=$('#roomselect').val();    
	var arry=bad.split(",");
	$('#room_select_name').val(arry[1])
	
	$('#boon').val(arry[2])
	$('#hMuch').val(arry[4])
	$('#hMany').val(arry[3])	
    })
    
    
  .on('click','#btn-add',function(){
	  
	  let roomname=$('#room_select_name').val()
	  let roomtype=$('#rSelect').val()
	  let howmany=$('#hMany').val()
	 let howmuch=$('#hMuch').val()  
	  var bad=$('#roomselect').val();    
	var arry=bad.split(",");
	let roomcode=arry[0]
	
	
	  if(roomcode=''){
		  $.post('http://localhost:8080/app/addRoom',{roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
			 function(result){
				  if(result=="ok"){
					  location.reload();
				  }
			  })
	  }else{
		  alert(roomcode,roomname,roomtype,howmuch,howmany)
		  $.post('http://localhost:8080/app/updateRoom',{roomcode:roomcode,roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
					 function(result){
			  
						  if(result=="ok"){
							  location.reload();
						  }
					  }
				)
	  }
 })
		  
		  
 .on('click','#btnEmpty',function(){
	 $('#boon,#hMuch,#hMany,#room_select_name').val('');
 })
 
 
.on('click','#btn-delete',function(){
	var bad=$('#roomselect').val();    
	var arry=bad.split(",");
	$.post('http://localhost:8080/app/deleteRoom',{roomcode:arry[0]},
			function(result){
		console.log(result);
		if(result=="ok"){
			$("#btnEmpty").trigger('click');
			$("#roomselect option:selected").remove();
		}
	},'text');

})
;
</script>
    </body>
    </html>
