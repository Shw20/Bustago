<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1" >
    <link href="../css/Main.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>대림타고</title>

</head>



<body>
<main>
<script type="text/javascript">
	function orNotice() {
    	var userId = "<%=session.getAttribute("userId") %>";
    	if (userId =="202230337") {
    		window.location.href = "../notice/AdiminList.jsp";
    	} else {
    		window.location.href = "../notice/UserNoticeList.jsp";
    	}
	}
</script>
	
	<button id="icon1" type="button" onclick="location.href='../notice/AdminList.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="orNotice()"></button>

    <button id="button1" type="button" onclick="location.href='../reserve/RsvChoice1.jsp'"></button>
    <button id="button2"type="button" onclick="location.href='../reserve/RsvChangeList.jsp'"></button>
    <button id="button3" type="button" onclick="location.href='../Bus/ABus.jsp'"></button>
    <button id="button4" type="button" onclick="location.href='../user/MyPage.jsp'"></button>
    <button id="button5" type="button" onclick="orNotice()"></button>
    <button id="button6" type="button" onclick="location.href=e.jsp'"></button>


    <button id="bar1" type="button" onclick="location.href='Reservation.jsp'"></button>
    <button id="bar2" type="button" onclick="location.href='../reserve/RsvChoice1.jsp'"></button>
    <button id="bar3" type="button" onclick="location.href='Main.jsp'"></button>
    <button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    <button id="bar5" type="button" onclick="location.href='../user/MyPage.jsp'"></button>


</main>
</body>

</html>
