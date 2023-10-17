import 'package:json_annotation/json_annotation.dart';

part 'customer_info_representative_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class CustomerInfoRepresentativeModel {
  String? name;
  String? phone;
  String? birthDay;
  String? address;


  CustomerInfoRepresentativeModel(this.name, this.phone, this.birthDay, this.address);

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'phone' : phone,
      'birth-day' : birthDay,
      'address' : address,
    };
  }

  factory CustomerInfoRepresentativeModel.fromJson(Map<String, dynamic> json) => _$CustomerInfoRepresentativeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoRepresentativeModelToJson(this);

  String? get getName => name;

  set setName(String value) {
    name = value;
  }

  String? get getPhone => phone;

  set setPhone(String value) {
    phone = value;
  }

  String? get getBirthDay => birthDay;

  set setBirthDay(String value) {
    birthDay = value;
  }

  String? get getAddress => address;

  set setAddress(String value) {
    address = value;
  }
}