// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchievementModel _$AchievementModelFromJson(Map<String, dynamic> json) =>
    AchievementModel(
      json['code'],
      json['name'],
      (json['details'] as List<dynamic>)
          .map((e) =>
              AchievementDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AchievementModelToJson(AchievementModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'details': instance.detailsList.map((e) => e.toJson()).toList(),
    };
