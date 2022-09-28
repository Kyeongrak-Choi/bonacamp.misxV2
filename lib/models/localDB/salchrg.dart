import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'salchrg.g.dart'; // *.g.dart : in same directory

// 영업 담당 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 2)
class SalChrgModel {
  @HiveField(0)
  String SAL_CHRG_CD; // 영업담당 코드:DA104T0
  @HiveField(1)
  String SAL_CHRG_NM; // 영업담당 명
  @HiveField(2)
  String MGMT_CHRGR_YN; // 관리 담당자 여부:ABS021-예/아니오

  SalChrgModel(this.SAL_CHRG_CD, this.SAL_CHRG_NM, this.MGMT_CHRGR_YN);

  Map<String, dynamic> toMap() {
    return {
      'SAL_CHRG_CD': SAL_CHRG_CD,
      'salChrgNm': SAL_CHRG_NM,
      'mgmtChrgrYn': MGMT_CHRGR_YN
    };
  }

  factory SalChrgModel.fromJson(Map<String, dynamic> json) =>
      _$SalChrgModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalChrgModelToJson(this);

  String get getSalChrgCd => SAL_CHRG_CD;

  set setSalChrgCd(String value) {
    SAL_CHRG_CD = value;
  }

  String get getSalChrgNm => SAL_CHRG_NM;

  set setSalChrgNm(String value) {
    SAL_CHRG_NM = value;
  }

  String get getMgmtChrgrYn => MGMT_CHRGR_YN;

  set setMgmtChrgrYn(String value) {
    MGMT_CHRGR_YN = value;
  }
}
