// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lenditem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendItemModel _$LendItemModelFromJson(Map<String, dynamic> json) =>
    LendItemModel(
      json['lendItmCd'] as String?,
      json['lendItmNm'] as String?,
      json['stnd'] as String?,
      json['ut'] as String?,
      json['utNm'] as String?,
      json['vesFg'] as String?,
      json['vesFgNm'] as String?,
      json['emptyBotlCd'] as String?,
      json['emptyBotlNm'] as String?,
    );

Map<String, dynamic> _$LendItemModelToJson(LendItemModel instance) =>
    <String, dynamic>{
      'lendItmCd': instance.lendItmCd,
      'lendItmNm': instance.lendItmNm,
      'stnd': instance.stnd,
      'ut': instance.ut,
      'utNm': instance.utNm,
      'vesFg': instance.vesFg,
      'vesFgNm': instance.vesFgNm,
      'emptyBotlCd': instance.emptyBotlCd,
      'emptyBotlNm': instance.emptyBotlNm,
    };
