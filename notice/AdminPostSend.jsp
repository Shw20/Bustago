<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/bustago";
    String db_username = "root";
    String db_pwd = "abcd1234";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
    
	Timestamp today_date = new Timestamp(System.currentTimeMillis());
    
	String nt_Title = request.getParameter("nt_Title");
	String nt_Content = request.getParameter("nt_Content");
	
	int nt_Idx = 0;
	
	String insertQuery = "SELECT MAX(nt_Idx) from notice";
	
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	ResultSet result = psmt.executeQuery();
	
	while(result.next())
	{
	    nt_Idx = result.getInt("MAX(nt_Idx)") + 1;
	}
	
	insertQuery = "INSERT INTO notice(nt_Idx, nt_Title, nt_Content, nt_Date) VALUES (?, ?, ?, ?)";
	
	psmt = connection.prepareStatement(insertQuery);
	
	psmt.setInt(1, nt_Idx);
	psmt.setString(2, nt_Title);
	psmt.setString(3, nt_Content);
	psmt.setTimestamp(4, today_date);
	
	psmt.executeUpdate();
	
	response.sendRedirect("AdminList.jsp");
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>