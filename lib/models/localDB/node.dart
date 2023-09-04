import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'node.g.dart'; // *.g.dart : in same directory

// 사업장 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 3)
class NodeModel {
  @HiveField(0)
  String nodeCd; // 사업장코드:DA100T0
  @HiveField(1)
  String comNm; // 회사 명
  @HiveField(2)
  String braNm; // 지점 명
  @HiveField(3)
  String reprNm; // 대표자 명
  @HiveField(4)
  String bizrRegNo; //사업자등록번호

  NodeModel(this.nodeCd, this.comNm, this.braNm, this.reprNm, this.bizrRegNo);

  Map<String, dynamic> toMap() {
    return {'nodeCd': nodeCd, 'comNm': comNm, 'braNm': braNm, 'reprNm': reprNm, 'bizrRegNo': bizrRegNo};
  }

  factory NodeModel.fromJson(Map<String, dynamic> json) => _$NodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NodeModelToJson(this);

  String get getNodeCd => nodeCd;

  set setNodeCd(String value) {
    nodeCd = value;
  }

  String get getComNm => comNm;

  set setComNm(String value) {
    comNm = value;
  }

  String get getBraNm => braNm;

  set setBraNm(String value) {
    braNm = value;
  }

  String get getReprNm => reprNm;

  set setReprNm(String value) {
    reprNm = value;
  }

  String get getBizrRegNo => bizrRegNo;

  set setBizrRegNo(String value) {
    bizrRegNo = value;
  }
}
