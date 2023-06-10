<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%
  Date now = new Date();
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String userId = (String) session.getAttribute("m_Nm");
%>
<meta charset="utf-8">
<title>예약 변경 및 취소</title>
</head>
<body>
	<div class="navbar-header">
		<a href="../Main/LoginMain.jsp">메인으로</a>
	</div>
	
	<h3><%=userId %> 님</h3>
	
    <h3>예약 변경 및 취소</h3>
    <%try
    {
      Class.forName("com.mysql.jdbc.Driver");
      String db_address = "jdbc:mysql://localhost:3306/bustago";
      String db_username = "root";
      String db_pwd = "abcd1234";
      Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
       
        String insertQuery = "SELECT * FROM reserve WHERE mb_NO =? ";

        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        psmt.setString(1, userId);


       ResultSet result = psmt.executeQuery(); %>
       <table border="1">
		<tr>
			
			<td>예약날짜</td>
			<td>탑승위치</td>
			<td>선택한 시간</td>
			<td>선택한 좌석</td>
		</tr>
          <%
         while (result.next())
         {%>
         
         	<tr>
				
				<td><%=result.getDate("rsv_date") %></td>
				<td><%=result.getString("rsv_number") %></td>
				<td><%=result.getString("rsv_time") %></td>
				<td><%=result.getString("rsv_seatNum") %></td>
				<td>
					<button type="button" value="예약변경" onClick="location.href='ReserveModify.jsp?rsv_Idx=<%=result.getString("rsv_Idx") %>'">예약변경</button>
					<button type="button" value="예약취소" onClick="location.href='ReserveDeleteSend.jsp?rsv_Idx=<%=result.getString("rsv_Idx") %>'">예약취소</button>
				</td>
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