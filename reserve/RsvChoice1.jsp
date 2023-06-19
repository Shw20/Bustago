<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/Reserve1.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>탑승 위치 선택</title>
</head>
<body>
<main>
	
	<script>
	function orNotice() {
    	var userId = "<%=session.getAttribute("userId") %>";
    	if (userId === "202230337") {
        	location.href = "../notice/AdminList.jsp";
    	} else {
        	location.href = "../notice/UserNoticeList.jsp";
    	}
	}
</script>
	<button id="icon1" type="button" onclick="orNotice()"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	
	
	
    
    
    <form name="rsvChoice1" action="RsvChoice2.jsp" method="post">
    	<button id="Button1" type="button" class="i1Button" data-value="안양">
        	<input name="userStation" id="rsv_number" type="submit" value="안양">
        </button>
        <button id="Button2" type="button" class="i2Button" data-value="범계">
        	<input name="userStation" id="rsv_number" type="submit" value="범계">
        </button>
    </form>
    
    
    <button id="bar1" type="button" onclick="orNotice()"></button>
    <button id="bar2" type="button" onclick="location.href='../reserve/RsvChoice1.jsp'"></button>
    <button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    <button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    <button id="bar5" type="button" onclick="location.href='MyPage.jsp'"></button>

</main>
</body>
</html>