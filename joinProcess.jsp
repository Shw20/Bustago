<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	//�Ķ���� �޾ƿ���
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("mail");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");

	
	//�������
	String birth = ""+year+"-"+month+"-"+day;

	//üũ�ڽ�
	String[] temp = request.getParameterValues("hobby");
	String hobby = Arrays.toString(temp);

	Connection conn = null;
	String sql = "INSERT INTO user_info values(?, ?, ?, ?, ?, ?, ?)"; //������
	
	//���� Ȯ�ο�
	int result = 0;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		pstmt.setString(4, name);
		pstmt.setString(5, birth);


		if(pstmt.executeUpdate() != 0){
			result += 1;
		}
		
	} catch(Exception e){
		e.printStackTrace();
	}	
%>   

<%
if(result == 1){
	out.println("<script>alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
} else {
	out.println("<script>alert('ȸ�����Կ� �����߽��ϴ�.');</script>");
	out.println("<script>location.href='join.jsp'</script>");
}
%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>