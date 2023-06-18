<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="../css/Reserve2.css" rel="stylesheet" type="text/css">
<%
	request.setCharacterEncoding("UTF-8");
	String userId = (String) session.getAttribute("m_Nm");
	String userStation = request.getParameter("userStation");
	String mainImage="";
	if(userStation!=null){
		if(userStation.equals("안양")){
			mainImage="reserveA";
		}else if(userStation.equals("범계")){
			mainImage="reserveB";
		}	
	}
%>
<meta charset="UTF-8">
<title>버스 시간 좌석선택</title>
</head>
<body>
<main class="main_<%= mainImage %>">

	<button id="icon1" type="button" onclick="location.href='../Main/SideMenu.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	

    <form name="ReserveChoice" action="RsvChoiceSend.jsp" method="post">
	<div class="t">
    	<label for="time"><b>예약 시간:</b></label>
        <select name="userTime" id="rsv_time">
        	<option value="" disabled selected hidden>선택</option>
            <option value="08:05">08:05</option>
            <option value="08:10">08:10</option>
            <option value="08:35">08:35</option>
            <option value="08:40">08:40</option>
            <option value="09:10">09:10</option>
            <option value="09:40">09:40</option>
            <option value="10:10">10:10</option>
            <option value="10:40">10:40</option>
            <option value="16:45">16:45</option>
            <option value="17:15">17:15</option>
            <option value="17:45">17:45</option>
            <option value="18:15">18:15</option>
            <option value="18:45">18:45</option>
        </select>
        </div>
    
    	 <input type="hidden" name="userStation" value="<%= userStation %>">
    
    	
    	<div class="s">
        <table>
            <% 
            int rowCount = 10;
            int colCount = 4;
            int seatCount = 1;
            for (int i = 1; i <= rowCount; i++) {
                out.print("<tr>");
                for (int j = 1; j <= colCount; j++) {
                    out.print("<td>");
                    if (seatCount <= rowCount*colCount) {
                        out.print("<input type='radio' name='userSeat' value='" + seatCount + "'>");
                        out.print(" " + seatCount++);
                    }
                    out.print("</td>");
                }
                out.print("</tr>");
            }
            %>
            <tr>
                <td colspan="4">
                    <% 
                    for (int i = 41; i <= 45; i++) {
                        out.print("<input type='radio' name='userSeat' value='" + i + "'>");
                        out.print(" " + i);
                    }
                    %>
                </td>
            </tr>
        </table>
        </div>
        <div class="box">
            <button type="submit">예약하기</button>
            <button type="reset">초기화</button>
        	<button type="button" onclick="location.href='../Main/Main.jsp'">메인으로</button>
        </div>
    </form>

	<button id="bar1" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
    <button id="bar2" type="button" onclick="location.href='../reserve/RsvView.jsp'"></button>
    <button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    <button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    <button id="bar5" type="button" onclick="location.href='MyPage.jsp'"></button>	
	
</main>
</body>
</html>