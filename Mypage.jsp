<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        main {
            background-image: url("../image/mypage.png");
            background-repeat: no-repeat;
            width: 430px;
            height: 932px;
            background-size: contain;
        }
        
        .id{
            position: absolute;
            top: 187px;
            left: 157px;
            color: rgb(109, 197, 225);
        }
        
        .impo {
            position: absolute;
            top: 400px;
            margin-left: 50px;
            text-align: center;
        }
        
        .logout{
            position: absolute;
            top: 810px;
            left: 50px;
        }
        
        #icon1{
            position: relative;
            top: 12px;
            left: 10px;
            width: 30px;
            height: 30px;
            display: inline-block;
            opacity: 0;
            cursor: pointer;
        }
        
        #icon2{
            position: relative;
            top: 12px;
            left: 352px;
            width: 30px;
            height: 30px;
            display: inline-block;
            opacity: 0;
            cursor: pointer;
        }
        
        #icon3{
            position: absolute;
            top: 73px;
            left: 21px;
            width: 30px;
            height: 30px;
            display: inline-block;
            opacity: 0;
            cursor: pointer;
        }
        
        #icon4{
            position: absolute;
            top: 125px;
            left: 30px;
            width: 30px;
            height: 30px;
            display: inline-block;
            opacity: 0;
            cursor: pointer;
        }
        
        #bar1{
            position: absolute;
            top: 870px;
            left: 25px;
            width: 55px;
            height: 55px;
            border: none;
            cursor: pointer;
            opacity: 0;
        }
        
        #bar2{
            position: absolute;
            top:870px;
            left: 110px;
            width: 55px;
            height: 55px;
            border: none;
            cursor: pointer;
            opacity: 0;
        }
        
        #bar3{
            position: absolute;
            top:870px;
            left: 195px;
            width: 55px;
            height: 55px;
            border: none;
            cursor: pointer;
            opacity: 0;
        }
        
        #bar4{
            position: absolute;
            top:870px;
            left: 280px;
            width: 55px;
            height: 55px;
            border: none;
            cursor: pointer;
            opacity: 0;
        }
        
        #bar5{
            position: absolute;
            top:870px;
            left: 365px;
            width: 55px;
            height: 55px;
            border: none;
            cursor: pointer;
            opacity: 0;
        }
    </style>
</head>
<body>
    <main>
    <button id="icon1" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
        <% 
        String url = "jdbc:mysql://localhost:3306/bustago?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String username = "root";
        String password = "208510";
        
        String query = "SELECT mb_NO, mb_Name, mb_Gender, mb_Tel FROM member WHERE mb_NO = ?";
        
        String no = "";
        String name = "";
        String gender = "";
        String tel = "";
    
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
    
            String userNo = "";
    
            pstmt = conn.prepareStatement("SELECT mb_NO FROM member");
            rs = pstmt.executeQuery();
    
            if (rs.next()) {
                userNo = rs.getString("mb_NO");
            }
            
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userNo);
            rs = pstmt.executeQuery();
    
            if (rs.next()) {
                no = rs.getString("mb_NO");
                name = rs.getString("mb_Name");
                gender = rs.getString("mb_Gender");
                tel = rs.getString("mb_Tel");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } %>
    
        <div class="id">
            <h1>My Page</h1>
        </div>
        
        <div class="impo" style="text-align: center;">
            <table>
                <tr>
                    <td><h2>학번 : </h2></td>
                    <td><h2><%=no%></h2></td>
                </tr>
                <tr>
                    <td><h2>이름 : </h2></td>
                    <td><h2><%=name%></h2></td>
                </tr>
                <tr>
                    <td><h2>성별 : </h2></td>
                    <td><h2><%=gender%></h2></td>
                </tr>
                <tr>
                    <td><h2>전화번호 : </h2></td>
                    <td><h2><%=tel%></h2></td>
                </tr>
            </table>
        </div>
        
        <div class="logout">
            <form action="../user/LogoutAction.jsp" name="Logout" method="post">
                <p><b><a href="../user/LogoutAction.jsp" onclick="logout(); return false;">로그아웃하기</a></b></p>
            </form>
        </div>
        <button id="bar1" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
    <button id="bar2" type="button" onclick="location.href='../reserve/RsvView.jsp'"></button>
    <button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    <button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    <button id="bar5" type="button" onclick="location.href='../user/MyPage.jsp'"></button>	
    </main>
</body>
</html>
