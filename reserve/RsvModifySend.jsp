<%@page import="java.sql.*"%>
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
	
    String userId = (String) session.getAttribute("m_Nm");
    
    String rsvIdx = request.getParameter("rsv_Idx");
    String uStat = request.getParameter("userStation");
	String uSeatTime = request.getParameter("userTime");
	String uSeatNum = request.getParameter("userSeat");
    
    String insertQuery = "SELECT * FROM reserve WHERE rsv_idx=" + rsvIdx;
    
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);
 	
 	ResultSet result = psmt.executeQuery();
 	
 	while(result.next())
 	{
		insertQuery = "UPDATE reserve set rsv_number=?, rsv_time=?, rsv_seatnum=? WHERE rsv_Idx=" + rsvIdx;
 	    
 	    psmt = connection.prepareStatement(insertQuery);
        
 	   
		psmt.setString(1, uStat);
        psmt.setString(2, uSeatTime);
        psmt.setString(3, uSeatNum);
        
        psmt.executeUpdate();
        
        response.sendRedirect("RsvChangeList.jsp");
 	}
}
catch (Exception ex)
{
	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>