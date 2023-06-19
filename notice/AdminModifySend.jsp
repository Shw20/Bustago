<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    
 	String nt_Title = request.getParameter("nt_Title");
 	String nt_Content = request.getParameter("nt_Content");
    
    String nt_Idx = request.getParameter("nt_Idx");
    
    String insertQuery = "SELECT * FROM notice WHERE nt_Idx=" + nt_Idx;
    
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);
 	
 	ResultSet result = psmt.executeQuery();
 	
 	while(result.next())
 	{
        insertQuery = "UPDATE notice set nt_Title=?, nt_Content=? WHERE nt_Idx=" + nt_Idx;
 	    
 	    psmt = connection.prepareStatement(insertQuery);
        
        psmt.setString(1, nt_Title);
        psmt.setString(2, nt_Content);
        
        psmt.executeUpdate();
        
        response.sendRedirect("AdminList.jsp");
 	}
}
catch (Exception ex)
{
	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>