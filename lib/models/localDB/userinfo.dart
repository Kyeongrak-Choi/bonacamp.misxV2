import 'package:hive/hive.dart';

part 'userinfo.g.dart'; // *.g.dart : in same directory

// 사용자정보 Model
@HiveType(typeId: 1)
class UserinfoModel {
  // in front of variable '_' -> private
  @HiveField(0)
  String _clientCd; // 사업장코드
  @HiveField(1)
  String _clientNm; // 사업장명
  @HiveField(2)
  String _userId; // 사용자ID
  @HiveField(3)
  String _userNm; // 사용자이름
  @HiveField(4)
  String _businessNo; // 사업자번호
  @HiveField(5)
  String _systemCd; // 시스템구분
  @HiveField(6)
  String _dbUid; // DB접속-ID

  UserinfoModel(this._clientCd, this._clientNm, this._userId, this._userNm,
      this._businessNo, this._systemCd, this._dbUid);

  UserinfoModel.fromJson(Map data)
      : _clientCd = data['CLIENT_CODE'],
        _clientNm = data['CLIENT_NAME'],
        _userId = data['USER_ID'],
        _userNm = data['USER_NAME'],
        _businessNo = data['BUSINESS_NO'],
        _systemCd = data['SYSTEM_CD'],
        _dbUid = data['DB_UID'];

  Map<String, dynamic> toMap() {
    return {
      'clientCode': _clientCd,
      'clientName': _clientNm,
      'userId': _userId,
      'userName': _userNm,
      'businessNo': _businessNo,
      'systemCd': _systemCd,
      'dbUid': _dbUid
    };
  }

  String get clientCd => _clientCd;

  set clientCd(String value) {
    _clientCd = value;
  }

  String get clientNm => _clientNm;

  set clientNm(String value) {
    _clientNm = value;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  String get userNm => _userNm;

  set userNm(String value) {
    _userNm = value;
  }

  String get businessNo => _businessNo;

  set businessNo(String value) {
    _businessNo = value;
  }

  String get systemCd => _systemCd;

  set systemCd(String value) {
    _systemCd = value;
  }

  String get dbUid => _dbUid;

  set dbUid(String value) {
    _dbUid = value;
  }
}
