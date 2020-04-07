<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NearbyPlaces.aspx.cs" Inherits="RestaurantFinder.NearbyPlaces" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nearby</title>
    <meta name="viewport" content="initial-scale=1.0">
    
    <style>
        #map {
        height: 100%;
      }
        html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script type="text/javascript"  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvUPErwa9PmmbekI2HR5AiIiweaZN_XDY&callback=initMap" async defer></script>
    <script type="text/javascript">
        var map;
        var marker;
        var center;
        var infowindow;
        function initMap() {
            center = new google.maps.LatLng(31.3260, 75.5762);
            map = new google.maps.Map(document.getElementById('map'), {
                center: center,
                zoom:13
            });

            marker = new google.maps.Marker({
                position: center,
                map: map,
            });

            infowindow = new google.maps.InfoWindow({
               content:"Hi"
            });
            
            google.maps.event.addListener(marker, 'click', function() {
               infowindow.open(map,marker);
            });

            marker.addListener('double-click', function() {
                 map.setZoom(8);
                 map.setCenter(marker.getPosition());
             });
            
        }
        
     </script>

</head>
<body>
   
        <div id="map">
        </div>
    
</body>
</html>
