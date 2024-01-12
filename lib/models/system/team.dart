import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart'; // *.g.dart : in same directory

// 팀 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 4)
class TeamModel {
  @HiveField(0)
  String? teamCode; // 팀코드
  @HiveField(1)
  String? teamName; // 팀명

  TeamModel(this.teamCode, this.teamName);

  Map<String, dynamic> toMap() {
    return {'team-code': teamCode, 'team-name': teamName};
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);

  String? get getTeamCode => teamCode;

  set setTeamCode(String value) {
    teamCode = value;
  }

  String? get getTeamName => teamName;

  set setTeamName(String value) {
    teamName = value;
  }
}
