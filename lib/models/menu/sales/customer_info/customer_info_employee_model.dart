import 'package:json_annotation/json_annotation.dart';

part 'customer_info_employee_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class CustomerInfoEmployeeModel {
  String? salesRep;
  String? manager;
  String? email;

  CustomerInfoEmployeeModel(this.salesRep, this.manager, this.email);

  Map<String, dynamic> toMap() {
    return {
      'sales-rep': salesRep,
      'manager': manager,
      'email': email,
    };
  }

  factory CustomerInfoEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoEmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoEmployeeModelToJson(this);

  String? get getSalesRep => salesRep;

  set setSalesRep(String value) {
    salesRep = value;
  }

  String? get getManager => manager;

  set setManager(String value) {
    manager = value;
  }

  String? get getEmail => email;

  set setEmail(String value) {
    email = value;
  }
}
