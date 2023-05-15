<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <br>
        <input type="submit" value="예약">
    </form>
</body>
</html>