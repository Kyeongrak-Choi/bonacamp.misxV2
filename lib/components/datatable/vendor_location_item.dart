import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VendorLocationItem extends StatefulWidget {
  const VendorLocationItem({super.key});

  @override
  State<VendorLocationItem> createState() => _VendorLoationItemState();
}

class _VendorLoationItemState extends State<VendorLocationItem> {

  static final LatLng initLatlng = LatLng(
    // 지도 기본 위치 설정 (대한민국 중간)
    36.34,
    127.77,
  );

  static final CameraPosition initialPosition = CameraPosition(
    //지도를 바라보는 카메라 위치
    target: initLatlng, //카메라 위치(위도, 경도)
    zoom: 7, //확대 정도
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //구글 맵 사용
        mapType: MapType.normal, //지도 유형 설정
        initialCameraPosition: initialPosition, //지도 초기 위치 설정
      ),
    );
  }
}