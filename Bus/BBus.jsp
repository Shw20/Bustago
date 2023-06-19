<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<link href="../css/StationB.css" rel="stylesheet" type="text/css">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1" >
  <link rel="stylesheet" href="css/custom.css">
<title>DaelimTago</title>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyDIs6mdUo9p8eWdFjf18P8caq1-if5kXeQ&region=kr"></script>
</head>
 
<body>
<main>
	
	<button id="icon1" type="button" onclick="location.href='../Main/SideMenu.jsp'"></button>
	<button id="icon2" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	<button id="icon3" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
	<button id="icon4" type="button" onclick="location.href='../Main/Main.jsp'"></button>
	
	
    <div id="map"></div>
      
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
    
    <div class="w">
    	<h1 class="font">범계</h1>
    	<p class="font">8번 출구 횡단보도 건너 동안경찰서 범계역 버스정류장
    	<p class="font">(종로귀금속평촌타운)
    </div>
    
    <button id="bar1" type="button" onclick="location.href='../notice/UserNoticeList.jsp'"></button>
    <button id="bar2" type="button" onclick="location.href='../reserve/RsvView.jsp'"></button>
    <button id="bar3" type="button" onclick="location.href='../Main/Main.jsp'"></button>
    <button id="bar4" type="button" onclick="location.href='BusTime.jsp'"></button>
    <button id="bar5" type="button" onclick="location.href='MyPage.jsp'"></button>
    
</main>
</body>
</html>