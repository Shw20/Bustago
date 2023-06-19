<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/Reserve1.css" rel="stylesheet" type="text/css">
<%
	String userId = (String) session.getAttribute("m_Nm");
%>
<meta charset="utf-8">
<title>예약 변경</title>
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
	
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost:3306/bustago";
        String db_username = "root";
        String db_pwd = "abcd1234";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String rsvIdx = request.getParameter("rsv_Idx");
        
        String insertQuery = "SELECT * FROM reserve WHERE rsv_idx=" + rsvIdx;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery();
        
        while(result.next())
        {%>
			
			<form name="rsvModify" action="RsvModify2.jsp" method="post">
				<input type="hidden" name="rsv_Idx" value="<%=result.getInt("rsv_Idx") %>">
    			<button id="Button1" type="button" class="i1Button" data-value="안양">
        			<input name="userStation" id="rsv_number" type="submit" value="안양">
        		</button>
				<button id="Button2" type="button" class="i2Button" data-value="범계">
        			<input name="userStation" id="rsv_number" type="submit" value="범계">
        		</button>
    		</form>
    		
    		
    		
    		<button id="bar1" type="button" onclick="orNotice()"></button>
    		<button id="bar2" type="button" onclick="location.href='../reserve/RsvChoice1.jsp'"></button>
    		<button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    		<button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    		<button id="bar5" type="button" onclick="location.href='MyPage.jsp'"></button>
	
    <%
        }
    }
    catch (Exception ex)
    {
    	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }%>
</main>
</body>
</html>