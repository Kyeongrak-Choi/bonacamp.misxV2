// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchievementDetailsModel _$AchievementDetailsModelFromJson(
        Map<String, dynamic> json) =>
    AchievementDetailsModel(
      json['month'],
      json['sales-goal'],
      json['sales-amount'],
      json['sales-rate'],
      json['balance-goal'],
      json['last-balance'],
      json['variation-balance'],
      json['change-balance'],
      json['balance-rate'],
    );

Map<String, dynamic> _$AchievementDetailsModelToJson(
        AchievementDetailsModel instance) =>
    <String, dynamic>{
      'month': instance.month,
      'sales-goal': instance.salesGoal,
      'sales-amount': instance.salesAmount,
      'sales-rate': instance.salesRate,
      'balance-goal': instance.balanceGoal,
      'last-balance': instance.lastBalance,
      'variation-balance': instance.variationBalance,
      'change-balance': instance.changeBalance,
      'balance-rate': instance.balanceRate,
    };
