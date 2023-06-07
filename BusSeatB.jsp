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
            <option value="08:05">08:05</option>
            <option value="08:10">08:10</option>
            <option value="08:35">08:35</option>
            <option value="08:40">08:40</option>
            <option value="09:10">09:10</option>
            <option value="09:40">09:40</option>
            <option value="10:10">10:10</option>
            <option value="10:40">10:40</option>
            <option value="16:45">16:45</option>
            <option value="17:15">17:15</option>
            <option value="17:45">17:45</option>
            <option value="18:15">18:15</option>
            <option value="18:45">18:45</option>
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
