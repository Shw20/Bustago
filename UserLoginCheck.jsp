<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	request.setCharacterEncoding("UTF-8");

	String uId = request.getParameter("userId");
	String uPw = request.getParameter("userPw");
	String uNm = request.getParameter("userName");
	
	String dbType = "com.mysql.jdbc.Driver";
	String userUrl = "jdbc:mysql://localhost:3306/bustago?serverTimezone=UTC";
	String userId = "root";
	String userPw = "abcd1234";
	
	ResultSet rs = null;
	
	try{
		Class.forName(dbType);
		
		Connection con = DriverManager.getConnection(userUrl, userId, userPw);
		
		String sql = "SELECT * FROM member WHERE mb_NO = ?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, uId);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String dbId = rs.getString(1);
			String dbPw = rs.getString(2);
			String dbName = rs.getString(3);
			String dbTel = rs.getString(4);
			
			if(uPw.equals(dbPw)){
				
				session.setAttribute("m_Nm", dbName);
				session.setAttribute("m_No", dbId);
				
				out.println("<script>alert('로그인 성공!');</script>");
				
				response.sendRedirect("http://localhost:8080/Bustago/Avator/LoginMain.jsp");
				
			} else {
				response.sendRedirect("http://localhost:8080/Bustago/user/UserPwFail.jsp");
			}
		} else {
			response.sendRedirect("http://localhost:8080/Bustago/user/UserIdFail.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginCheck</title>
</head>
<body>
	
</body>
</html>
