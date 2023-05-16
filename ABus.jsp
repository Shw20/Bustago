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
           aria-expanded="false">���<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="login.jsp">�α���</a></li>
          <li><a href="join.jsp">ȸ������</a></li>
          <li><a href="reservation.jsp">����</a></li>
          <li><a href="ABus.jsp">������ ��ġ(�Ⱦ翪)</a></li>
          <li><a href="BBus.jsp">������ ��ġ(���迪)</a></li>
          <li><a href="resCheck.jsp">���� ��ȸ</a></li>
          <li><a href="resCancel.jsp">���� ���</a></li>
        </ul>
      </li>
    </ul>
    
    
    <script type="text/javascript">
        
       
      
        
    
        var map;
        // ���� ���
        function initMap(){
            // ��ġ������ �浵, ������ ������ jso ������ �׻� �̷������� �����Ǿ��ִ�.
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
        initMap(); // �� ����
        
        // ������ �߽��� �����ϴ� �۾�
        function changeMap1(){
            var ll = {lat:35.661625, lng: 125.239803};
            map.panTo(ll);
            map.setZoom(16);
        } 
        // ���ο� ������ ���� �۾� -> ��Ŀ ������
        function changeMap2(){
            var ll = {lat:-40.339098, lng: 175.609729};
            map = new google.maps.Map(
                    document.getElementById("map"),
                    {zoom:17, center: ll}
                    );
        }
      
        
    </script>
    <p>�Ⱦ翪 2���ⱸ(�븲���б� ����)�� ���� 100m (�߶�ü ����Ʈ ���� ��)
</body>
</html>