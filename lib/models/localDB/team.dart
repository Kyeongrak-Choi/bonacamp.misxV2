import 'package:hive/hive.dart';

part 'team.g.dart'; // *.g.dart : in same directory

// 사업장 Model
@HiveType(typeId: 4)
class TeamModel {
  @HiveField(0)
  String _subCd; // 팀코드
  @HiveField(1)
  String _subNm; // 팀명

  TeamModel(this._subCd, this._subNm);

  TeamModel.fromJson(Map data)
      : _subCd = data['SUB_CD'],
        _subNm = data['SUB_NM'];

  Map<String, dynamic> toMap() {
    return {'subCd': _subCd, 'subNm': _subNm};
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
