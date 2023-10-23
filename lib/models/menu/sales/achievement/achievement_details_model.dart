import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'achievement_details_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class AchievementDetailsModel {
  var month;
  var salesGoal;
  var salesAmount;
  var salesRate;
  var balanceGoal;
  var lastBalance;
  var variationBalance;
  var changeBalance;
  var balanceRate;
  int? id;

  AchievementDetailsModel(
      this.month, this.salesGoal, this.salesAmount, this.salesRate, this.balanceGoal,
      this.lastBalance, this.variationBalance, this.changeBalance, this.balanceRate, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'month': month,
      'sales-goal': salesGoal,
      'sales-amount': salesAmount,
      'sales-rate': salesRate,
      'balance-goal': balanceGoal,
      'last-balance': lastBalance,
      'variation-balance': variationBalance,
      'change-balance': changeBalance,
      'balance-rate': balanceRate,
    };
  }

  factory AchievementDetailsModel.fromJson(Map<String, dynamic> json) => _$AchievementDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementDetailsModelToJson(this);
}

List<AchievementDetailsModel> generateAchievementDetailsModelList(dataList, count) {
  return List.generate(
      count,
          (index) =>
          AchievementDetailsModel(
            dataList[index].month,
            numberFormat.format(dataList[index].salesGoal),
            numberFormat.format(dataList[index].salesAmount),
            dataList[index].salesRate,
            numberFormat.format(dataList[index].balanceGoal),
            numberFormat.format(dataList[index].lastBalance),
            numberFormat.format(dataList[index].variationBalance),
            numberFormat.format(dataList[index].changeBalance),
            dataList[index].balanceRate,
            id: index,
          ));
}
