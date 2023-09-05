import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart'; // *.g.dart : in same directory

// 팀 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 4)
class TeamModel {
  @HiveField(0)
  String teamCd; // 팀코드
  @HiveField(1)
  String teamNm; // 팀명

  TeamModel(this.teamCd, this.teamNm);

  Map<String, dynamic> toMap() {
    return {'teamCd': teamCd, 'teamNm': teamNm};
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);

  String get getSubCd => teamCd;

  set setSubCd(String value) {
    teamCd = value;
  }

  String get getSubNm => teamNm;

  set setSubNm(String value) {
    teamNm = value;
  }
}
