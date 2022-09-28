import 'package:hive/hive.dart';

part 'common.g.dart'; // *.g.dart : in same directory

// 공통코드 Model
@HiveType(typeId: 6)
class CommonModel {
  @HiveField(0)
  String _mainCd; // 메인 코드
  @HiveField(1)
  String _subCd; // 서브 코드
  @HiveField(2)
  String _subNm; // 서브 명

  CommonModel(this._mainCd, this._subCd, this._subNm);

  Map<String, dynamic> toMap() {
    return {'mainCd': _mainCd, 'subCd': _subCd, 'subNm': _subNm};
  }

  CommonModel.fromJson(Map data)
      : _mainCd = data['MAIN_CD'],
        _subCd = data['SUB_CD'],
        _subNm = data['SUB_NM'];

  String get mainCd => _mainCd;

  set mainCd(String value) {
    _mainCd = value;
  }

  String get subCd => _subCd;

  set subCd(String value) {
    _subCd = value;
  }

  String get subNm => _subNm;

  set subNm(String value) {
    _subNm = value;
  }
}
