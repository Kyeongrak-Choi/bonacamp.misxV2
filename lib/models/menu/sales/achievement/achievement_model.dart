import 'package:json_annotation/json_annotation.dart';

import 'achievement_details_model.dart';

part 'achievement_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class AchievementModel {
  var code; // 영업사원 코드
  var name; // 영업사원 명
  List<AchievementDetailsModel> detailsList;
  int? id;

  AchievementModel(this.code, this.name, this.detailsList, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'details': detailsList,
    };
  }

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementModelToJson(this);
}

List<AchievementModel> generateAchievementModelList(dataList, count) {
  return List.generate(
      count,
      (index) => AchievementModel(
            dataList[index].code,
            dataList[index].name,
            generateAchievementDetailsModelList(dataList[index].detailsList,
                dataList[index].detailsList.length),
            id: index,
          ));
}
