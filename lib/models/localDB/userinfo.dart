import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userinfo.g.dart'; // *.g.dart : in same directory

// 사용자정보 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class UserinfoModel {
  @HiveField(0)
  String clientCd; // 사업장코드
  @HiveField(1)
  String clientNm; // 사업장명
  @HiveField(2)
  String userId; // 사용자ID
  @HiveField(3)
  String userNm; // 사용자이름
  @HiveField(4)
  String businessNo; // 사업자번호
  @HiveField(5)
  String systemCd; // 시스템구분
  @HiveField(6)
  String dbUid; // DB접속-ID

  UserinfoModel(this.clientCd, this.clientNm, this.userId, this.userNm, this.businessNo, this.systemCd, this.dbUid);

  Map<String, dynamic> toMap() {
    return {
      'clientCd': clientCd,
      'clientNm': clientNm,
      'userId': userId,
      'userNm': userNm,
      'businessNo': businessNo,
      'systemCd': systemCd,
      'dbUid': dbUid
    };
  }

  factory UserinfoModel.fromJson(Map<String, dynamic> json) => _$UserinfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserinfoModelToJson(this);

  String get getClientCd => clientCd;

  set setClientCd(String value) {
    clientCd = value;
  }

  String get getClientNm => clientNm;

  set setClientNm(String value) {
    clientNm = value;
  }

  String get getUserId => userId;

  set setUserId(String value) {
    userId = value;
  }

  String get getUserNm => userNm;

  set setUserNm(String value) {
    userNm = value;
  }

  String get getBusinessNo => businessNo;

  set setBusinessNo(String value) {
    businessNo = value;
  }

  String get getSystemCd => systemCd;

  set setSystemCd(String value) {
    systemCd = value;
  }

  String get getDbUid => dbUid;

  set setDbUid(String value) {
    dbUid = value;
  }
}
