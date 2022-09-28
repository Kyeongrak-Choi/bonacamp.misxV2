import 'package:hive/hive.dart';

part 'node.g.dart'; // *.g.dart : in same directory

// 사업장 Model
@HiveType(typeId: 3)
class NodeModel {
  @HiveField(0)
  String _nodeCd; // 사업장코드:DA100T0
  @HiveField(1)
  String _comNm; // 회사 명
  @HiveField(2)
  String _braNm; // 지점 명
  @HiveField(3)
  String _reprNm; // 대표자 명
  @HiveField(4)
  String _bizrRegNo;

  NodeModel(this._nodeCd, this._comNm, this._braNm, this._reprNm,
      this._bizrRegNo); //사업자등록번호

  NodeModel.fromJson(Map data)
      : _nodeCd = data['NODE_CODE'],
        _comNm = data['COM_NM'],
        _braNm = data['BRA_NM'],
        _reprNm = data['REPR_NM'],
        _bizrRegNo = data['BIZR_REG_NO'];

  Map<String, dynamic> toMap() {
    return {
      'nodeCd': _nodeCd,
      'comNm': _comNm,
      'braNm': _braNm,
      'reprNm': _reprNm,
      'bizrRegNo': _bizrRegNo
    };
  }

  String get nodeCd => _nodeCd;

  set nodeCd(String value) {
    _nodeCd = value;
  }

  String get comNm => _comNm;

  set comNm(String value) {
    _comNm = value;
  }

  String get braNm => _braNm;

  set braNm(String value) {
    _braNm = value;
  }

  String get reprNm => _reprNm;

  set reprNm(String value) {
    _reprNm = value;
  }

  String get bizrRegNo => _bizrRegNo;

  set bizrRegNo(String value) {
    _bizrRegNo = value;
  }
}
