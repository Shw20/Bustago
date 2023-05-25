<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항 목록</title>
</head>
<body>
	<div class="navbar-header">
		<a href="../Main/Main.jsp">메인으로</a>
	</div>
	<h3>공지사항</h3>
	<%
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String db_address = "jdbc:mysql://localhost:3306/bustago";
			String db_username = "root";
			String db_pwd = "abcd1234";
				
			Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
				
			String insertQuery = "SELECT * FROM notice order by nt_Idx desc";
			PreparedStatement psmt = connection.prepareStatement(insertQuery);
			ResultSet result = psmt.executeQuery();%>
				
			<table border="1">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
				<%
				while (result.next())
				{%>
					<tr>
						<td><%=result.getInt("nt_Idx") %></td>
						<td><a href="UserNoticeView.jsp?nt_Idx=<%=result.getInt("nt_Idx") %>"><%=result.getString("nt_Title") %></a></td>
						<td><%=result.getDate("nt_Date") %></td>
					</tr>
				<%
				}%>
			</table>
		<%
		}
		catch (Exception ex)
		{
			out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
		}%>
	
</body>
</html>