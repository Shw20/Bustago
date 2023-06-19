<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="../css/MyPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
<main>
	<button id="icon1" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	
	<%try
	{
		String userId = (String) session.getAttribute("m_Nm");
		
		Class.forName("com.mysql.jdbc.Driver");
	    String db_address = "jdbc:mysql://localhost:3306/bustago";
	    String db_username = "root";
	    String db_pwd = "abcd1234";
	    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
	        
	    request.setCharacterEncoding("UTF-8");
		
	    String insertQuery = "SELECT mb_NO, mb_Name, mb_Gender, mb_Tel FROM member WHERE mb_NO = ?";

	    PreparedStatement psmt = connection.prepareStatement(insertQuery);
	    
	    psmt.setString(1, userId);
		
	    ResultSet result = psmt.executeQuery();
	    %>
	       
	
	
	<div class="id">
		<h1><%= userId %>님</h1>
	</div>
	
	<div class="impo">
		<% while (result.next()) {%>
	
	
		<table>
        <tr>
            <td>학번</td>
            <td><%=result.getString("mb_NO") %></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><%=result.getString("mb_Name") %></td>
        </tr>
        <tr>
            <td>성별</td>
            <td><%=result.getString("mb_Gender") %></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><%= result.getString("mb_Tel") %></td>
        </tr>
        <% } %>
    	</table>
	</div>
	
	
	<div class="logout">
		<form action="http://localhost:8080/daelimtago/user/LogoutAction.jsp" name="Logout" method="post">
			<p><b><a href="../user/LogoutAction.jsp" onclick="logout(); return false;">로그아웃하기</a></b></p>
		</form>
	</div>
		
	<button id="bar1" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
    <button id="bar2" type="button" onclick="location.href='../reserve/RsvView.jsp'"></button>
    <button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    <button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    <button id="bar5" type="button" onclick="location.href='../user/MyPage.jsp'"></button>	
	<%
    }
    catch (Exception ex)
    {
        out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }%>
</main>
</body>
</html>