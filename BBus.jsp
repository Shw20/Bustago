<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1" >
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/custom.css">
<title>DaelimTago</title>
<style type="text/css">
 
    {
        margin: 5px;
        padding: 5px;
    }
    #map{
        border: 2px solid blue;
        width: 500px;
        height: 500px;
    }
 
</style>
<!-- <script src="http://maps.google.com/maps/api/js?key=AIzaSyDIs6mdUo9p8eWdFjf18P8caq1-if5kXeQ&region=kr"></script> -->
<script src="http://maps.google.com/maps/api/js?key=AIzaSyDIs6mdUo9p8eWdFjf18P8caq1-if5kXeQ&region=kr"></script>
</head>
 
<body>
    <div id="map"></div>
   
    
      <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class = "dropdown-toggle"
           data-toggle="dropdown" role ="button"
           aria-haspopup="true"
           aria-expanded="false">기능<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="login.jsp">로그인</a></li>
          <li><a href="join.jsp">회원가입</a></li>
          <li><a href="reservation.jsp">예약</a></li>
          <li><a href="ABus.jsp">정류장 위치(안양역)</a></li>
          <li><a href="BBus.jsp">정류장 위치(범계역)</a></li>
          <li><a href="resCheck.jsp">예약 조회</a></li>
          <li><a href="resCancel.jsp">예약 취소</a></li>
        </ul>
      </li>
    </ul>
    <script type="text/javascript">
        
       
      
        
    
        var map;
        // 지도 출력
        function initMap(){
            // 위치데이터 경도, 위도로 구성된 jso 파일은 항상 이런식으로 구성되어있다.
            var ll = {lat: 37.390567, lng: 126.949685};
            map = new google.maps.Map(
                    document.getElementById("map"),
                    {zoom: 17, center: ll}
                    );
            new google.maps.Marker(
                {position: ll,
                    map: map,
                    label: ""}        
            );
        }
        initMap(); // 맵 생성
        
   
        
      
        
    </script>
    <p>8번 출구 횡단보도 건너 동안경찰서 범계역 버스정류장(종로귀금속평촌타운)
</body>
</html>