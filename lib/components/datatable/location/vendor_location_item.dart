import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../models/menu/location/place_model.dart';
import '../../../layouts/menu/location/vendor_location.dart';
import '../../../models/menu/location/vendor_location_model.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/icon_title_field_small_interval.dart';

class VendorLocationItem extends StatefulWidget {
  const VendorLocationItem({super.key});

  @override
  State<VendorLocationItem> createState() => _VendorLoationItemState();
}

class _VendorLoationItemState extends State<VendorLocationItem> {
  ClusterManager? _manager;

  CustomInfoWindowController customInfoWindowController = CustomInfoWindowController();

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  List<PlaceModel> locationItems = [];

  var markerImage;

  int markerHeight = 200;
  int markerWidth = 200;

  static final LatLng initLatlng = LatLng(
    // 지도 기본 위치 설정 (대한민국 중간)
    36.34,
    127.77,
  );

  static final CameraPosition _initialCameraPosition = CameraPosition(
    //지도를 바라보는 카메라 위치
    target: initLatlng, //카메라 위치(위도, 경도)
    zoom: 7, //확대 정도
  );

  //final CameraPosition _initialCameraPosition = CameraPosition(target: LatLng(latitude, longitude), zoom: 12.0);

  @override
  void initState() {
    loadMarkerImage();
    _manager = ClusterManager<PlaceModel>(locationItems, _updateMarkers, markerBuilder: _getMarkerBuilder(Colors.red));

    super.initState();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (Get.find<VendorLocationController>().searchFlag == true) {
      locationItems = generateVendorLocationModelList(
          Get.find<VendorLocationController>().controllerVendorLocation, Get.find<VendorLocationController>().controllerVendorLocation.length);
      _manager!.setItems(locationItems);
      Get.find<VendorLocationController>().searchFlag = false;
    }
  }

  void loadMarkerImage() async {
    markerImage = await loadImage('lib/assets/icons/marker_map_icon.png', markerHeight, markerWidth);
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      this.markers = markers;
    });
  }

  Future<Marker> Function(Cluster<PlaceModel>) _getMarkerBuilder(Color color) => (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            //if (cluster.items.first.location == cluster.items.last.location){
            //if(cluster.items.){
            //
            // }
            if (!cluster.isMultiple) {
              customInfoWindowController.addInfoWindow!(
                markerDetailInfoWindow(cluster),
                cluster.location,
              );
            } else {
              if (cluster.items.every((element) => element.location == cluster.items.first.location)) {
                customInfoWindowController.addInfoWindow!(
                  markerDetailInfoWindow(cluster),
                  cluster.location,
                );
              } else {
                customInfoWindowController.hideInfoWindow!();
              }
            }
          },
          icon: await _getMarkerBitmap(markerHeight, color, '매출처 이름', text: cluster.count.toString(), clustercount: cluster.count),
        );
      };

  Widget markerDetailInfoWindow(Cluster<PlaceModel> cluster) {
    return Container(
      color: context.theme.cardColor,
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cluster.items.first.locationInfo.name ?? '',
              style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.all(2),
              child: ListView(children: [
                IconTitleFieldSmallInterval(
                  titleName: '상태'.tr,
                  value: cluster.items.first.locationInfo.status ?? '',
                  iconData: Icons.label_outlined,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '사업주'.tr,
                  value: cluster.items.first.locationInfo.representative ?? '',
                  iconData: Icons.person,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '사업자 번호'.tr,
                  value: cluster.items.first.locationInfo.businessNo != null ? convertBusinessNo(cluster.items.first.locationInfo.businessNo) : '',
                  iconData: Icons.numbers,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '영업 담당'.tr,
                  value: cluster.items.first.locationInfo.salesRep ?? '',
                  iconData: Icons.person,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '매출 기준일'.tr,
                  value: cluster.items.first.locationInfo.salesDate ?? '',
                  iconData: Icons.date_range,
                ),
                SizedBox(height: 14),
                IconTitleFieldSmallInterval(
                  titleName: '당일 매출'.tr,
                  value: cluster.items.first.locationInfo.amount,
                  iconData: Icons.money,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '당월 매출'.tr,
                  value: cluster.items.first.locationInfo.monthlyAmount,
                  iconData: Icons.money,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '입금 금액'.tr,
                  value: cluster.items.first.locationInfo.deposit,
                  iconData: Icons.money,
                ),
                SizedBox(height: 14),
                IconTitleFieldSmallInterval(
                  titleName: '미수 잔액'.tr,
                  value: cluster.items.first.locationInfo.remainDeposit,
                  iconData: Icons.money,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '채권 잔액'.tr,
                  value: cluster.items.first.locationInfo.balance,
                  iconData: Icons.money,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '대여 금액'.tr,
                  value: cluster.items.first.locationInfo.rentAmount,
                  iconData: Icons.money,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '대여 잔액'.tr,
                  value: cluster.items.first.locationInfo.rentBalance,
                  iconData: Icons.money,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '방문 횟수'.tr,
                  value: cluster.items.first.locationInfo.visitCount.toString(),
                  iconData: Icons.numbers,
                ),
                IconTitleFieldSmallInterval(
                  titleName: '마진율'.tr,
                  value: cluster.items.first.locationInfo.marginRate.toString(),
                  iconData: Icons.percent,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget markerInfoWindowLine(String titleStr) {
    return Expanded(
      child: Container(
        child: Text(
          titleStr,
          style: TextStyle(color: Colors.grey, height: 1.3),
          textAlign: TextAlign.left,
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget markerInfoWindowText(String titleStr, String valueStr) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                titleStr,
                style: TextStyle(color: Colors.grey, height: 1.3),
                textAlign: TextAlign.left,
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                valueStr,
                style: TextStyle(color: Colors.grey, height: 1.3),
                textAlign: TextAlign.right,
              ),
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }

  Future<BitmapDescriptor> _getMarkerBitmap(int size, Color color, String markerName, {String? text, @required int? clustercount}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = color;
    final Paint paint2 = Paint()..color = Colors.white;

    if (clustercount! > 1) {
      canvas.drawCircle(Offset(size / 2, size / 2), size / 3.0, paint1);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 3.3, paint2);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 4.4, paint1);
    } else {
      canvas.drawImage(markerImage, Offset(size / 2, size / 2), paint1);
    }

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      if (clustercount! > 1) {
        painter.text = TextSpan(
          text: text,
          style: TextStyle(fontSize: size / 5, color: Colors.white, fontWeight: FontWeight.normal),
        );
        painter.layout();
        painter.paint(
          canvas,
          Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2 + 0),
        );
      }
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  Future<ui.Image> loadImage(String imageName, int height, int width) async {
    final data = await rootBundle.load(imageName);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: (height / 2).toInt(),
      targetWidth: (width / 2).toInt(),
    );
    return (await codec.getNextFrame()).image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialCameraPosition,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _manager!.setMapId(controller.mapId);
          customInfoWindowController.googleMapController = controller;
        },
        onCameraMove: (position) {
          _manager!.onCameraMove(position);
          customInfoWindowController.onCameraMove!();
        },
        onCameraIdle: () {
          _manager!.updateMap();
        },
        onTap: (latlng) {
          customInfoWindowController.hideInfoWindow!();
        },
        myLocationEnabled: true,
        tiltGesturesEnabled: false,
        rotateGesturesEnabled: false,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        compassEnabled: false,
        liteModeEnabled: false,
      ),
      CustomInfoWindow(
        controller: customInfoWindowController,
        height: 485,
        width: 250,
        offset: 0,
      ),
    ]));
  }
}
