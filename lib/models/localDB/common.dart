import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart'; // *.g.dart : in same directory

// 공통코드 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 6)
class CommonModel {
  @HiveField(0)
  String MAIN_CD; // 메인 코드
  @HiveField(1)
  String SUB_CD; // 서브 코드
  @HiveField(2)
  String SUB_NM; // 서브 명

  CommonModel(this.MAIN_CD, this.SUB_CD, this.SUB_NM);

  Map<String, dynamic> toMap() {
    return {'MAIN_CD': MAIN_CD, 'SUB_CD': SUB_NM, 'subNm': SUB_NM};
  }

  factory CommonModel.fromJson(Map<String, dynamic> json) => _$CommonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonModelToJson(this);

  String get getMainCd => MAIN_CD;

  set setMainCd(String value) {
    MAIN_CD = value;
  }

  String get getSubCd => SUB_CD;

  set setSubCd(String value) {
    SUB_CD = value;
  }

  String get getSubNm => SUB_NM;

  set setSubNm(String value) {
    SUB_NM = value;
  }
}
