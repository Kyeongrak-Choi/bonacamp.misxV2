import 'package:json_annotation/json_annotation.dart';

part 'req_login.g.dart'; // *.g.dart : in same directory

// Login Request Model
@JsonSerializable(explicitToJson: true)
class ReqLoginModel {
  String id;
  String password;
  String appId;

  ReqLoginModel(
    this.id,
    this.password,
    this.appId,
  ); //

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'app-id': appId,
    };
  }

  factory ReqLoginModel.fromJson(Map<String, dynamic> json) => _$ReqLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqLoginModelToJson(this);
}
