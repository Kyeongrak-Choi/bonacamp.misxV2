import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userinfo.g.dart'; // *.g.dart : in same directory

// 사용자정보 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class UserinfoModel {
  @HiveField(0)
  String clientCode; // 도매사코드
  @HiveField(1)
  String clientName; // 도매사명
  @HiveField(2)
  String businessNo; // 도매사 사업자번호
  @HiveField(3)
  String userId; // 사용자ID
  @HiveField(4)
  String userName; // 사용자이름
  @HiveField(5)
  String roleCode; // 권한 코드
  @HiveField(6)
  String schemaCode; // DB 스키마 코드

  UserinfoModel(this.clientCode, this.clientName, this.businessNo, this.userId, this.userName, this.roleCode, this.schemaCode);

  Map<String, dynamic> toMap() {
    return {
      'clientCode': clientCode,
      'clientName': clientName,
      'businessNo': businessNo,
      'userId': userId,
      'userName': userName,
      'roleCode': roleCode,
      'schemaCode': schemaCode
    };
  }

  factory UserinfoModel.fromJson(Map<String, dynamic> json) => _$UserinfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserinfoModelToJson(this);

  String get getClientCode => clientCode;

  set setClientCode(String value) {
    clientCode = value;
  }

  String get getClientName => clientName;

  set setClientName(String value) {
    clientName = value;
  }

  String get getUserId => userId;

  set setUserId(String value) {
    userId = value;
  }

  String get getUserName => userName;

  set setUserName(String value) {
    userName = value;
  }

  String get getBusinessNo => businessNo;

  set setBusinessNo(String value) {
    businessNo = value;
  }

  String get getRoleCode => roleCode;

  set setRoleCode(String value) {
    roleCode = value;
  }

  String get getSchemaCode => schemaCode;

  set setSchemaCode(String value) {
    schemaCode = value;
  }
}
