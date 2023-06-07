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
    String[] seats = request.getParameterValues("seat");
    String time = request.getParameter("time");
    
    if (seats != null && seats.length > 0) {
        out.print("<h2>예약 완료</h2>");
        out.print("<p>선택한 좌석: ");
        for (String seat : seats) {
            out.print(seat + " ");
        }
        out.print("</p>");
        out.print("<p>예약한 시간: " + time + "</p>");
    } else {
        out.print("<h2>좌석을 선택해주세요</h2>");
    }
    %>
    <form method="post" action="../LoJo/Main.jsp">
    	<p><input type="submit" value="메인화면"></p>
    </form>
</body>
</html>
