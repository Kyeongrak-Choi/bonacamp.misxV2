import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart'; // *.g.dart : in same directory

// 팀 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 4)
class TeamModel {
  @HiveField(0)
  String SUB_CD; // 팀코드
  @HiveField(1)
  String SUB_NM; // 팀명

  TeamModel(this.SUB_CD, this.SUB_NM);

  Map<String, dynamic> toMap() {
    return {'SUB_CD': SUB_CD, 'SUB_NM': SUB_NM};
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);

  String get getSubCd => SUB_CD;

  set setSubCd(String value) {
    SUB_CD = value;
  }

  String get getSubNm => SUB_NM;

  set setSubNm(String value) {
    SUB_NM = value;
  }
}
