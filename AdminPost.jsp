<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>새로운 공지사항 작성</title>
</head>
<body>
    <h1>새로운 공지사항 작성</h1>
    <form action="AdminPostSend.jsp" method="post">
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
    </form>
</body>
</html>