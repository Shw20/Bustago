<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String userId = (String) session.getAttribute("m_Nm");
%>
<meta charset="utf-8">
<title>예약 변경</title>
</head>
<body>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost:3306/bustago";
        String db_username = "root";
        String db_pwd = "abcd1234";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String rsvIdx = request.getParameter("rsv_Idx");
        
        String insertQuery = "SELECT * FROM reserve WHERE rsv_idx=" + rsvIdx;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery();
        
        while(result.next())
        {%>
        	<h1>예약변경</h1>
  			<h3><%=userId %> 님</h3>
            <form action="ReserveModifySend.jsp" method="post">
            	<input type="hidden" name="rsv_Idx" value="<%=result.getInt("rsv_Idx") %>">
            	<label for="line">탑승 위치:</label>
    			<select name="userStation" id="rsv_line">
    				<option value="" disabled selected hidden>선택</option>
    				<option value="안양">안양</option>
            		<option value="범계">범계</option>
    			</select>
    	
            	<!-- 예약 시간 선택을 추가 -->
    			<label for="time">예약 시간:</label>
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
    
        		<h2>좌석 선택</h2>
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
            			<tr>
                			<td colspan="2">
                    			<button type="submit">저장</button>
                    			<button type="reset">초기화</button>
                    			<button type="button" onclick="location.href='../Main/LoginMain.jsp'">메인으로</button>
                			</td>
            			</tr>
        		</table>
            </form>
    <%
        }
    }
    catch (Exception ex)
    {
    	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }%>
</body>
</html>