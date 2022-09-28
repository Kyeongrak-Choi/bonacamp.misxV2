import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userinfo.g.dart'; // *.g.dart : in same directory

// 사용자정보 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class UserinfoModel {
  @HiveField(0)
  String CLIENT_CODE; // 사업장코드
  @HiveField(1)
  String CLIENT_NAME; // 사업장명
  @HiveField(2)
  String USER_ID; // 사용자ID
  @HiveField(3)
  String USER_NAME; // 사용자이름
  @HiveField(4)
  String BUSINESS_NO; // 사업자번호
  @HiveField(5)
  String SYSTEM_CD; // 시스템구분
  @HiveField(6)
  String DB_UID; // DB접속-ID

  UserinfoModel(this.CLIENT_CODE, this.CLIENT_NAME, this.USER_ID,
      this.USER_NAME, this.BUSINESS_NO, this.SYSTEM_CD, this.DB_UID);

  Map<String, dynamic> toMap() {
    return {
      'CLIENT_CODE': CLIENT_CODE,
      'CLIENT_NAME': CLIENT_NAME,
      'USER_ID': USER_ID,
      'USER_NAME': USER_NAME,
      'BUSINESS_NO': BUSINESS_NO,
      'SYSTEM_CD': SYSTEM_CD,
      'DB_UID': DB_UID
    };
  }

  factory UserinfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserinfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserinfoModelToJson(this);

  String get getClientCd => CLIENT_CODE;

  set setClientCd(String value) {
    CLIENT_CODE = value;
  }

  String get getClientNm => CLIENT_NAME;

  set setClientNm(String value) {
    CLIENT_NAME = value;
  }

  String get getUserId => USER_ID;

  set setUserId(String value) {
    USER_ID = value;
  }

  String get getUserNm => USER_NAME;

  set setUserNm(String value) {
    USER_NAME = value;
  }

  String get getBusinessNo => BUSINESS_NO;

  set setBusinessNo(String value) {
    BUSINESS_NO = value;
  }

  String get getSystemCd => SYSTEM_CD;

  set setSystemCd(String value) {
    SYSTEM_CD = value;
  }

  String get getDbUid => DB_UID;

  set setDbUid(String value) {
    DB_UID = value;
  }
}
