<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" href="/ksjcss.css">
<html>
<head>
	<title>Home</title>
</head>
 <body>
 
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
            <ol id="clickroom">
                <li>
                    백두산 SuiteRoom 4명
                </li>
                <li>
                    한라산 FamilyRoom 6명
               </li>
               <li>
                태조산
           </li>
           <li>
            흑성산
       </li>           
            </ol>
        </div>
        </div>
        <div id="roomname" >
<table id="ttable"; style="align-content: center;">

<tr>
<td>객실이름</td><td><input type="text"></textarea></td>
</tr>
<tr>
    <td>
객실분류</td><td><input type="number"></td>
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
    
</div>
    </body>
    </html>
