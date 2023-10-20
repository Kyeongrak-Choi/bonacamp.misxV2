import 'package:json_annotation/json_annotation.dart';

part 'customer_info_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class CustomerInfoModel {
  String? businessNo;
  String? tel1;
  String? tel2;
  String? fax;
  String? note;
  String? address;

  CustomerInfoModel(this.businessNo, this.tel1, this.tel2, this.fax, this.note, this.address);

  Map<String, dynamic> toMap() {
    return {
      'business-no': businessNo,
      'tel1': tel1,
      'tel2': tel2,
      'fax': fax,
      'note': note,
      'address': address,
    };
  }

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) => _$CustomerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoModelToJson(this);

  String? get getBusinessNo => businessNo;

  set setBusinessNo(String value) {
    businessNo = value;
  }

  String? get getTel1 => tel1;

  set setTel1(String value) {
    tel1 = value;
  }

  String? get getTel2 => tel2;

  set setTel2(String value) {
    tel2 = value;
  }

  String? get getFax => fax;

  set setFax(String value) {
    fax = value;
  }

  String? get getNote => note;

  set setNote(String value) {
    note = value;
  }

  String? get getAddress => address;

  set setAddress(String value) {
    address = value;
  }
}
