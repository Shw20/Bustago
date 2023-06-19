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
<title>공지사항 수정</title>
</head>
<body>
<main>
	<script>
	function orNotice() {
    	var userId = "<%=session.getAttribute("userId") %>";
    	if (userId === "202230337") {
        	location.href = "../notice/AdiminList.jsp";
    	} else {
        	location.href = "../notice/UserNoticeList.jsp";
    	}
	}
</script>
	
	<button id="icon1" type="button" onclick="location.href='../Main/SideMenu.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="orNotice()"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	
    <div class="h">
		<h3>공지사항 수정</h3>
	</div>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost:3306/bustago";
        String db_username = "root";
        String db_pwd = "abcd1234";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String nt_Idx = request.getParameter("nt_Idx");
        
        String insertQuery = "SELECT * FROM notice WHERE nt_Idx=" + nt_Idx;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery();
        
        while(result.next())
        {%>
        <div class="list">
            <form action="AdminModifySend.jsp" method="post">
            <input type="hidden" name="nt_Idx" value="<%=result.getInt("nt_Idx") %>">
            <table border="1">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="nt_Title" value="<%=result.getString("nt_Title") %>"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea rows="10" cols="20" name="nt_Content"><%=result.getString("nt_Content") %></textarea>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">수정</button>
                        <button type="button" onclick="location.href='AdminList.jsp'">목록으로</button>
                        <button type="reset">원상복구</button>
                    </td>
                </tr>
            </table>
            </form>
           </div>
           
           <button id="bar1" type="button" onclick="orNotice()"></button>
    		<button id="bar2" type="button" onclick="location.href='../reserve/RsvChoice1.jsp'"></button>
    		<button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    		<button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    		<button id="bar5" type="button" onclick="location.href='../user/MyPage.jsp'"></button>
    		
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