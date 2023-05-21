<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스 좌석 선택</title>
</head>
<body>
    <form method="post" action="reserve.jsp">
        <h2>좌석 선택</h2>
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

        <!-- 예약 시간 선택을 추가 -->
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

        <br>
        <input type="submit" value="예약">
    </form>

    <% 
    // 데이터베이스 연결 설정
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/bustago";
    String username = "사용자명";
    String password = "비밀번호";

    Connection conn = null;
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, username, password);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // 예약 정보를 데이터베이스에 저장
    String[] seats = request.getParameterValues("seat");
    String time = request.getParameter("time"); // 선택한 예약 시간 가져오기
    if (seats != null && seats.length > 0) {
        try {
            String insertQuery = "INSERT INTO reserve (mb_NO, rsv_Line, rsv_Time, rsv_SeatNum) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertQuery);

            int mb_NO = 1; // 예시로 mb_NO를 1로 설정했습니다. 실제로는 해당 멤버의 ID를 사용해야 합니다.
            String rsv_Line = "노선";
            int rsv_SeatNum = Integer.parseInt(seats[0]); // 예시로 첫 번째 선택한 좌석을 사용했습니다. 실제로는 선택한 좌석을 사용해야 합니다.

            pstmt.setInt(1, mb_NO);
            pstmt.setString(2, rsv_Line);
            pstmt.setString(3, time); // 예약 시간 설정
            pstmt.setInt(4, rsv_SeatNum);

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
    } else {
        out.print("<h2>좌석을 선택해주세요</h2>");
    }

    // 데이터베이스 연결 종료
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