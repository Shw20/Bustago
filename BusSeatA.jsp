<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스 좌석 선택</title>
</head>
<body>
    <form method="post" action="Reservation.jsp">
        <h2>좌석 및 시간 선택</h2>
        <br>
        <label for="time">예약 시간:</label>
        <select name="time" id="time">
            <option value="08:00">08:00</option>
            <option value="08:05">08:05</option>
            <option value="08:10">08:10</option>
            <option value="08:15">08:15</option>
            <option value="08:20">08:20</option>
            <option value="08:25">08:25</option>
            <option value="08:30">08:30</option>
            <option value="08:35">08:35</option>
            <option value="08:40">08:40</option>
            <option value="08:45">08:45</option>
            <option value="08:50">08:50</option>
            <option value="08:55">08:55</option>
            <option value="09:00">09:00</option>
            <option value="09:05">09:05</option>
            <option value="09:10">09:10</option>
            <option value="09:15">09:15</option>
            <option value="09:20">09:20</option>
            <option value="09:25">09:25</option>
            <option value="09:30">09:30</option>
            <option value="09:35">09:35</option>
            <option value="09:40">09:40</option>
            <option value="09:45">09:45</option>
            <option value="09:50">09:50</option>
            <option value="09:55">09:55</option>
            <option value="10:00">10:00</option>
            <option value="10:05">10:05</option>
            <option value="10:10">10:10</option>
            <option value="10:15">10:15</option>
            <option value="10:20">10:20</option>
            <option value="10:25">10:25</option>
            <option value="10:30">10:30</option>
            <option value="10:35">10:35</option>
            <option value="10:40">10:40</option>
            <option value="10:45">10:45</option>
            <option value="10:50">10:50</option>
            <option value="10:55">10:55</option>
            <option value="11:00">11:00</option>
            <option value="11:05">11:05</option>
            <option value="11:10">11:10</option>
            <option value="11:20">11:20</option>
            <option value="11:30">11:30</option>
            <option value="11:40">11:40</option>
            <option value="12:10">12:10</option>
            <option value="12:30">12:30</option>
            <option value="12:50">12:50</option>
            <option value="13:10">13:10</option>
            <option value="13:30">13:30</option>
            <option value="13:50">13:50</option>
            <option value="14:10">14:10</option>
            <option value="14:30">14:30</option>
            <option value="14:50">14:50</option>
            <option value="15:10">15:10</option>
            <option value="15:20">15:20</option>
            <option value="15:30">15:30</option>
            <option value="15:40">15:40</option>
            <option value="15:50">15:50</option>
            <option value="15:55">15:55</option>
            <option value="16:00">16:00</option>
            <option value="16:05">16:05</option>
            <option value="16:10">16:10</option>
            <option value="16:15">16:15</option>
            <option value="16:20">16:20</option>
            <option value="16:25">16:25</option>
            <option value="16:30">16:30</option>
            <option value="16:35">16:35</option>
            <option value="16:40">16:40</option>
            <option value="16:45">16:45</option>
            <option value="16:50">16:50</option>
            <option value="16:55">16:55</option>
            <option value="17:00">17:00</option>
            <option value="17:05">17:05</option>
            <option value="17:10">17:10</option>
            <option value="17:15">17:15</option>
            <option value="17:20">17:20</option>
            <option value="17:25">17:25</option>
            <option value="17:30">17:30</option>
            <option value="17:35">17:35</option>
            <option value="17:40">17:40</option>
            <option value="17:45">17:45</option>
            <option value="17:50">17:50</option>
            <option value="17:55">17:55</option>
            <option value="18:00">18:00</option>
            <option value="18:05">18:05</option>
            <option value="18:10">18:10</option>
            <option value="18:15">18:15</option>
            <option value="18:20">18:20</option>
            <option value="18:25">18:25</option>
            <option value="18:30">18:30</option>
            <option value="18:35">18:35</option>
            <option value="18:40">18:40</option>
            <option value="18:45">18:45</option>
            <option value="18:50">18:50</option>
            <option value="18:55">18:55</option>
        </select>
        <br>
        <table>
            <% 
            int rowCount = 10;
            int colCount = 4;
            int seatCount = 1;
            for (int i = 1; i <= rowCount; i++) {
                out.print("<tr>");
                for (int j = 1; j <= colCount; j++) {
                    out.print("<td>");
                    if (seatCount <= rowCount*colCount) {
                        out.print("<input type='radio' name='seat' value='" + seatCount + "'>");
                        out.print(" " + seatCount++);
                    }
                    out.print("</td>");
                }
                out.print("</tr>");
            }
            %>
            <tr>
                <td colspan="4">
                    <% 
                    for (int i = 41; i <= 45; i++) {
                        out.print("<input type='radio' name='seat' value='" + i + "'>");
                        out.print(" " + i);
                    }
                    %>
                </td>
            </tr>
        </table>

        <br>
        <input type="submit" value="예약">
    </form>

    <% 
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/bustago";
    String username = "root";
    String password = "208510";

    Connection conn = null;
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, username, password);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    String[] seats = request.getParameterValues("seat");
    String time = request.getParameter("time");
    if (seats != null && seats.length > 0) {
        try {
            String sql = "INSERT INTO reserve (rsv_number, mb_NO, rsv_time, rsv_seatnum) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            int mb_NO = 1;
            int rsv_seatnum = Integer.parseInt(seats[0]);
            int rsv_time = Integer.parseInt(time.replace(":", ""));
			int rsv_number = 1;

            pstmt.setInt(1, rsv_number);
            pstmt.setInt(2, mb_NO);
            pstmt.setInt(3, rsv_time);
            pstmt.setInt(4, rsv_seatnum);

            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        out.print("<h2>예약 완료</h2>");
        out.print("<p>선택한 좌석: ");
        for (String seat : seats) {
            out.print(seat + " ");
        }
        out.print("</p>");
    }
    try {
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
