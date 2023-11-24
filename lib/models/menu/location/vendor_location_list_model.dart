import 'package:json_annotation/json_annotation.dart';

part 'vendor_location_list_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class VendorLocationListModel {
  var latitude; // 경도
  var longitude; // 위도

  VendorLocationListModel(this.latitude, this.longitude);

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory VendorLocationListModel.fromJson(Map<String, dynamic> json) => _$VendorLocationListModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorLocationListModelToJson(this);
}
