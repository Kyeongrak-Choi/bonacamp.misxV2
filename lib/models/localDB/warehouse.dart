import 'package:hive/hive.dart';

part 'warehouse.g.dart'; // *.g.dart : in same directory

// 창고 Model
@HiveType(typeId: 5)
class WarehouseModel {
  @HiveField(0)
  String _whCd; // 창고 코드
  @HiveField(1)
  String _whNm; // 창고 명

  WarehouseModel(this._whCd, this._whNm);

  Map<String, dynamic> toMap() {
    return {'whCd': _whCd, 'whNm': _whNm};
  }

  WarehouseModel.fromJson(Map data)
      : _whCd = data['WH_CD'],
        _whNm = data['WH_NM'];

  String get whCd => _whCd;

  set whCd(String value) {
    _whCd = value;
  }

  String get whNm => _whNm;

  set whNm(String value) {
    _whNm = value;
  }
}
