<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uId = request.getParameter("userId");
	String uPw = request.getParameter("userPw");
	String uNm = request.getParameter("userName");
	
	Class.forName("com.mysql.jdbc.Driver");
	String db_address = "jdbc:mysql://localhost:3306/bustago";
	String db_username = "root";
	String db_pwd = "abcd1234";

	
	ResultSet rs = null;
	
	try{
		
		Connection con = DriverManager.getConnection(db_address, db_username, db_pwd);
		
		String sql = "SELECT * FROM member WHERE mb_NO = ?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, uId);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String dbId = rs.getString(1);
			String dbPw = rs.getString(2);
			
			if(uPw.equals(dbPw)){
				
				
				
				session.setAttribute("m_Nm", dbId);
				
				out.println("<script>alert('로그인 성공!');</script>");
				
				response.sendRedirect("http://localhost:8080/daelimtago/Main/Main.jsp");
				
			} else {
				response.sendRedirect("http://localhost:8080/daelimtago/user/UserPwFail.jsp");
			}
		} else {
			response.sendRedirect("http://localhost:8080/daelimtago/user/UserIdFail.jsp");
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