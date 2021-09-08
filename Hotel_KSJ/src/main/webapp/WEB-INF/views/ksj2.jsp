<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ksjcss.css" type="text/css">

<html>
<head>

	<title>Home</title>
	
</head>
 <body>
 <script src="https://code.jquery.com/jquery-3.4.1.js">
    </script>

        <div id="wrap">
            
          <form action ="ksj" method=post id=rksj>
    <input type="submit" value="객실관리" style="float: left; margin-right: 50px;">
        <input type="button" name='reserv_list' id='reserv_list' value="예약관리" style="float: left;">
    </form>        
        <br>
        <br>
        <div>
        <div id="roomList">        
            <div>
                객실목록 KSJ2
            </div>
            <div style="margin">
            <table id=checkdate name=checkdate>            
            <tr>
            <td>체크 인</td><td><input type="text" id="checkin" name="checkin">
    	</td>
    </tr>
    <tr>
<td>체크 아웃</td><td><input type="text" id="checkout" name="chechout">
    </td>
    </tr>
            </table>
            </div>
            <div id="click_room_list">
                방 목록
<table id="clickroom" style="float:right">
    <tr>
    <td>
    
    <select size=10 style="width:250px;" name="roomselect" id="roomselect">
    
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
<table id="ttable" style="align-content: center">

<tr>
<td>객실이름</td><td><input type="text" id="room_select_name">

</td>
</tr>
<tr>
    <td>
객실분류</td>
<td>

      

<input type=text id="rSelect">

<input type=hidden id="ttest" value=''>
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
<input type="button" name='btn-update' id='btn-update' value="수정">
</li>
<li>
<input type="button" name='btn-delete' id='btn-delete' value="삭제"> 
</li>
<li>
<input type="button" name='clear' id='btnEmpty' value="Clear"> 
</li>
<li>
<input type="button" name='qwe123' id='qwe123' value="확인용">
</li>
</ul>
</div>
            
    </div>
            
       
   
    
    
</div>
<script>

$(document)
.ready(function(){
	$.post("http://localhost:8081/app/getReservList",{},function(result){
		console.log(result);
		$.each(result,function(ndx,value){
			str='<option value="'+value['checkin']+','+value['checkout']+','+value['rName']+','+value['roomcode']+','+value['typecode']+','+value['typename']+','+value['howmany']+','+value['howmuch']+','+value['reservcode']+','+value['newName']+'">'+value['rName']+
			'</option>';
			$('#roomselect').append(str);
		});		
	},'json')
})

.on('click','#roomselect',function(){
	var bad=$('#roomselect').val();    
	var arry=bad.split(",");
	var insplit = arry[0]
	var outsplit = arry[1]
	var cin= insplit.split(" ");
	var cout= outsplit.split(" ");
	$('#checkin').val(cin[0])
	$('#checkout').val(cout[0])	
	$('#room_select_name').val(arry[2])	
	$('#boon').val(arry[5])
	$('#hMuch').val(arry[7])
	$('#hMany').val(arry[6])	
	$('#ttest').val(arry[3])
	$('#rSelect').val(arry[9])
	
    })
.on('click','#btn-update',function(){
	    var checkin = $('#checkin').val();
		var checkout = $('#checkout').val();
		var bad=$('#roomselect').val();    
		var arry=bad.split(",");
		var reservcode = arry[8]
		alert(checkin+""+checkout+"||"+reservcode);
		$.post('http://localhost:8081/app/updateReserve',{checkin:checkin,checkout:checkout,reservcode:reservcode},
				 function(result){
			  
			  if(result=="ok"){
				  location.reload();
			  }
		  })
 }) 
		  
		  
 .on('click','#btnEmpty',function(){
	 $('#boon,#hMuch,#hMany,#room_select_name,#rSelect').val('');
 })
 
 
.on('click','#btn-delete',function(){
	var bad=$('#roomselect').val();    
	var arry=bad.split(",");
	var reservcode=arry[8]
	$.post('http://localhost:8081/app/deleteReserve',{reservcode:reservcode},
			function(result){
		console.log(result);
		if(result=="ok"){
			$("#btnEmpty").trigger('click');
			$("#roomselect option:selected").remove();
			location.reload();
		}
	},'text');
})
.on('click','#reserv_list',function(){
	location.reload()
})
.on('submit','#rksj',function(){
})
/* $('#checkin,#checkout').change(function(){
	var date = $('#checkin').val();
	
	var date2 = $('#checkout').val();
	var ddate=date.split("-");
	var ddate2=date2.split("-");
	alert(ddate[2]+""+ddate2[2]);
}) */


</script>
    </body>
    </html>
