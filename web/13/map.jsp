<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>jhta company</title>
    <style>
        /* 커스텀 오버레이 내부 스타일 */
        .overlaybox {
            position: relative;
            bottom: 60px;
            border-radius: 6px;
            border: 1px solid #ccc;
            border-bottom: 2px solid #ddd;
            float: left;
            font-size: 12px;
            padding: 5px;
            background: #fff;
        }
        .overlaybox .title {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:590px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97693c04c8707b55c3ca0e879ecc5dd0"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.57281620667795, 126.99223732447143), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(37.57291660667795, 126.99223732447143);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 커스텀 오버레이에 표시할 컨텐츠 입니다
    var content = '<div class="overlaybox"><div class="title">다시마켓 본사 사옥</div></div>';

    // 커스텀 오버레이가 표시될 위치입니다
    var overlayPosition = new kakao.maps.LatLng(37.57291660667795, 126.99223732447143);

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
        position: overlayPosition,
        content: content,
        yAnchor: 1
    });

    // 커스텀 오버레이를 지도에 표시합니다
    customOverlay.setMap(map);

</script>
</body>
</html>
