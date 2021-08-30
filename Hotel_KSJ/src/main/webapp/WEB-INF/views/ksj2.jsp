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
            <input type="button" name='reserv' id='reserv' value="예약관리" style="float: left;"> <br>
            <br>
        <div id="navi" >
            <table >
                <tr>
                    <td>숙박기간</td><td><input type="date"></td>
                </tr>
                <tr>
                    <td>
                객실분류 클릭시 </td><td><input type="number">
                </td>
            </tr>
        </table>
        </div>
        <br><br><br><br><br><br>
        <div id="reserv_room_li" >
            예약가능
            <ul>
                <li>한라산</li>
                <li>백두산</li>
                <li>관악산</li>
                <li>남산</li>
                <li>수명산</li>
                <li></li>
                </ul>
            </div>
            
            <div style="float: left;" >
                <table>
                    <tr><td>객실이름</td><td><input type="text"></td></tr>
                    <tr><td>숙박기간</td><td><input type="date"></td></tr>
                    <tr><td>숙박인원</td><td><input type="number"></td></tr>
                    <tr><td>1박비용</td><td><input type="text"></td></tr>
                    <tr><td>예약자 모바일</td><td><input type="tel"></td></tr>
                
                </table>
                <ul id="readybtn">
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
        <div id="reserved_room">예약된객실
            <ul>
                <li>광덕산</li>
                <li>흑성산</li>
                <li>태조산</li>
                <li>관악산</li>
            </ul>

        </div>
        
            
        </div>
    </div>
        
        
        
        
        
    </div>
    
        
        
    </body>
    </html>
