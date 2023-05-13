<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/Logout/head.jsp" %>
</head>
<body>
	<header id="header">
		<h1>
			<a href="main.jsp" sytle="text-decoration-line: none;">BUSTAGO</a>
		</h1>
		<%
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String usId = (String) session.getAttribute("userSession");
			
			if(usId == null) {
		%>
			<nav id="nav">
				<ul>
					<li><a href="main.jsp">BUSTAGO</a></li>
					<li><a href="Login.jsp" class="button special">로그인</a></li>
				</ul>
			</nav>
		<%
			if(usId != null){
		%>
			<nav id="nav">
			<ul>
				<a href="main.jsp><li><strong><%=usId%></strong></a>로그인 성공</li>
			<%
				if(usId.equals("admin")){
			%>
				<jsp:include page="/admin/adminMain.jsp></jsp:include>
			<%
				}
				else {
			%>
				<jsp:include page="/user/userMain.jsp"></jsp:include>
			<%
				}
			}
			%>
			</ul>
		</nav>
	</header>
</body>
</html>