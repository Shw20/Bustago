<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rsvSuccess</title>
<link href="../css/RsvSend.css" rel="stylesheet" type="text/css">
<% 
	request.setCharacterEncoding("UTF-8");
	String mainImage="";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost/bustago";
        String db_username = "root";
        String db_pwd = "abcd1234";
        Connection conn = DriverManager.getConnection(db_address, db_username, db_pwd);

        
    	Timestamp today_date = new Timestamp(System.currentTimeMillis());
        String userId = (String) session.getAttribute("m_Nm");
    	
        
    	String uStat = request.getParameter("userStation");
    	String uSeatTime = request.getParameter("userTime");
    	String uSeatNum = request.getParameter("userSeat");
        
    	boolean isSeatAvailable = true;
    	
        if (uSeatNum != null && uSeatNum.length() > 0) {
        	String selectQuery = "SELECT * FROM reserve WHERE rsv_number=? AND rsv_time=? AND rsv_seatnum=?";
            PreparedStatement selectStmt = conn.prepareStatement(selectQuery);
            selectStmt.setString(1, uStat);
            selectStmt.setString(2, uSeatTime);
            selectStmt.setString(3, uSeatNum);
            
            ResultSet rs = selectStmt.executeQuery();
            
            if (rs.next()) {
                isSeatAvailable = false;
            }
            
            rs.close();
            selectStmt.close();
            
            if (isSeatAvailable){
            	try {
                    String insertQuery = "INSERT INTO reserve (mb_NO, rsv_number, rsv_time, rsv_seatnum, rsv_date) VALUES (?,?,?,?,?)";
                    PreparedStatement pstmt = conn.prepareStatement(insertQuery);

                    pstmt.setString(1, userId);
        			pstmt.setString(2, uStat);
                    pstmt.setString(3, uSeatTime);
                    pstmt.setString(4, uSeatNum);
                    pstmt.setTimestamp(5, today_date);

                    pstmt.executeUpdate();
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("오류가 발생했습니다. 오류 메시지 : " + e.getMessage());
                }
    			
            	
            	if(uStat!=null){
            		if(uStat.equals("안양")){
            			mainImage="successA";
            		}else if(uStat.equals("범계")){
            			mainImage="successB";
            		}	
            	}
            	
            	
            }else {
            	if(uStat!=null){
            		if(uStat.equals("안양")){
            			mainImage="failA";
            		}else if(uStat.equals("범계")){
            			mainImage="failB";
            		}	
            	}
            }
            
        }

        conn.close();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
        
    }
    

    
    
   %>
</head>
<body>
<main class="main_<%= mainImage %>">
	<div class="ok">
   		<form method="post" action="../Main/Main.jsp">
    		<p><input type="submit" value="홈으로"></p>
   		</form>
	</div>
</main>
</body>
</html>