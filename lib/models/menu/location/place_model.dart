import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:misxV2/models/menu/location/vendor_location_model.dart';

class PlaceModel with ClusterItem {
  final String name;
  final LatLng latLng;
  VendorLocationModel locationInfo;

  //PlaceModel(this.locationInfo, this.latLng);
  PlaceModel(this.locationInfo,{required this.name, required this.latLng});

  @override
  LatLng get location => latLng;
}
