import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'node.g.dart'; // *.g.dart : in same directory

// 사업장 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 3)
class NodeModel {
  @HiveField(0)
  String NODE_CODE; // 사업장코드:DA100T0
  @HiveField(1)
  String COM_NM; // 회사 명
  @HiveField(2)
  String BRA_NM; // 지점 명
  @HiveField(3)
  String REPR_NM; // 대표자 명
  @HiveField(4)
  String BIZR_REG_NO; //사업자등록번호

  NodeModel(
      this.NODE_CODE, this.COM_NM, this.BRA_NM, this.REPR_NM, this.BIZR_REG_NO);

  Map<String, dynamic> toMap() {
    return {
      'NODE_CODE': NODE_CODE,
      'COM_NM': COM_NM,
      'BRA_NM': BRA_NM,
      'REPR_NM': REPR_NM,
      'BIZR_REG_NO': BIZR_REG_NO
    };
  }

  factory NodeModel.fromJson(Map<String, dynamic> json) =>
      _$NodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NodeModelToJson(this);

  String get getNodeCd => NODE_CODE;

  set setNodeCd(String value) {
    NODE_CODE = value;
  }

  String get getComNm => COM_NM;

  set setComNm(String value) {
    COM_NM = value;
  }

  String get getBraNm => BRA_NM;

  set setBraNm(String value) {
    BRA_NM = value;
  }

  String get getReprNm => REPR_NM;

  set setReprNm(String value) {
    REPR_NM = value;
  }

  String get getBizrRegNo => BIZR_REG_NO;

  set setBizrRegNo(String value) {
    BIZR_REG_NO = value;
  }
}
