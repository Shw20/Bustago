<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료</title>
</head>
<body>
    <% 
    String[] seats = request.getParameterValues("seat"); // 선택한 좌석 배열
    String time = request.getParameter("time"); // 선택한 예약 시간

    if (seats != null && seats.length > 0) {
        out.print("<h2>예약 완료</h2>");
        out.print("<p>선택한 좌석: ");
        for (String seat : seats) {
            out.print(seat + " ");
        }
        out.print("</p>");
        out.print("<p>예약한 시간: " + time + "</p>"); // 예약한 시간 출력
    } else {
        out.print("<h2>좌석을 선택해주세요</h2>");
    }
    %>
</body>
</html>
