<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/notice.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<title>새로운 공지사항 작성</title>
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
	
	<button id="icon1" type="button" onclick="location.href='../Main/SideMenu.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="orNotice()"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	
	<div class="h">
		<h3>새로운 공지사항 작성</h3>
	</div>
    <form action="AdminPostSend.jsp" method="post">
    	<div class="list">
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="nt_Title"></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="10" cols="20" name="nt_Content"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">저장</button>
                    <button type="button" onclick="location.href='AdminList.jsp'">목록으로</button>
                    <button type="reset">초기화</button>
                </td>
            </tr>
        </table>
        </div>
        
        <button id="bar1" type="button" onclick="orNotice()"></button>
    	<button id="bar2" type="button" onclick="location.href='../reserve/RsvChoice1.jsp'"></button>
    	<button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    	<button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    	<button id="bar5" type="button" onclick="location.href='../user/MyPage.jsp'"></button>
    		
    </form>
</main>
</body>
</html>