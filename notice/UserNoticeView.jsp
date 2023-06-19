<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/notice.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<title>공지사항 상세 열람</title>
</head>
<body>
<main>
	<button id="icon1" type="button" onclick="location.href='../Main/SideMenu.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	
    
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://localhost:3306/bustago";
		String db_username = "root";
		String db_pwd = "abcd1234";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String num = request.getParameter("nt_Idx");
        
        String insertQuery = "SELECT * FROM notice WHERE nt_Idx=" + num;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery(); %>
        
        <div class="list">
        <table border="1">
            <%
            while(result.next())
            {%>
            	<tr>
            	    <td>번호</td>
            	    <td><%=result.getInt("nt_Idx") %></td>
            	</tr>
            	<tr>
            	    <td>제목</td>
            	    <td><%=result.getString("nt_Title") %></td>
            	</tr>
            	<tr>
            	    <td>내용</td>
            	    <td><%=result.getString("nt_Content") %></td>
            	</tr>
            	<tr>
            	    <td>작성일</td>
            	    <td><%=result.getDate("nt_Date") %></td>
            	</tr>
            	<tr>
            	    <td colspan="2">
            	        <button type=button onclick="location.href='UserNoticeList.jsp'">목록</button>
            	    </td>
            	</tr>
            	<%            	
            }%>
        </table>
        </div>
        
        <button id="bar1" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
    		<button id="bar2" type="button" onclick="location.href='../reserve/RsvChoice1.jsp'"></button>
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