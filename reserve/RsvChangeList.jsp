<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%
  Date now = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/Rsvlist.css" rel="stylesheet" type="text/css">
<%
	String userId = (String) session.getAttribute("m_Nm");
%>
<meta charset="utf-8">
<title>예약 변경 및 취소</title>
</head>
<body>
<main>
	<script>
	function orNotice() {
    	var userId = "<%=session.getAttribute("userId") %>";
    	if (userId === "202230337") {
        	location.href = "../notice/AdminList.jsp";
    	} else {
        	location.href = "../notice/UserNoticeList.jsp";
    	}
	}
</script>
	<button id="icon1" type="button" onclick="orNotice()"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	
	<div class="id">
		<h3><%=userId %> 님</h3>
	</div>
	
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
       <div class="list">
       <table border="1">
		<tr>
			
			<td>예약날짜</td>
			<td>탑승위치</td>
			<td>선택한 시간</td>
			<td>좌석번호</td>
			<td>변경 및 취소</td>
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
					<button type="button" value="예약변경" onClick="location.href='RsvModify1.jsp?rsv_Idx=<%=result.getString("rsv_Idx") %>'">예약변경</button>
					<button type="button" value="예약취소" onClick="location.href='RsvDeleteSend.jsp?rsv_Idx=<%=result.getString("rsv_Idx") %>'">예약취소</button>
				</td>
			</tr>
         
            <%
            }%>
        </table>
        </div>
        
        <button id="bar1" type="button" onclick="orNotice()"></button>
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