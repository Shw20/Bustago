<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

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
            var ll = {lat: 37.401040, lng: 126.923867};
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
        
        // 지도의 중심을 변경하는 작업
        function changeMap1(){
            var ll = {lat:35.661625, lng: 125.239803};
            map.panTo(ll);
            map.setZoom(16);
        } 
        // 새로운 지도를 여는 작업 -> 마커 지워짐
        function changeMap2(){
            var ll = {lat:-40.339098, lng: 175.609729};
            map = new google.maps.Map(
                    document.getElementById("map"),
                    {zoom:17, center: ll}
                    );
        }
      
        
    </script>
    <p>안양역 2번출구(대림대학교 방향)로 나와 100m (뜨란체 아파트 공원 앞)
</body>
</html>