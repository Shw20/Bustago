<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1" >
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/custom.css">
  <title>대림타고</title>
</head>
<body>
<%
  String userID = null;
  if (session.getAttribute("userID") != null){
    userID = (String) session.getAttribute("userID");
  }
%>
<nav class ="navbar navbar-default">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expand="false">
      <span class ="icon-bar"></span>
      <span class ="icon-bar"></span>
      <span class ="icon-bar"></span>
    </button>
    <a class ="navbar-brand" href="Main.jsp">대림타고</a>
  </div>
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class="active"><a href="main.jsp">메인</a></li>
      <li><a href="bbs.jsp">공지사항</a></li>
    </ul>
    <%
      if (userID == null){
    %>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class = "dropdown-toggle"
           data-toggle="dropdown" role ="button"
           aria-haspopup="true"
           aria-expanded="false">기능<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../LoJo/Login.jsp">로그인</a></li>
          <li><a href="../LoJo/Join.jsp">회원가입</a></li>
          <li><a href="../reserve/Choice.jsp">예약</a></li>
          <li>정류장 정보
          	<ul>
          	<li><a href="../Avator/ABus.jsp">안양역</a></li>
          	<li><a href="../Avator/BBus.jsp">범계역</a></li>
          	</ul>
          </li>
          <li><a href="../reserve/ReserveList.jsp">예약 조회</a></li>
          <li><a href="resCancel.jsp">예약 취소</a></li>
          <li><a href="notice.jsp">공지사항</a></li>
          <li><a href="myPage.jsp">마이페이지</a></li>
        </ul>
      </li>
    </ul>
    <%
    }else{
    %>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class = "dropdown-toggle"
           data-toggle="dropdown" role ="button"
           aria-haspopup="true"
           aria-expanded="false">회원관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="logoutAction.jsp">로그아웃</a></li>
        </ul>
      </li>
    </ul>
    <%
      }
    %>
  </div>
</nav>
<div class="container">
  <div class="jumbotron">
    <div class ="container">
      <h1>메인메뉴</h1>
      <p>원하시는 기능을 선택해주세요!</p>
    </div>
  </div>
</div>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">

    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>