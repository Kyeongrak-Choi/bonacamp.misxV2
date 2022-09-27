import 'package:hive/hive.dart';

part 'salchrg.g.dart'; // *.g.dart : in same directory

// 영업 담당 Model
@HiveType(typeId: 2)
class SalChrgModel {
  @HiveField(0)
  String _salChrgCd; // 영업담당 코드:DA104T0
  @HiveField(1)
  String _salChrgNm; // 영업담당 명
  @HiveField(2)
  String _mgmtChrgrYn; // 관리 담당자 여부:ABS021-예/아니오

  SalChrgModel(this._salChrgCd, this._salChrgNm, this._mgmtChrgrYn);

  SalChrgModel.fromJson(Map data)
      : _salChrgCd = data['SAL_CHRG_CD'],
        _salChrgNm = data['SAL_CHRG_NM'],
        _mgmtChrgrYn = data['MGMT_CHRGR_YN'];

  Map<String, dynamic> toMap() {
    return {
      'salChrgCd': _salChrgCd,
      'salChrgNm': _salChrgNm,
      'mgmtChrgrYn': _mgmtChrgrYn
    };
  }

  String get salChrgCd => _salChrgCd;

  set salChrgCd(String value) {
    _salChrgCd = value;
  }

  String get salChrgNm => _salChrgNm;

  set salChrgNm(String value) {
    _salChrgNm = value;
  }

  String get mgmtChrgrYn => _mgmtChrgrYn;

  set mgmtChrgrYn(String value) {
    _mgmtChrgrYn = value;
  }
}
